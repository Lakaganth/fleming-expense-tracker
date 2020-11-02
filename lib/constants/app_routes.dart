import 'package:fleming_expense_tracker/screens/2.authenitication/login_screen.dart';
import 'package:fleming_expense_tracker/screens/2.authenitication/register_screen.dart';
import 'package:fleming_expense_tracker/screens/3.dashboard/dashboard_screen.dart';
import 'package:fleming_expense_tracker/utilities/root.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => Root()),
    GetPage(name: '/signin', page: () => LoginScreen()),
    GetPage(name: '/signup', page: () => RegisterScreen()),
    GetPage(name: '/home', page: () => DashboardScreen()),
    // GetPage(name: '/settings', page: () => SettingsUI()),
    // GetPage(name: '/reset-password', page: () => ResetPasswordUI()),
    // GetPage(name: '/update-profile', page: () => UpdateProfileUI()),
  ];
}
