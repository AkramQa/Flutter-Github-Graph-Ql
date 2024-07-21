import 'package:graphql_task/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';

abstract class CountryCodeRepository{
  Future<Either<Failure,CountryModel>> getCountryCodeRepo(String code);
}