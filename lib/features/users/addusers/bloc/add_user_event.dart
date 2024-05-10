import 'package:equatable/equatable.dart';

class AddUserEvent extends Equatable{
   const AddUserEvent();

  @override
  List<Object?> get props => [];

}

class AddUser extends AddUserEvent{
  final Map requestBody;
  const AddUser(this.requestBody);
}
