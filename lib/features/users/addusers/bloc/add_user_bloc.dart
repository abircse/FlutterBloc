import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocarchitecture/data/repository/user_repository.dart';
import 'package:flutterblocarchitecture/features/users/addusers/bloc/add_user_event.dart';
import 'package:flutterblocarchitecture/features/users/addusers/bloc/add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {

  final UserRepository repository = UserRepository();

  AddUserBloc() : super(AddUserInitialState()) {
    on<AddUser>((event, emit) async {
      try {
        emit(AddUserLoadingState());
        final String id = await repository.userRegistration(event.requestBody);
        emit(AddUserSuccessState(id));
      }
      catch (e) {
        emit(AddUserFailedState(e.toString()));
      }
    });
  }
}