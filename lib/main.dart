import 'package:bloc_lesson/BlocStateManagmentTemplates/UI/UserUIScreen.dart';
import 'package:bloc_lesson/BlocStateManagmentTemplates/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /** 
   --------------- Focus Here  -----------------------
     **/
      home: BlocProvider(
        create: (BuildContext context) => UsersBloc(),
        child: MyBlocPage(),
      ),
    );
    /** 
   --------------- Focus Here  -----------------------
     **/
  }
}