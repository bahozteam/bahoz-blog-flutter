import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'w_navbar.dart';

void main() {
  runApp(const BahozBlog());
}

class BahozBlog extends StatelessWidget {
  const BahozBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),
      theme: ThemeData(
        fontFamily: 'IranSans-regular',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
      ),
      debugShowCheckedModeBanner: false,
      home: const NavBar(),
    );
  }
}
