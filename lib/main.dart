import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filme_viewmodel.dart';
import 'lista_filmes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilmeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de Filmes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListaFilmes(),
      ),
    );
  }
}
