import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/features/authentication/views/sign_up_screen.dart';
import 'package:frontend/features/authentication/views/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: Color(0xff28B0EE),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ko'), // Spanish
      ],
    );
  }
}

// GoRouter 설정
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => SignUpScreen(), // '/'
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL, //    '/login'
      builder: (context, state) => LoginScreen(),
    ),
    // 추가적인 라우트를 여기에 정의할 수 있습니다.
  ],
);
