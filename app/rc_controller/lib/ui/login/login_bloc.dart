import 'package:bloc/bloc.dart';
import 'login_events.dart';

class LoginState {
  const LoginState();

  LoginState copyWith() => const LoginState();
}

class UpdatePageState extends LoginState { const UpdatePageState(); }
class ShowPageState extends LoginState { const ShowPageState(); }

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(const LoginState()) { on<LoginEvents>(_onEvent); }

  void _onEvent(LoginEvents event, Emitter<LoginState> emit) {
    if (event is UpdateLoginPage) {
      emit(const UpdatePageState());
      emit(const ShowPageState());
    }
  }
}
