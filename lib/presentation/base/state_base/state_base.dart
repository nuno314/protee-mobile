part of '../base.dart';

abstract class StateBase<T extends StatefulWidget> extends State<T>
    implements ApiServiceDelegate {
  //prevent show the same error dialog when call multiple api at the same time
  ErrorType? errorTypeShowing;
  var _isLoadingShowing = false;

  AppLocalizations get trans => translate(context);

  bool get isLoading => _isLoadingShowing;

  AppBlocBase? get bloc;

  bool get willHandleError => true;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    LogUtils.d('[${T.toString()}] initState');
    if (willHandleError) {
      bloc?.errorHandler = onError;
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    ClientInfo.languageCode = languageCode;
    super.didChangeDependencies();
  }

  @override
  @mustCallSuper
  void dispose() {
    LogUtils.d('[${T.toString()}] dispose');
    super.dispose();
  }

  void showLoading() {
    if (!_isLoadingShowing) {
      _isLoadingShowing = true;
      EasyLoading.show(
        status: translate(context).processing,
        indicator: const Loading(),
      );
    }
  }

  void hideLoading() {
    if (_isLoadingShowing) {
      _isLoadingShowing = false;
      EasyLoading.dismiss();
    }
  }

  @override
  void onError(ErrorData error) {
    hideLoading();
    _onError(error);
  }

  void showErrorDialog(String? message, {Function()? onClose}) {
    showNoticeErrorDialog(
      context: context,
      message: message?.isNotEmpty != true
          ? translate(context).technicalIssues
          : message!,
      onClose: () {
        onCloseErrorDialog();
        onClose?.call();
      },
    );
  }

  @mustCallSuper
  void onCloseErrorDialog() {
    errorTypeShowing = null;
  }

  void showNoInternetDialog() {
    showNoticeDialog(
      context: context,
      message: translate(context).noInternet,
      onClose: onCloseErrorDialog,
    );
  }

  void onLogicError(String? message) {
    showErrorDialog(message);
  }

  Widget baseLoading() {
    return const Loading();
  }

  void requireLogin({required Function() onSuccess, Function()? onSkip}) {
    // if (injector.get<AuthService>().isSignedIn) {
    //   onSuccess.call();
    //   return;
    // }
    final trans = translate(context);
    showNoticeConfirmDialog(
      context: context,
      message: trans.loginRequired,
      title: trans.inform,
      rightBtn: trans.login,
      leftBtn: trans.skip,
      onConfirmed: () {
        backToAuth(onSuccess: onSuccess, onSkip: onSkip);
      },
    );
  }

  Future<void> openWeb({String? title, String? url, String? html}) async {
    await Navigator.of(context).pushNamed(
      RouteList.webview,
      arguments: WebviewArgs(
        title: title,
        html: html,
        url: url,
      ),
    );
  }

  String get languageCode =>
      context.read<AppDataBloc>().state.locale.languageCode;

  void showLoginNoticeDialog({
    required Function() onSuccess,
    Function()? onSkip,
  }) {
    showNoticeConfirmDialog(
      context: context,
      message: trans.loginRequired,
      title: trans.inform,
      rightBtn: trans.login,
      leftBtn: trans.skip,
      onConfirmed: () {
        backToAuth(onSuccess: onSuccess, onSkip: onSkip);
      },
    );
  }

  void backToAuth({
    Function()? onSuccess,
    Function()? onSkip,
  }) {
    Navigator.pushNamed(context, RouteList.signIn).then((value) {
      if (value is bool && value) {
        syncData();
        onSuccess?.call();
      } else {
        onSkip?.call();
      }
    });
  }

  void syncData() {
    if (injector.get<AuthService>().isSignedIn) {}
  }

  Future<void> doLogout() async {
    showLoading();
    await injector.get<AuthService>().signOut();
    await injector.get<GoogleSignIn>().signOut();
  }

  Future<bool> checkLocationPermission() async {
    final granted = await PermissionService().checkPermission(
      Permission.location,
      context,
    );
    if (!granted) {
      final status = await PermissionService().requestPermission(
        Permission.location,
        context,
      );

      if (status) {
        if (await Geolocator.isLocationServiceEnabled()) {
          await context.read<LocationCubit>().refreshLocation();
          return true;
        } else {
          unawaited(
            showNoticeDialog(
              context: context,
              message: trans.pleaseEnableGPS,
            ),
          );
          return false;
        }
      }
      return status;
    } else {
      context.read<LocationCubit>().getLastKnownLocation();
    }
    return granted;
  }
}
