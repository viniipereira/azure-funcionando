import 'package:flutter/material.dart';
import 'package:flutterweb_azuread_authentication/helpers/globals.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {

    debugPrint(Globals.instance.azureAccessToken);
    return 
    TextButton(onPressed: () {Navigator.pushNamed(context, '/paginaInicial');}, child: Text("ir para Home"));
  }
}
