import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/core/domain/entities/failures.dart';
import 'package:graphql_task/features/task/data/models/country_model.dart';
import 'package:graphql_task/features/task/domain/repository/task_repository.dart';
import 'package:injectable/injectable.dart';
part 'fetch_list_event.dart';
part 'fetch_list_state.dart';

@injectable
class FetchListBloc extends Bloc<FetchListEvent, FetchListState> {
  final TaskRepository taskRepository;
  FetchListBloc(this.taskRepository) : super(Initial()) {
    on<FetchListOnSubmit>((event, emit) async {
      emit(FetchListLoading());
      final result = await taskRepository.getListTaskRepo();
      result.fold((l) {
        emit(FetchListFailure(l));
      }, (r) {
        emit(FetchListSuccessful(r));
      });
    });
  }
}
