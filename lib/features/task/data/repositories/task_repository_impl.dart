import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graphql_task/core/domain/entities/failures.dart';
import 'package:graphql_task/features/task/data/data_sources/remote_data_source.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';
import 'package:graphql_task/features/task/domain/repository/task_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/utils/network/constants.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final RemoteDataSource remoteDataSource;

  TaskRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CountryModel>>> getListTaskRepo() async {
    try {
      final res = await remoteDataSource.getListTaskRepo();
      final List<CountryModel> countries =
          res.map((e) => CountryModel.fromJson(e)).toList();
      return (Right(countries));
    } catch (e) {
      print(e);
      return Left(ServerFailure(
          errorCode: ServerErrorCode.forbidden, message: e.toString()));
    }
  }
}
