import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filme.dart';
import 'filme_viewmodel.dart';

class ListaFilmes extends StatelessWidget {
  const ListaFilmes({super.key});

  void _adicionarFilme(BuildContext context) {
    final viewModel = Provider.of<FilmeViewModel>(context, listen: false);
    final tituloController = TextEditingController();
    final generoController = TextEditingController();
    final classificacaoController = TextEditingController();
    final urlImagemController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Filme'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: generoController,
                  decoration: const InputDecoration(labelText: 'Gênero'),
                ),
                TextField(
                  controller: classificacaoController,
                  decoration: const InputDecoration(labelText: 'Classificação (1-5)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: urlImagemController,
                  decoration: const InputDecoration(labelText: 'URL da Imagem'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                viewModel.adicionarFilme(
                  Filme(
                    titulo: tituloController.text,
                    genero: generoController.text,
                    classificacao: int.parse(classificacaoController.text),
                    urlImagem: urlImagemController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDetalhes(BuildContext context, Filme filme) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(filme.titulo),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(filme.urlImagem),
                const SizedBox(height: 10),
                Text('Gênero: ${filme.genero}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < filme.classificacao ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    );
                  }),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
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
        title: const Text('Lista de Filmes'),
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
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: Image.network(filme.urlImagem, width: 50, fit: BoxFit.cover),
              title: Text(filme.titulo),
              subtitle: Text(filme.genero),
              onTap: () => _mostrarDetalhes(context, filme),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => _adicionarFilme(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
