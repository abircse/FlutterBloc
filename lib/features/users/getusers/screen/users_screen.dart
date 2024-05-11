import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterblocarchitecture/features/users/addusers/screen/adduser_screen.dart';
import 'package:flutterblocarchitecture/features/users/getusers/bloc/users_bloc.dart';
import 'package:flutterblocarchitecture/features/users/getusers/bloc/users_event.dart';
import 'package:flutterblocarchitecture/features/users/getusers/bloc/users_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUserScreen()));
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: BlocProvider(
        create: (context) => UsersBloc()..add(LoadUserList()),
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
               EasyLoading.show(status: "Loading User");
            }
            if (state is UsersFailedState) {
              EasyLoading.dismiss();
              return Center(child: Text(state.message));
            }
            if (state is UsersSuccessState) {
              EasyLoading.dismiss();
              return ListView.builder(
                  itemCount: state.usersModel.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = state.usersModel.data![index];
                    return ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        leading: Image.network(user.avatar!),
                        title: Text("${user.firstName!} ${user.lastName}"),
                        subtitle: Text(user.email.toString()),
                    );
                  });
            } else {
              return const Center(child: Text(""));
            }
          },
        ),
      ),
    );
  }
}
