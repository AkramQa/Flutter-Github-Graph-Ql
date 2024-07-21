import 'package:graphql_task/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';

abstract class TaskRepository{
  Future<Either<Failure,List<CountryModel>>> getListTaskRepo();
}