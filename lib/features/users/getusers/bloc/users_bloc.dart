import 'package:bloc/bloc.dart';
import 'package:flutterblocarchitecture/data/model/UserModel.dart';
import 'package:flutterblocarchitecture/data/repository/user_repository.dart';

import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {

  final UserRepository repository = UserRepository();

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
