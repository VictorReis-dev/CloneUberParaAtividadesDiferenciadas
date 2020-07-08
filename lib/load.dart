import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  Widget build(BuildContext context) {
    String argumentos = ModalRoute.of(context).settings.arguments;
    String proximaPagina = "/login";

    if (argumentos != null) {
      debugPrint(argumentos);
      proximaPagina = argumentos;
      debugPrint(argumentos);
    }
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: proximaPagina,
      title: Text(
        'REBU PROJECT',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      image: Image.asset('assets/imagens/rebu-logo.jpeg'),
      photoSize: 200,
      loaderColor: Colors.black,
      loadingText: Text('Carregando'),
    );
  }
}
