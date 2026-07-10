import 'package:app_api_rest_boutique/pages/page_accueil.dart';
import 'package:app_api_rest_boutique/utils/app_constants.dart';
import 'package:app_api_rest_boutique/utils/routeur.dart';
import 'package:app_api_rest_boutique/utils/theme_perso.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.nomDeApplication,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemePerso.modeclair,
      darkTheme: ThemePerso.modeSombre,
      initialRoute: Routeur.routeInitiale,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => PageAccueil()),
        routes: Routeur.routes,
    );
  }
}