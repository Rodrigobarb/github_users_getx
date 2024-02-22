import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_user_getx/data/repositories/users_repository.dart';
import 'package:github_user_getx/pages/detalhes/detalhes_page.dart';
import 'package:github_user_getx/pages/home_controller.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    );
    _controller?.getGitHubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GitHub Usuários"),
      ),
      body: Obx(() {
        
        return _controller?.isLoading.value ?? false  // corrigido para isLoading
            ? Center(child: CircularProgressIndicator())
            : _controller?.users.isEmpty ?? true
                ? Center(child: Text("Nenhum usuário encontrado"))
                : ListView.builder(
                    itemCount: _controller?.users.length ?? 0,
                    itemBuilder: (_, index) {
                      final item = _controller?.users[index];
                      return ListTile(
                        title: Text(item?.login ?? ""),
                   onTap:(){
                    Get.to(DetalhesPage(username: item!.login));
       }
                      );
       
                    },
                    
                  );           
      }),
    );
  }
}
