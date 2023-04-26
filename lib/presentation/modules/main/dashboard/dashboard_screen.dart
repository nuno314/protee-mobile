import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/services/onesignal_notification_service.dart';
import '../../../../common/utils.dart';
import '../../../../di/di.dart';
import '../../../../generated/assets.dart';
import '../../../base/base.dart';
import '../../../common_widget/export.dart';
import '../../../extentions/extention.dart';
import '../../../theme/theme_color.dart';
import '../account/bloc/account_bloc.dart';
import '../account/views/account_screen.dart';
import '../home_page/home_page.dart';
import '../location/bloc/location_bloc.dart';
import '../location/views/location_screen.dart';
import 'cubit/dashboard_cubit.dart';
import 'dashboard_constants.dart';

part 'dashboard.action.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends StateBase<DashboardScreen>
    with AfterLayoutMixin, WidgetsBindingObserver {
  DashboardCubit get _cubit => BlocProvider.of(context);

  final _pageController = PageController();

  StreamSubscription? connectivitySub;
  @override
  void afterFirstLayout(BuildContext context) {
    syncData();
    _cubit
      ..navigateTo(DashboardPage.home.index)
      ..markLaunched();
    _updateOnesignal();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    connectivitySub = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if ([
        ConnectivityResult.wifi,
        ConnectivityResult.ethernet,
        ConnectivityResult.mobile
      ].contains(result)) {
        syncData();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    connectivitySub?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChangeAppLifecycleState(state);
  }

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  late AppLocalizations trans;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16 + 65,
              ),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  KeepAliveWidget(
                    child: BlocProvider(
                      create: (context) => HomePageBloc(),
                      child: const HomePageScreen(),
                    ),
                  ),
                  Container(),
                  KeepAliveWidget(
                    child: BlocProvider(
                      create: (context) => LocationBloc(),
                      child: const LocationScreen(),
                    ),
                  ),
                  Container(),
                  KeepAliveWidget(
                    child: BlocProvider(
                      create: (context) => AccountBloc(),
                      child: const AccountScreen(),
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<DashboardCubit, DashboardState>(
              listener: _cubitListener,
              bloc: _cubit,
              builder: (context, state) => CustomBottomNavigationBar(
                items: [
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.svg.icHome,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.svg.icHomeFilled,
                    ),
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.svg.icMess,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.svg.icMessFilled,
                    ),
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.svg.icMarker,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.svg.icMarkerFilled,
                    ),
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.svg.icNoti,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.svg.icNotiFilled,
                    ),
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.svg.icAccount,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.svg.icAccountFilled,
                    ),
                  ),
                ],
                selectedIdx: state.index,
                onItemSelection: onNavigationPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarIcon({
    required String asset,
    void Function()? ontap,
  }) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: SvgPicture.asset(
          asset,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  @override
  AppBlocBase? get bloc => null;
}
