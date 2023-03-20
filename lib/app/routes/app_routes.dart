part of 'app_pages.dart';


abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const APOINMENT = _Paths.APOINMENT;
  static const MYREPORT = _Paths.MYREPORT;
  static const PROFILE = _Paths.PROFILE;
  //static const NAVIGATION = _Paths.NAVIGATION;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const APOINMENT = '/apoinment';
  static const MYREPORT = '/myreport';
  static const PROFILE = '/profile';
  //static const NAVIGATION = '/navigation';

}
