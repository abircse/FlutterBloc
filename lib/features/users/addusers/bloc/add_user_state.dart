import 'package:equatable/equatable.dart';

class AddUserState extends Equatable {
  const AddUserState();

  @override
  List<Object?> get props => [];
}


final class AddUserInitialState extends AddUserState {}

final class AddUserLoadingState extends AddUserState {}

final class AddUserSuccessState extends AddUserState {
  final String id;
  const AddUserSuccessState(this.id);
}

final class AddUserFailedState extends AddUserState {
  final String message;
  const AddUserFailedState(this.message);
}
