import '../common/constants_library.dart';
import 'movie_characters_api.dart';

class ApiFactory {
  static MovieCharactersApi get movieCharacterApi =>
      MovieCharactersApiImpl(StringConstants.movieCharactersUrl);
}
