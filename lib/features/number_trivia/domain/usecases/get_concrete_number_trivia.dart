import 'package:clean_architecture_pattern/core/error/failures.dart';
import 'package:clean_architecture_pattern/core/usecases/usecase.dart';
import 'package:clean_architecture_pattern/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);
  @override
  Future<Either<Failure, NumberTrivia>> call(Params param) async {
    return await repository.getConcreteNumberTrivia(param.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});
  @override
  List<Object> get props => [number];
}
