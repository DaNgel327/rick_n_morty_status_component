import 'package:json_annotation/json_annotation.dart';

enum CharacterGender {
  @JsonValue('Male')
  male,
  @JsonValue('Female')
  female,
  unknown,
}
