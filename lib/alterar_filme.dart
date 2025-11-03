import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'filme.dart';
import 'filme_viewmodel.dart';

class AlterarFilmeTela extends StatefulWidget {
  final Filme filme;

  const AlterarFilmeTela({super.key, required this.filme});

  @override
  _AlterarFilmeTelaState createState() => _AlterarFilmeTelaState();
}

class _AlterarFilmeTelaState extends State<AlterarFilmeTela> {
  late TextEditingController tituloController;
  late TextEditingController generoController;
  late TextEditingController urlImagemController;
  late TextEditingController descricaoController;
  late TextEditingController anoController;
  late TextEditingController duracaoController;
  late String faixaEtariaSelecionada;
  late double pontuacao;

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController(text: widget.filme.titulo);
    generoController = TextEditingController(text: widget.filme.genero);
    urlImagemController = TextEditingController(text: widget.filme.urlImagem);
    descricaoController = TextEditingController(text: widget.filme.descricao);
    anoController = TextEditingController(text: widget.filme.ano.toString());
    duracaoController = TextEditingController(text: widget.filme.duracao);
    faixaEtariaSelecionada = widget.filme.faixaEtaria;
    pontuacao = widget.filme.pontuacao;
  }

  @override
  void dispose() {
    tituloController.dispose();
    generoController.dispose();
    urlImagemController.dispose();
    descricaoController.dispose();
    anoController.dispose();
    duracaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        title: const Text('Alterar Filme'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              cursorColor: Colors.blue,
              decoration: const InputDecoration(labelText: 'Título',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            TextField(
              controller: generoController,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(labelText: 'Gênero',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    )
                )
            ),
            TextField(
              controller: urlImagemController,
                decoration: const InputDecoration(labelText: 'URL da Imagem',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    )
                )
            ),
            TextField(
              controller: descricaoController,
              cursorColor: Colors.blue,
              decoration: const InputDecoration(labelText: 'Descrição',
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                  )
              ),
              maxLines: 3,
            ),
            TextField(
              controller: anoController,
              cursorColor: Colors.blue,
              decoration: const InputDecoration(labelText: 'Ano',
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                  )
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: duracaoController,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(labelText: 'Duração',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    )
                )
            ),
            DropdownButton<String>(
              value: faixaEtariaSelecionada,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  faixaEtariaSelecionada = newValue!;
                });
              },
              items: <String>['Livre', '10', '12', '14', '16', '18']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SmoothStarRating(
              rating: pontuacao,
              onRatingChanged: (double rating) {
                setState(() {
                  pontuacao = rating;
                });
              },
              starCount: 5,
              size: 40.0,
              color: Colors.amber,
              borderColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final viewModel =
                    Provider.of<FilmeViewModel>(context, listen: false);

                widget.filme.titulo = tituloController.text;
                widget.filme.genero = generoController.text;
                widget.filme.urlImagem = urlImagemController.text;
                widget.filme.descricao = descricaoController.text;
                widget.filme.ano = int.parse(anoController.text);
                widget.filme.duracao = duracaoController.text;
                widget.filme.faixaEtaria = faixaEtariaSelecionada;
                widget.filme.pontuacao = pontuacao;

                viewModel.alterarFilme();

                Navigator.of(context).pop();
              },
              child: const Text('Salvar Alterações', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
