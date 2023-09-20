// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCharacter _$MovieCharacterFromJson(Map<String, dynamic> json) =>
    MovieCharacter(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      status: $enumDecode(_$CharacterStatusEnumMap, json['status']),
      species: $enumDecode(_$CharacterSpeciesEnumMap, json['species']),
      gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$MovieCharacterToJson(MovieCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'status': _$CharacterStatusEnumMap[instance.status]!,
      'species': _$CharacterSpeciesEnumMap[instance.species]!,
      'gender': _$CharacterGenderEnumMap[instance.gender]!,
    };

const _$CharacterStatusEnumMap = {
  CharacterStatus.alive: 'Alive',
  CharacterStatus.dead: 'Dead',
  CharacterStatus.unknown: 'unknown',
};

const _$CharacterSpeciesEnumMap = {
  CharacterSpecies.human: 'Human',
  CharacterSpecies.alien: 'Alien',
  CharacterSpecies.unknown: 'unknown',
};

const _$CharacterGenderEnumMap = {
  CharacterGender.male: 'Male',
  CharacterGender.female: 'Female',
  CharacterGender.unknown: 'unknown',
};
