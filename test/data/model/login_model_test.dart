import 'dart:convert';

import 'package:apotik/features/login/data/models/login_model.dart';
import 'package:apotik/features/login/domain/entities/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  final testloginModel = Login(
      data: Data(
          id: 1,
          email: "mtegarph@gmail.com",
          firstName: "tets",
          lastName: "test",
          avatar: "https://reqres.in/img/faces/2-image.jpg"),
      support: Support(
          url: "https://reqres.in/#support-heading",
          text:
              "To keep ReqRes free, contributions towards server costs are appreciated!"));
  group("model test", () {
    test('should be subclass of login entity', () {
      expect(testloginModel, isA<LoginEntity>());
    });
    test('should return valid modal json', () {
      //arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(readJson('helpers/dummy_data/dummy_login_data.json'));

      //act
      final result = Login.fromJson(jsonMap);

      //asserts
      expect(result, equals(testloginModel));
    });
  });
}
