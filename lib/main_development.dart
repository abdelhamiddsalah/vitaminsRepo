import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:vitamins/core/databases/cache/cache_helper.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/routing/app_routes.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/core/shared/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await CacheHelper().init();
  await Prefs.init();
  setup();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLinks _applinks;

  @override
  void initState() {
    super.initState();
    _applinks = AppLinks();
  _setupAppLinks();
  }

  void _setupAppLinks() {
    _applinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        print('Received deep link: $uri');
        _handleDeepLink(uri);
      }
    });
  }


  void _handleDeepLink(Uri uri) {
    print('Received deep link: $uri');

    if (uri.pathSegments.length == 4 &&
        uri.pathSegments[0] == 'api' &&
        uri.pathSegments[1] == 'auth' &&
        uri.pathSegments[2] == 'reset-password') {
      final token2 = uri.pathSegments[3];
      Prefs.setString('token2', token2);
      print('Extracted token: $token2');
      if (token2.isNotEmpty) {
        navigatorKey.currentState?.pushNamed(
          Routes.resetpassword,  // تأكد من أن هذا يتطابق مع الإعدادات في AppRoutes
        );
      }
    } else {
      print('Invalid deep link format.');
    }
  }

  final String initialRoute = '/';

  final AppRoutes appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,  // تعيين الـ GlobalKey هنا
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
