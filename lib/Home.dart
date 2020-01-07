import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado;

  @override
  Widget build(BuildContext context) {    
    List<Widget> telas = [Inicio(_resultado), EmAlta(), Inscricao(), Biblioteca()];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
             String res = await showSearch(context: context, delegate: CustomSearchDelegate() );
             setState(() {
               _resultado = res;
             });
             //print("resultado: digitado "+ res);
            },
          ),

          // IconButton(
          //   icon: Icon(Icons.videocam),
          //   onPressed: () {
          //     print("ação: videocam");
          //   },
          // ),

          // IconButton(
          //   icon: Icon(Icons.account_circle),
          //   onPressed: () {
          //     print("ação: conta");
          //   },
          // )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        currentIndex: _indiceAtual,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              title: Text("Inicio"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Em alta"), icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              title: Text("Inscrições"), icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              title: Text("Biblioteca"), icon: Icon(Icons.folder))
        ],
      ),
    );
  }
}
