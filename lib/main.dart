import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/modules/splash/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/routes/app_routes_name.dart';
import 'core/routes/route_gen.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGen.onGenerateRoute,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: RouteName.Splash,
    );
  }
}
