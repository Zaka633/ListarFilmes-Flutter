import 'package:flutter/material.dart';
import 'filme.dart';

class FilmeViewModel extends ChangeNotifier {
  final List<Filme> _filmes = [
    Filme(
      titulo: 'O Poderoso Chefão',
      genero: 'Drama',
      classificacao: 5,
      urlImagem: 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
    ),
    Filme(
      titulo: 'O Senhor dos Anéis: A Sociedade do Anel',
      genero: 'Fantasia',
      classificacao: 4,
      urlImagem: 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg',
    ),
    Filme(
      titulo: 'Pulp Fiction: Tempo de Violência',
      genero: 'Crime',
      classificacao: 5,
      urlImagem: 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
    ),
  ];

  List<Filme> get filmes => _filmes;

  void adicionarFilme(Filme filme) {
    _filmes.add(filme);
    notifyListeners();
  }

  void removerFilme(Filme filme) {
    _filmes.remove(filme);
    notifyListeners();
  }
}
