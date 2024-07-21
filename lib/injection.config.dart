// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;
import 'package:logger/logger.dart' as _i4;

import 'core/data/utils/network/network_info.dart' as _i10;
import 'core/domain/utils/network_info.dart' as _i9;
import 'features/task/data/data_sources/remote_data_source.dart' as _i6;
import 'features/task/data/repositories/task_repository_impl.dart' as _i8;
import 'features/task/domain/repository/task_repository.dart' as _i7;
import 'features/task/presntation/bloc/fetch_list/fetch_list_bloc.dart' as _i11;
import 'injectable_module.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i4.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i5.GraphQLClient>(() => injectableModule.graphQlClient);
  gh.lazySingleton<_i6.RemoteDataSource>(
      () => _i6.RemoteDataSourceImpl(gh<_i5.GraphQLClient>()));
  gh.lazySingleton<_i7.TaskRepository>(
      () => _i8.TaskRepositoryImpl(gh<_i6.RemoteDataSource>()));
  gh.lazySingleton<_i9.NetworkInfo>(
      () => _i10.NetworkInfoImpl(gh<_i3.InternetConnectionChecker>()));
  gh.factory<_i11.FetchListBloc>(
      () => _i11.FetchListBloc(gh<_i7.TaskRepository>()));
  return getIt;
}

class _$InjectableModule extends _i12.InjectableModule {}
