import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'filme.dart';

class DetalhesFilme extends StatelessWidget {
  final Filme filme;

  const DetalhesFilme({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        title: const Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(filme.urlImagem, height: 300),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child:
                  SizedBox(
                    height: 30,
                    child: Marquee(
                      text:filme.titulo,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 20.0,
                      velocity: 50.0,
                      pauseAfterRound: const Duration(seconds: 1),
                      startPadding: 10.0,
                    )
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  filme.genero,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  filme.ano.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  filme.duracao,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '${filme.faixaEtaria} anos',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    SmoothStarRating(
                      rating: filme.pontuacao,
                      starCount: 5,
                      size: 20.0,
                      color: Colors.amber,
                      borderColor: Colors.amber,
                    ),
                  ],
                ),
            const SizedBox(height: 20),
            Text(
              filme.descricao,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
