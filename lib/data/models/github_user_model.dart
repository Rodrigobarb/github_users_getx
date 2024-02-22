// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GitHubModel {
  final String login;
  final String avatarUrl;
  final String? location;
  final String? name;
  final int? followers;
  final int? publicRepos;

  GitHubModel({
    required this.login,
    required this.avatarUrl,
    this.location,
    this.name,
    this.followers,
    this.publicRepos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatarUrl': avatarUrl,
      'location': location,
      'name': name,
      'followers': followers,
      'publicRepos': publicRepos,
    };
  }

  factory GitHubModel.fromMap(Map<String, dynamic> map) {
    return GitHubModel(
      login: map['login'],
      avatarUrl: map['avatar_url'], // correção aqui
      location: map['location'],
      name: map['name'],
      followers: map['followers'],
      publicRepos: map['public_repos'], // correção aqui
    );
  }

  String toJson() => json.encode(toMap());

  factory GitHubModel.fromJson(String source) =>
      GitHubModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
