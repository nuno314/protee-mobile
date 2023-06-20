import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../common/utils/extensions.dart';
import '../../../../../data/data_source/remote/app_api_service.dart';
import '../../../../../data/models/location.dart';
import '../../../../../data/models/user.dart';
import '../../../../../di/di.dart';
import '../../../../base/base.dart';
import '../interactor/location_tracking_interactor.dart';
import '../repository/location_tracking_repository.dart';

part 'location_tracking_event.dart';
part 'location_tracking_state.dart';

class LocationTrackingBloc
    extends AppBlocBase<LocationTrackingEvent, LocationTrackingState> {
  late final _interactor = LocationTrackingInteractorImpl(
    LocationTrackingRepositoryImpl(),
  );

  late StreamSubscription _profileSubscription;

  LocationTrackingBloc(User? user)
      : super(
          LocationTrackingInitial(
            viewModel: _ViewModel(
              user: user,
            ),
          ),
        ) {
    on<GetPlacesEvent>(_onGetPlacesEvent);
    on<ChangeCurentLocation>(_onChangeCurentLocation);
    on<GetWarningLocationNearbyEvent>(_onGetWarningLocationNearbyEvent);
    on<UpdateUserEvent>(_onUpdateUserEvent);
    on<GetChildrenLastLocationEvent>(_onGetChildrenLastLocationEvent);
    on<GetChildrenEvent>(_onGetChildrenEvent);

    on<GetDirectionsEvent>(_onGetDirectionsEvent);

    if (user?.isParent == false || state.isParent == false) {
      add(GetPlacesEvent());
    } else {
      add(GetChildrenEvent());
    }

    _profileSubscription =
        injector.get<AppApiService>().localDataManager.onUserChanged.listen(
      (user) {
        add(
          UpdateUserEvent(user),
        );
      },
    );
  }

  Future<void> _onChangeCurentLocation(
    ChangeCurentLocation event,
    Emitter<LocationTrackingState> emit,
  ) async {
    if (state.latLng == null ||
        event.location.distanceFrom(state.latLng!)! > 500) {
      emit(
        state.copyWith<CurrentLocationChangedState>(
          viewModel: state.viewModel.copyWith(latLng: event.location),
        ),
      );
    }
  }

  FutureOr<void> _onGetWarningLocationNearbyEvent(
    GetWarningLocationNearbyEvent event,
    Emitter<LocationTrackingState> emit,
  ) async {
    final places = await _interactor.getWarningLocationNearby(state.latLng!);

    emit(
      state.copyWith<LocationTrackingInitial>(
        viewModel: state.viewModel.copyWith(
          warningPlaces: places,
        ),
      ),
    );
  }

  FutureOr<void> _onGetPlacesEvent(
    GetPlacesEvent event,
    Emitter<LocationTrackingState> emit,
  ) async {
    final places = await _interactor.getPlaces();

    emit(
      state.copyWith<LocationTrackingInitial>(
        viewModel: state.viewModel.copyWith(
          places: places,
        ),
      ),
    );
  }

  FutureOr<void> _onUpdateUserEvent(
    UpdateUserEvent event,
    Emitter<LocationTrackingState> emit,
  ) {
    emit(
      state.copyWith<LocationTrackingInitial>(
        viewModel: state.viewModel.copyWith(
          user: event.user,
        ),
      ),
    );
  }

  FutureOr<void> _onGetDirectionsEvent(
    GetDirectionsEvent event,
    Emitter<LocationTrackingState> emit,
  ) async {
    final origin = await _interactor.getGeocode(state.latLng!);

    if (origin.isNotNullOrEmpty) {
      final res = await _interactor.getDirections(
        origin!,
        event.destination,
        state.warningPlaces,
      );
      emit(
        state.copyWith<GetRouteState>(
          viewModel: state.viewModel.copyWith(routes: res),
        ),
      );
    }
  }

  FutureOr<void> _onGetChildrenLastLocationEvent(
    GetChildrenLastLocationEvent event,
    Emitter<LocationTrackingState> emit,
  ) async {
    final res = await Future.wait<ChildLastLocation?>(
      List.generate(
        state.children.length,
        (index) => _interactor
            .getChildLastLocation(state.children.elementAt(index).id!),
      ),
      eagerError: true,
    );

    final list = List<ChildLastLocation?>.generate(
      state.children.length,
      res.elementAt,
    );

    emit(
      state.copyWith<ChildrenLastLocationState>(
        viewModel: state.viewModel.copyWith(
          lastLocations: list,
        ),
      ),
    );
  }

  FutureOr<void> _onGetChildrenEvent(
    GetChildrenEvent event,
    Emitter<LocationTrackingState> emit,
  ) async {
    final children = await _interactor.getChildren();
    emit(
      state.copyWith<ChildrenInitialState>(
        viewModel: state.viewModel.copyWith(
          children: children,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _profileSubscription.cancel();
    return super.close();
  }
}
