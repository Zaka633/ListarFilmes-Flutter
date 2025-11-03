import 'package:flutter/material.dart';
import 'filme.dart';

class FilmeViewModel extends ChangeNotifier {
  final List<Filme> _filmes = [
    Filme(
        titulo: 'Velozes e Furiosos 8',
        genero: 'Ação, Aventura, Crime',
        pontuacao: 3.5,
        urlImagem: 'https://br.web.img3.acsta.net/pictures/17/03/27/09/49/121118.jpg',
        faixaEtaria: '14',
        descricao: 'Depois que Brian e Mia se aposentaram, e o resto da equipe foi exonerado, Dom e Letty estão em lua de mel e levam uma vida pacata e completamente normal. Mas a adrenalina do passado volta com tudo quando uma mulher misteriosa faz com que Dom retorne ao mundo do crime e da velocidade.',
        ano: 2017,
        duracao: '2h 16min'),
    Filme(
      titulo: 'O Poderoso Chefão',
      genero: 'Drama',
      pontuacao: 5,
      urlImagem: 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
      faixaEtaria: '16',
      descricao: 'O patriarca de uma organização criminosa transfere o controle de seu império clandestino para seu filho relutante.',
      ano: 1972,
      duracao: '2h 55min',
    ),
    Filme(
      titulo: 'O Senhor dos Anéis: A Sociedade do Anel',
      genero: 'Fantasia',
      pontuacao: 4.5,
      urlImagem: 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg',
      faixaEtaria: '12',
      descricao: 'Um hobbit do Condado e oito companheiros partem em uma jornada para destruir o poderoso Um Anel e salvar a Terra-média do Lorde das Trevas Sauron.',
      ano: 2001,
      duracao: '2h 58min',
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

  void alterarFilme() {
    notifyListeners();
  }
}
