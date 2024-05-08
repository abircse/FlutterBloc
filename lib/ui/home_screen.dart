import 'package:flutter/material.dart';
import 'package:flutterblocarchitecture/bloc/login_bloc.dart';
import 'package:flutterblocarchitecture/bloc/login_event.dart';
import 'package:flutterblocarchitecture/bloc/login_state.dart';
import 'package:flutterblocarchitecture/data/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LoginBloc bloc = LoginBloc();
  LoginRepository repository = LoginRepository();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("F L U T T E R  B L O C"),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Loading....")));
            }
            else if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)));
            }
            if (state is LoginSuccessState) {
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

                      bloc.add(UserLoginEvent(requestBody));
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
