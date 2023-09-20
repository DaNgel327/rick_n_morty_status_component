import 'character_gender.dart';
import 'character_species.dart';
import 'character_status.dart';

import 'package:json_annotation/json_annotation.dart';

part 'movie_character.g.dart';

@JsonSerializable()
class MovieCharacter {
  MovieCharacter({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
  });

  final int id;
  final String name;
  final String image;
  final CharacterStatus status;
  final CharacterSpecies species;
  final CharacterGender gender;


  factory MovieCharacter.fromJson(Map<String, dynamic> json) =>
      _$MovieCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCharacterToJson(this);

  @override
  String toString() => 'MovieCharacter{'
      'id: $id, '
      'name: $name, '
      'image: $image, '
      'status: $status, '
      'species: $species, '
      'gender: $gender'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieCharacter &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          image == other.image &&
          status == other.status &&
          species == other.species &&
          gender == other.gender;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      status.hashCode ^
      species.hashCode ^
      gender.hashCode;
}
