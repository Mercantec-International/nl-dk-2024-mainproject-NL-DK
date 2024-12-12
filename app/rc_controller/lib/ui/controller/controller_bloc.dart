import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller_events.dart';

class ControllerState {
  const ControllerState();

  ControllerState copyWith() => const ControllerState();
}

class UpdatePageState extends ControllerState { const UpdatePageState(); }
class ShowPageState extends ControllerState { const ShowPageState(); }

class ControllerBloc extends Bloc<ControllerEvents, ControllerState> {
  ControllerBloc() : super(const ControllerState()) { on<ControllerEvents>(_onEvent); }

  void _onEvent(ControllerEvents event, Emitter<ControllerState> emit) {
    if (event is UpdateControllerPage) {
      emit(const UpdatePageState());
      emit(const ShowPageState());
    }
  }
}
