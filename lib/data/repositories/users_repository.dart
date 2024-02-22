import 'package:dio/dio.dart';
import 'package:github_user_getx/data/models/github_user_model.dart';

class GithubRepository {
  final Dio dio;

  GithubRepository({required this.dio});

  Future<List<GitHubModel>> getGitHubUsers() async {
    final result = await dio.get('http://api.github.com/users');
    final List<GitHubModel> users = [];

    if (result.statusCode == 200) {
      result.data.map((item) => users.add(GitHubModel.fromMap(item))).toList();
    }
    return users;
  }
  Future<GitHubModel> getGithubUser ({required String username}) async{
    final result = await dio.get('https://api.github.com/users/$username');

    late GitHubModel gitHubUser;
    if(result.statusCode == 200){
      gitHubUser = GitHubModel.fromMap(result.data);
    }
    return gitHubUser;
  }
}
