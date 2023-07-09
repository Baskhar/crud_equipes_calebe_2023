import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Equipes Calebe'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/equipe1');
              },
              child: Text("Equipe 1"),
            ),ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/rumo_ao_ceu');
              },
              child: Text("Equipe Rumo ao céu"),
            ),
          ],
        ),
      ),
    );
  }
}
