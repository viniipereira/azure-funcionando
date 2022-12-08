import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterweb_azuread_authentication/helpers/globals.dart';
import 'package:openid_client/openid_client_browser.dart' as open_id;
import 'package:http/http.dart' as http;

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {

    var tenantId = "53b0111b-4655-4a2b-bf50-a1adeaa31ff5";
    var clientId = "43bb0595-3f50-4e2f-a7be-0489f7a9b869";
    var scope = "openid offline_access User.Read";

    return Scaffold(
      appBar: AppBar(title: const Text("Authenticate with Azure AD")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            authenticate(Uri.parse("https://login.microsoftonline.com/$tenantId/v2.0"), clientId, [scope]);
          },
        ),
      ),
    );
  }
}



authenticate(Uri uri, String clientId, List<String> scopes) async {
  var issuer = await open_id.Issuer.discover(uri);
  var client = open_id.Client(issuer, clientId);


  var authenticator = open_id.Authenticator(client, scopes: scopes);
  await authenticator.credential;


  authenticator.authorize();
  var eu = await http.get(Uri.parse("https://graph.microsoft.com/oidc/userinfo"),headers: {'authorization': 'Bearer ${Globals.instance.azureAccessToken}'});


}



