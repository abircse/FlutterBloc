import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterblocarchitecture/features/users/addusers/bloc/add_user_bloc.dart';
import 'package:flutterblocarchitecture/features/users/addusers/bloc/add_user_event.dart';
import 'package:flutterblocarchitecture/features/users/addusers/bloc/add_user_state.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  late AddUserBloc addUserBloc = AddUserBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: BlocProvider(
        create: (context) => addUserBloc,
        child: BlocListener<AddUserBloc, AddUserState>(
          listener: (context, state) {
            if (state is AddUserLoadingState) {
              EasyLoading.show(status: "Adding....");
            } else if (state is AddUserFailedState) {
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is AddUserSuccessState) {
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.id)));
              //Navigator.of(context).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                TextField(
                  controller: email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: password,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  height: 70.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      Map requestBody ={
                        'email': email.value.text,
                        'password': password.value.text
                      };
                      addUserBloc.add(AddUser(requestBody));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      "Add New User!",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
