import 'package:chitpur/data/controller/ui/theme.controller.dart';
import 'package:chitpur/dependency_injection.dart';
import 'package:chitpur/firebase_options.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/theme/app_theme.dart';
import 'package:chitpur/routes/route.dart';
import 'package:chitpur/routes/route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/services/shared_pref_service.dart';

/// Main function
Future<void> main() async {
  // Initialize flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefService().init();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //dependency injection
  DependencyInjection().init();

  // Run the app
  runApp(MyApp());
}

/// Main application widget
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  /// Build method
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // App title
          title: AppString.appName,
          // App theme
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: controller.getThemeMode(),
          // Home widget
          // home: UItest(),
          // List of routes
          initialRoute: RouteNames.splashScreen,
          getPages: [
            ...AppRoutes.appRoutes(),
          ],
        );
      },
    );
  }
}
