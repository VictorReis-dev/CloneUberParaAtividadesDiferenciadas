import 'package:flutter/material.dart';
import 'login.dart';
import 'login2.dart';
import 'sobre.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static List<String> paises = [
    "https://www.pinclipart.com/picdir/middle/158-1582812_brasil-icons-icon-brasil-clipart.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/2000px-Flag_of_the_United_States.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Flag_of_Pakistan_%28bordered%29.svg/1200px-Flag_of_Pakistan_%28bordered%29.svg.png"
  ];
  final String numero_ddi = "+55";
  final String numero = '1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suruber',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login1': (context) => Login(
            titulo: 'Login',
            bandeiras: paises,
            numero_ddi: numero_ddi,
            numero: numero),
        '/login2': (context) => Login2(
              titulo: 'Login',
              bandeiras: paises,
            ),
        '/sobre': (context) => Sobre(),
      },
      initialRoute: '/login1',
    );
  }
}
