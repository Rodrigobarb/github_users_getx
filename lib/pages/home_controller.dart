
import 'package:github_user_getx/data/models/github_user_model.dart';
import 'package:github_user_getx/data/repositories/users_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GithubRepository repository;
  final RxList<GitHubModel> _users = <GitHubModel>[].obs;
  
  RxList<GitHubModel> get users => _users;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  HomeController({required this.repository});

  Future<void> getGitHubUsers() async {
    try {
      _isLoading.value = true;

      final response = await repository.getGitHubUsers();

      _users.assignAll(response);
    } catch (error) {
      // Lida com erros aqui (pode imprimir ou mostrar uma mensagem ao usuário)
      print('Erro ao obter usuários do GitHub: $error');
    } finally {
      _isLoading.value = false;
    }
  }
}

class GetxController {
}
