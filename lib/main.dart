import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocarchitecture/features/login/bloc/login_bloc.dart';
import 'package:flutterblocarchitecture/features/login/screen/home_screen.dart';
import 'package:flutterblocarchitecture/features/users/bloc/users_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UsersBloc>(create: (context) => UsersBloc()),
          BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}