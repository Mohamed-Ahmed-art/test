import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sherkety/modules/login/presentation/pages/login_page.dart';
import 'package:sherkety/modules/register/presentation/pages/register_page.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sherkety',
      theme: ThemeData(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.almaraiTextTheme(),
        scaffoldBackgroundColor: const Color(0xffFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      home: const RegisterPage(),
    );
  }
}
