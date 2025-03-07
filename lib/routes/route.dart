import 'package:chitpur/routes/route_name.dart';
import 'package:chitpur/view/screens/auth/auth.screen.dart';
import 'package:chitpur/view/screens/home_scren.dart';
import 'package:chitpur/view/screens/microprocessor/data_add.microprocessor.dart';
import 'package:chitpur/view/screens/microprocessor/data_list.microprocessor.com.dart';
import 'package:chitpur/view/screens/microprocessor/data_search.microprocessor.dart';
import 'package:chitpur/view/screens/microprocessor/home_screen.microprocessor.dart';
import 'package:chitpur/view/screens/network_error.screens.dart';
import 'package:chitpur/view/screens/auth/profile.screen.dart';
import 'package:chitpur/view/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define the application routes
  static appRoutes() => [
        // Route for the splash screen
        GetPage(
          name: RouteNames.splashScreen,
          page: () => SplashScreen(),
          transition: Transition.rightToLeft,
        ),
        // Route for the home screen
        GetPage(
          name: RouteNames.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.rightToLeft,
        ),
        // Route for the authentication screen
        GetPage(
          name: RouteNames.authScreen,
          page: () => AuthScreen(),
          transition: Transition.rightToLeft,
        ),
        // Route for the microprocessor home screen
        GetPage(
          name: RouteNames.microprocessorScreen,
          page: () => HomeScreenMP(),
          transition: Transition.rightToLeft,
        ),
        // Route for the data list microprocessor screen
        GetPage(
          name: RouteNames.dataListMPScreen,
          page: () => DataListMP(),
          transition: Transition.rightToLeft,
        ),
        // Route for the data search microprocessor screen
        GetPage(
          name: RouteNames.dataSearchMPScreen,
          page: () => DataSearchMP(),
          transition: Transition.rightToLeft,
        ),
        // Route for the data add microprocessor screen
        GetPage(
          name: RouteNames.dataAddMPScreen,
          page: () => DataAddMP(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteNames.networkError,
          page: () => NetworkErrorScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteNames.profileScreen,
          page: () => ProfileScreen(),
          transition: Transition.rightToLeft,
        )
      ];
}
