import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'alterar_filme.dart';
import 'detalhes_filme.dart';
import 'filme.dart';
import 'filme_viewmodel.dart';

class ListaFilmes extends StatelessWidget {
  const ListaFilmes({super.key});

  void _adicionarFilme(BuildContext context) {
    final viewModel = Provider.of<FilmeViewModel>(context, listen: false);
    final tituloController = TextEditingController();
    final generoController = TextEditingController();
    final urlImagemController = TextEditingController();
    final descricaoController = TextEditingController();
    final anoController = TextEditingController();
    final duracaoController = TextEditingController();
    String faixaEtariaSelecionada = 'Livre';
    double pontuacao = 3.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Filme'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      cursorColor: Colors.blue,
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
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                viewModel.adicionarFilme(
                  Filme(
                    titulo: tituloController.text,
                    genero: generoController.text,
                    urlImagem: urlImagemController.text,
                    descricao: descricaoController.text,
                    faixaEtaria: faixaEtariaSelecionada,
                    pontuacao: pontuacao,
                    ano: int.parse(anoController.text),
                    duracao: duracaoController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Salvar', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void _mostrarOpcoes(BuildContext context, Filme filme) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Exibir Dados'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesFilme(filme: filme),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Alterar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlterarFilmeTela(filme: filme),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _mostrarGrupo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Grupo'),
          content: const Text('Alexandre Cabral\n''Jussandro Vitor\n''Ryan Guedes'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FilmeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Lista de Filmes', style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.info),
            onPressed: () => _mostrarGrupo(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: viewModel.filmes.length,
        itemBuilder: (context, index) {
          final filme = viewModel.filmes[index];
          return Dismissible(
            key: Key(filme.titulo),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              viewModel.removerFilme(filme);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${filme.titulo} removido")),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
                leading: Image.network(filme.urlImagem, width: 50, fit: BoxFit.cover),
                title: Text(filme.titulo),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(filme.genero),
                    SmoothStarRating(
                      rating: filme.pontuacao,
                      starCount: 5,
                      size: 16.0,
                      color: Colors.amber,
                      borderColor: Colors.amber,
                    ),
                  ],
                ),
                trailing: Text(filme.faixaEtaria, style: const TextStyle(fontSize: 12)),
                onTap: () => _mostrarOpcoes(context, filme)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        onPressed: () => _adicionarFilme(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
