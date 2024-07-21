import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
@module
abstract class InjectableModule {
  @LazySingleton()
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();
  @LazySingleton()
  Logger get logger => Logger();
  @LazySingleton()
  GraphQLClient get graphQlClient {
    final GraphQLClient graphQLClient;
    final String lang = "en";
    Link link = HttpLink(
      'https://countries.trevorblades.com/',
      defaultHeaders: {
        'Accept-Language': 'application/json',
        "lang": lang,
        "content": lang
      },
    );
    graphQLClient = GraphQLClient(link: link, cache: GraphQLCache());

    return graphQLClient;
  }
}
