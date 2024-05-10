import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterblocarchitecture/features/login/bloc/login_bloc.dart';
import 'package:flutterblocarchitecture/features/login/bloc/login_event.dart';
import 'package:flutterblocarchitecture/features/login/bloc/login_state.dart';

import '../../users/getusers/screen/users_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final LoginBloc loginBloc = LoginBloc();

    return Scaffold(
        appBar: AppBar(
          title: const Text("F L U T T E R  B L O C"),
        ),
        body: BlocProvider(
          create: (context) => loginBloc,
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
                EasyLoading.show(status: "Login....");
              }
              else if (state is LoginErrorState) {
                EasyLoading.dismiss();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)));
              }
              if (state is LoginSuccessState) {
                EasyLoading.dismiss();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "Keep connect with us",
                    style: TextStyle(fontSize: 17.0),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: email,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
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
                        Map requestBody = {
                          'email': email.value.text,
                          'password': password.value.text,
                        };

                        loginBloc.add(UserLoginEvent(requestBody));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "Login Now!",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "See Users",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
