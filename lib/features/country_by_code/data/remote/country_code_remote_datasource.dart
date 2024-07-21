import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';
import 'package:injectable/injectable.dart';

abstract class CountryCodeRemote {
  Future<CountryModel> getCountryCodeRepo({required String code});
}

@LazySingleton(as: CountryCodeRemote)
class CountryCodeRemoteImpl implements CountryCodeRemote {
  final GraphQLClient graphQLClient;

  CountryCodeRemoteImpl(this.graphQLClient);
  @override
  Future<CountryModel> getCountryCodeRepo({required String code}) async {
    String query = '''
query GetCountry {
  country(code:$code) {
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
      variables: {"code": code},
    );

    final result = await graphQLClient.query(options);

    if (result.hasException) {
      throw Exception();
    } else if (result.data == null) {
      throw Exception();
    } else {
      return result.data!['country'] ;
    }
  }
}
