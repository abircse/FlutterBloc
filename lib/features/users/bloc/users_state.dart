import 'package:equatable/equatable.dart';
import 'package:flutterblocarchitecture/model/UserModel.dart';

class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}


final class UsersInitialState extends UsersState {}

final class UsersLoadingState extends UsersState {}

final class UsersSuccessState extends UsersState {
  final UsersModel usersModel;
  const UsersSuccessState(this.usersModel);
}

final class UsersFailedState extends UsersState {
  final String message;
  const UsersFailedState(this.message);
}
