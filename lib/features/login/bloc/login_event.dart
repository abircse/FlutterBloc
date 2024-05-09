
import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable{

  const LoginEvent();

  @override
  List<Object?> get props => [];

}

class UserLoginEvent extends LoginEvent {
  final Map request;
  const UserLoginEvent(this.request);
}
