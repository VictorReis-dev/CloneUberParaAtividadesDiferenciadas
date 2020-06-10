import 'package:flutter/material.dart';
import 'principal.dart';
import 'viagens.dart';
import 'perfil.dart';
import 'configs.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _menuSelecionado = 0;

  List<Widget> _menuItens = <Widget>[
    Perfil(),

    Principal(),

    Viagens(),

    Configuracoes(),
  ];

  void _itemSelecionado(int index) {
    setState(() {
      _menuSelecionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _menuItens.elementAt(_menuSelecionado),
      ),
      bottomNavigationBar: BottomNavigationBar(

        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            title: Text('Perfil'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: Text('Mapa'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Viagens'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Configurações'),
          ),
        ],

        currentIndex: _menuSelecionado,
        selectedItemColor: Colors.blue,
        onTap: _itemSelecionado,

      ),
    );
  }
}
