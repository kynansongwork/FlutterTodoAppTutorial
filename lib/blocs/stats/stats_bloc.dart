import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_todos/blocs/blocs.dart';

// Dependency on TodosBloc which allows state update 
// in response to changes in the TodosBloc.

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final TodosBloc todosBloc;
  
  StreamSubscription todosSubscription;

  StatsBloc({ @required this.todosBloc}) {
    todosSubscription = todosBloc.listen((state) {
      if (state is TodosLoadSuccess) {
        add(StatsUpdated(state.todos));
      }
    });
  }

  @override
  StatsState get initialState => StatsLoadInProgress();

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async* {
    if (event is StatsUpdated) {
      int numActive = event.todos.where((todo) => !todo.complete).toList().length;
      int numCompleted = event.todos.where((todo) => todo.complete).toList().length;
      yield StatsLoadSuccess(numActive, numCompleted);
    }
  }

  @override
  Future<void> close() {
    todosSubscription.cancel();
    return super.close()
  }
}