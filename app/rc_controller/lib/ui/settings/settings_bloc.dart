import 'package:bloc/bloc.dart';
import 'settings_events.dart';

class SettingsState {
  const SettingsState();

  SettingsState copyWith() => const SettingsState();
}

class UpdatePageState extends SettingsState { const UpdatePageState(); }
class ShowPageState extends SettingsState { const ShowPageState(); }

class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  SettingsBloc() : super(const SettingsState()) { on<SettingsEvents>(_onEvent); }

  void _onEvent(SettingsEvents event, Emitter<SettingsState> emit) {
    if (event is UpdateSettingsPage) {
      emit(const UpdatePageState());
      emit(const ShowPageState());
    }
  }
}
