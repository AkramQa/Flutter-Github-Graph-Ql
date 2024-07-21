import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/core/domain/entities/failures.dart';
import 'package:graphql_task/features/country_by_code/domain/repository/country_code_repository.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';
import 'package:graphql_task/features/task/domain/repository/task_repository.dart';
import 'package:injectable/injectable.dart';
part 'country_code_event.dart';
part 'country_code_state.dart';

@injectable
class CountryCodeBloc extends Bloc<CountryCodeEvent, CountryCodeByCodeState> {
  final CountryCodeRepository taskRepository;
  CountryCodeBloc(this.taskRepository) : super(Initial()) {
    on<GetCountryByCodeEvent>((event, emit) async {
      emit(CountryCodeLoading());
      final result = await taskRepository.getCountryCodeRepo(event.code);
      result.fold((l) {
        emit(CountryCodeFailure(l));
      }, (r) {
        emit(CountryCodeSuccessful(country: r));
      });
    });
  }
}
