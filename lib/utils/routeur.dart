import 'package:app_api_rest_boutique/pages/page_accueil.dart';
import 'package:app_api_rest_boutique/pages/page_compteur.dart';
import 'package:flutter/material.dart';

abstract class Routeur {
  static const String routeInitiale = '/page-compteur';
  static final Map<String, WidgetBuilder> routes = {
    "/page-compteur": (context) => PageCompteur(),
    "/page-accueil":(context) => PageAccueil(),
  };
}