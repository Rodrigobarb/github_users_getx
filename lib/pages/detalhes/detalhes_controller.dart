import 'package:github_user_getx/data/models/github_user_model.dart';
import 'package:github_user_getx/data/repositories/users_repository.dart';
import 'package:get/get.dart';

class DetalhesController extends GetxController{
  final GithubRepository repository;

GitHubModel? _githubUser;
GitHubModel? get gitHubUser => _githubUser;

final RxBool _isLoading = false.obs;
RxBool get isLoading => _isLoading;

  DetalhesController({required this.repository});

 getGitUser({required String username})async{
_isLoading.value = true;

  final result = await repository.getGithubUser(username: username);

  _githubUser = result;

  _isLoading.value = false;
 }
}