import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocarchitecture/features/users/bloc/users_bloc.dart';
import 'package:flutterblocarchitecture/features/users/bloc/users_event.dart';
import 'package:flutterblocarchitecture/features/users/bloc/users_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UsersBloc bloc = UsersBloc();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<UsersBloc>(context);
    bloc.add(LoadUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UsersFailedState) {
            return Center(child: Text(state.message));
          }
          if (state is UsersSuccessState) {
            return ListView.builder(
                itemCount: state.usersModel.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = state.usersModel.data![index];
                  return ListTile(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      leading: const Icon(Icons.person),
                      title: Text(user.firstName.toString()));
                });
          } else {
            return const Center(child: Text("No Data Found"));
          }
        },
      ),
    );
  }
}
