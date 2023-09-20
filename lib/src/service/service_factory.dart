import 'package:rick_n_morty_status_component/src/service/movie_characters_service.dart';

class ServiceFactory {
  static MovieCharacterService get movieCharacterService =>
      MovieCharacterServiceImpl();
}
