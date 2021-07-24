import 'dart:convert';

import 'package:clean_architecture_pattern/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_pattern/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test text');
  test(
    'should be a subclass of Number Trivia',
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('from json', () {
    test('validjson Int', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, tNumberTriviaModel);
      print('validjson');
    });

    test('validjson Double', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, tNumberTriviaModel);
      print('validjson');
    });
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tNumberTriviaModel.toJson();
        // assert
        final expectedJsonMap = {
          "text": "Test text",
          "number": 1,
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
