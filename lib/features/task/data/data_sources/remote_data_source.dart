import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<List<dynamic>> getListTaskRepo();
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final GraphQLClient graphQLClient;

  RemoteDataSourceImpl(this.graphQLClient);
  @override
  Future<List<dynamic>> getListTaskRepo() async {
    String query = '''
query countries {
  countries {
    name
    native
    capital
    emoji
    currency
    }
}
                  ''';

    QueryOptions options = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {},
    );

    final result = await graphQLClient.query(options);

    if (result.hasException) {
      throw Exception();
    } else if (result.data == null) {
      throw Exception();
    } else {
      return result.data!['countries'] as List;
    }
  }
}
