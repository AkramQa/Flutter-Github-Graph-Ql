import 'package:get_it/get_it.dart';
import 'package:graphql_task/injection.config.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureInjection() async {
  await $initGetIt(getIt);
}

Future<void> resetInjection() async {
  await getIt.reset();
}