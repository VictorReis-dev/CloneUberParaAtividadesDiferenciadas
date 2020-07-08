import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suruber/motoristas.dart';
import 'package:suruber/testeCRUD.dart';
import 'bottommenu.dart';
import 'detetive.dart';
import 'load.dart';
import 'login.dart';
import 'registro.dart';
import 'sobre.dart';
import 'editar_perfil.dart';

void main() {
  detetiveSetup("Usuarios");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => detetive<CRUDteste>(),
        ),
      ],
      child: MaterialApp(
        title: 'Suruber',
        debugShowCheckedModeBanner: false,
        routes: {
          '/load': (context) => Load(),
          '/login': (context) => Login(),
          '/registro': (context) => Registro(),
          '/sobre': (context) => Sobre(),
          '/menu': (context) => BottomBar(),
          '/motoristas': (context) => ListaMotorista(),
        },
        initialRoute: '/load',
        //initialRoute: Navigator(context, "/load", arguments: "/login"),
      ),
    );
  }
}
