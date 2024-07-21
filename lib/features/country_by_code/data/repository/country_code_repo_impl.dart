import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graphql_task/core/domain/entities/failures.dart';
import 'package:graphql_task/features/country_by_code/domain/repository/country_code_repository.dart';
import 'package:graphql_task/features/task/data/data_sources/remote_data_source.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';
import 'package:graphql_task/features/task/domain/repository/task_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/utils/network/constants.dart';
import '../remote/country_code_remote_datasource.dart';

@LazySingleton(as: CountryCodeRepository)
class CountryCodeRepoImpl implements CountryCodeRepository {
  final CountryCodeRemote remoteDataSource;

  CountryCodeRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CountryModel>> getCountryCodeRepo(String code) async {
    try {
      final response = await remoteDataSource.getCountryCodeRepo(code: code);

      return (Right(response));
    } catch (e) {
      print(e);
      return Left(ServerFailure(
          errorCode: ServerErrorCode.forbidden, message: e.toString()));
    }
  }
}
