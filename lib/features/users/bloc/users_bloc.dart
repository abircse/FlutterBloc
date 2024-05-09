import 'package:bloc/bloc.dart';
import 'package:flutterblocarchitecture/data/login_repository.dart';
import 'package:flutterblocarchitecture/model/UserModel.dart';

import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {

  final LoginRepository repository = LoginRepository();

  UsersBloc() : super(UsersInitialState()) {
    on<UsersEvent>((event, emit) async {
      try {
        emit(UsersLoadingState());
        final UsersModel usersModel = await repository.getUsers();
        emit(UsersSuccessState(usersModel));
      }
      catch (e) {
        emit(UsersFailedState(e.toString()));
      }
    });
  }
}
