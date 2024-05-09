
import 'package:flutterblocarchitecture/features/login/bloc/login_event.dart';
import 'package:flutterblocarchitecture/features/login/bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutterblocarchitecture/data/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository repository = LoginRepository();

  LoginBloc() : super(LoginInitialState()) {

    on<UserLoginEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());
        final String message = await repository.userLogin(event.request);
        emit(LoginSuccessState(message));
      }
      catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}