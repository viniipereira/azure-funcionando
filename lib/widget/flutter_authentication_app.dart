import 'package:flutter/material.dart';
import 'package:flutterweb_azuread_authentication/helpers/globals.dart';
import 'package:flutterweb_azuread_authentication/widget/BemVindo.dart';

import 'authenticate.dart';
import 'main_app.dart';
import 'login_widget.dart';

class FlutterAuthenticationApp extends StatefulWidget {
  const FlutterAuthenticationApp({super.key});

  @override
  State<FlutterAuthenticationApp> createState() => _FlutterAuthenticationAppState();
}

class _FlutterAuthenticationAppState extends State<FlutterAuthenticationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: 
      {
        "/":(context)=>Globals.instance.azureAccessToken==""?const Authenticate():const LogadoWidget(),
        "/semToken": (context)=> const MainApp(),
        "/paginaInicial": (context) => const BemVindoWidget()
        }
    )
    ;
  }
}