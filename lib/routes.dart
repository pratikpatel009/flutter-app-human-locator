

import 'package:location_tracking/location_tracking.dart';
import 'package:location_tracking/pages/first_page.dart';
import 'package:location_tracking/pages/login_page.dart';
import 'package:location_tracking/pages/register_page.dart';
import 'package:location_tracking/pages/splash_page.dart';

const String SplashRoute = "/splash";
const String HomeRoute = "/home";
const String LoginRoute = "/login";
const String RegisterRoute = "/register";
const String LocationtackerRoute = "/location_tracker";

final routes = {
  SplashRoute: (context) => const SplashPage(),
  HomeRoute: (context) => const HomePage(),
  LoginRoute: (context) => const LoginPage(),
  RegisterRoute: (context) => const RegisterPage(),
  LocationtackerRoute: (context) => const LocationTracking(),
};