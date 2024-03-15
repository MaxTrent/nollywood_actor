import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nollywood_actor/screens/splash_screen.dart';
import 'package:nollywood_actor/theme.dart';

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

void main() {
  runApp(ProviderScope(child: MyApp(appTheme: AppTheme(),)));
}

class MyApp extends ConsumerWidget {
   MyApp({super.key, required this.appTheme});
  
  final AppTheme appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nollywood Actor',
        initialRoute: '/splash',
        navigatorKey: ref.read(navigatorKeyProvider),
        theme: appTheme.light,
        routes: {
          '/splash': (context) => SplashScreen()
        },
      ),
    );
  }
}

