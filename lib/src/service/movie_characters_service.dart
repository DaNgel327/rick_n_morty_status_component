import 'package:rick_n_morty_status_component/src/api/api_factory.dart';

import '../api/movie_characters_api.dart';
import '../model/movie_character.dart';

abstract class MovieCharacterService {
  Future<List<MovieCharacter>> get fetchedCharacters;
}

class MovieCharacterServiceImpl extends MovieCharacterService {
  final MovieCharactersApi _api = ApiFactory.movieCharacterApi;

  @override
  Future<List<MovieCharacter>> get fetchedCharacters async =>
      (await _api.fetchCharacters())
          .map<MovieCharacter>((element) => MovieCharacter.fromJson(element))
          .toList();
}
