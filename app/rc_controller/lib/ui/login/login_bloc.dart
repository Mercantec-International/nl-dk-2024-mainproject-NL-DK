import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_events.dart';

class LoginState {
  const LoginState();

  LoginState copyWith() => const LoginState();
}

class UpdatePageState extends LoginState {
  const UpdatePageState();
}

class ShowPageState extends LoginState {
  const ShowPageState();
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>(_onEvent);
  }

  void _onEvent(LoginEvent event, Emitter<LoginState> emit) {
    if (event is UpdateLoginPage) {
      emit(const UpdatePageState());
      emit(const ShowPageState());
    }
  }
}
