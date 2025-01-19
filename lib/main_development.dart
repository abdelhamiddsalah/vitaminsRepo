import 'package:flutter/material.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/routing/app_routes.dart';
import 'package:vitamins/core/shared/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String initialRoute = '/';
  final AppRoutes appRoutes = AppRoutes();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Overpass',
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: appRoutes.generateRoute,
    );
  }
}
