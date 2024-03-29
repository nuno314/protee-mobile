import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/family.dart';
import '../../../../base/base.dart';
import '../interactor/join_family_requests_interactor.dart';
import '../repository/join_family_requests_repository.dart';

part 'join_family_requests_event.dart';
part 'join_family_requests_state.dart';

class JoinFamilyRequestsBloc
    extends AppBlocBase<JoinFamilyRequestsEvent, JoinFamilyRequestsState> {
  late final _interactor = JoinFamilyRequestsInteractorImpl(
    JoinFamilyRequestsRepositoryImpl(),
  );

  JoinFamilyRequestsBloc()
      : super(JoinFamilyRequestsInitial(viewModel: const _ViewModel())) {
    on<GetJoinRequestsEvent>(_onGetJoinRequestsEvent);
    on<ApproveRequestEvent>(_onApprovalRequestEvent);
    on<RejectRequestEvent>(_onRejectRequestEvent);
  }

  Future<void> _onGetJoinRequestsEvent(
    GetJoinRequestsEvent event,
    Emitter<JoinFamilyRequestsState> emit,
  ) async {
    final data = await _interactor.getData();
    emit(
      state.copyWith<JoinFamilyRequestsInitial>(
        viewModel: state.viewModel.copyWith(
          requests: data,
        ),
      ),
    );
  }

  FutureOr<void> _onApprovalRequestEvent(
    ApproveRequestEvent event,
    Emitter<JoinFamilyRequestsState> emit,
  ) async {
    final res = await _interactor.approveRequest(event.id);
    if (res == true) {
      emit(
        state.copyWith<RequestApprovedState>(),
      );
    }
  }

  FutureOr<void> _onRejectRequestEvent(
    RejectRequestEvent event,
    Emitter<JoinFamilyRequestsState> emit,
  ) async {
    final res = await _interactor.rejectRequest(event.id);
    if (res == true) {
      emit(
        state.copyWith<RequestRejectedState>(),
      );
    }
  }
}
