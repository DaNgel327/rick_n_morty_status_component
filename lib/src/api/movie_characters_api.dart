import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class MovieCharactersApi {
  Future<List<dynamic>> fetchCharacters();
}

class MovieCharactersApiImpl extends MovieCharactersApi {
  MovieCharactersApiImpl(this.url);

  final String url;

  @override
  Future<List<dynamic>> fetchCharacters() async {
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    final List<dynamic> charactersList = json['results'];

    return charactersList;
  }
}
