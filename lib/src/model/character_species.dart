import 'package:json_annotation/json_annotation.dart';

enum CharacterSpecies {
  @JsonValue('Human')
  human,
  @JsonValue('Alien')
  alien,
  unknown,
}
