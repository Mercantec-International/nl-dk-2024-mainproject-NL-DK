import 'package:flutter_bloc/flutter_bloc.dart';
import 'select_car_events.dart';


class SelectState {
  const SelectState();

  SelectState copyWith() => const SelectState();
}

class UpdatePageState extends SelectState { const UpdatePageState(); }
class ShowPageState extends SelectState { const ShowPageState(); }

class SelectBloc extends Bloc<SelectEvents, SelectState> {
  SelectBloc() : super(const SelectState()) { on<SelectEvents>(_onEvent); }

  void _onEvent(SelectEvents event, Emitter<SelectState> emit) {
    if (event is UpdateSelectPage) {
      emit(const UpdatePageState());
      emit(const ShowPageState());
    }
  }
}
