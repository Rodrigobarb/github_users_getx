import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_user_getx/data/repositories/users_repository.dart';
import 'package:github_user_getx/pages/detalhes/detalhes_controller.dart';
import 'package:get/get.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({Key? key}) : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesState();
}

class _DetalhesState extends State<DetalhesPage> {
  // Declaração do controlador usando GetX
  late final DetalhesController _controller;

  @override
  void initState() {
    super.initState();
    // Inicialização do controlador na inicialização do widget
    _controller = DetalhesController(repository: GithubRepository(dio: Dio()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Obx(() {
        // Verifica se a página está carregando
        return _controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : _controller.gitHubUser == null
                ? Center(child: Text("Nenhum usuário encontrado"))
                : _buildUserInfo();
      }),
    );
  }

  Widget _buildUserInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            _controller.gitHubUser!.avatarUrl,
            height: 275,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 32),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.emoji_people_rounded,
              color: Theme.of(context).primaryColor),
          title: const Text(
            'Nome',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            _controller.gitHubUser!.name ?? 'Sem informações',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.short_text_outlined,
                color: Theme.of(context).primaryColor),
            title: const Text('Login',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            subtitle: Text(
              _controller.gitHubUser!.login,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
        ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.grain_outlined,
                color: Theme.of(context).primaryColor),
            title: const Text('Repositórios públicos',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            subtitle: Text(
              _controller.gitHubUser!.publicRepos.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
        ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.people_rounded,
                color: Theme.of(context).primaryColor),
            title: const Text('Seguidores',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            subtitle: Text(
              _controller.gitHubUser!.followers.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
        ListTile(
            contentPadding: EdgeInsets.zero,
            leading:
                Icon(Icons.flag_rounded, color: Theme.of(context).primaryColor),
            title: const Text('Local',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            subtitle: Text(
              _controller.gitHubUser!.location ?? "Sem informações",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ))
      ]),
    );
  }
}
