import 'package:flutter/material.dart';

import '../helpers/globals.dart';
import 'authenticate.dart';

class LogadoWidget extends StatefulWidget {
  const LogadoWidget({Key? key}) : super(key: key);

  @override
  _LogadoWidgetState createState() => _LogadoWidgetState();
}

class _LogadoWidgetState extends State<LogadoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Globals.instance.azureAccessToken==""?const Authenticate():super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(1, 200, 200, 200),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 200, 200, 200),
        automaticallyImplyLeading: false,
        title: Text(
          'LOGADO MEU AMIGO',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: TextButton(
          onPressed:(){ Navigator.pushNamed(context, "/semToken");}, child: Text("ir para la"),
        )
      ),
    );
  }
}