import 'package:chitpur/dependency_injection.dart';
import 'package:chitpur/firebase_options.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/app_theme.dart';
import 'package:chitpur/routes/route.dart';
import 'package:chitpur/routes/route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Main function
Future<void> main() async {
  // Initialize flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //dependency injection
  DependencyInjection().init();

  // Run the app
  runApp(const MyApp());
}

/// Main application widget
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  /// Build method
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // App title
      title: AppString.appName,
      // App theme
      theme: appTheme,
      initialRoute: RouteNames.splashScreen,
      // Home widget
      // home: const SplashScreen(),
      // List of routes
      getPages: [
        ...AppRoutes.appRoutes(),
      ],
    );
  }
}
