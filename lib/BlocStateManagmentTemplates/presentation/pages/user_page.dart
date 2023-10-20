import 'package:bloc_lesson/BlocStateManagmentTemplates/bloc/user_bloc.dart';
import 'package:bloc_lesson/BlocStateManagmentTemplates/bloc/user_events.dart';
import 'package:bloc_lesson/BlocStateManagmentTemplates/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/users_list.dart';

class MyBlocPage extends StatelessWidget {
  MyBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(
                AddUserEvent(
                  name: 'ahmed',
                  gender: 'male',
                  email: 'a.hanini@gmail.com',
                ),
              );
        },
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  /**  --------------- Focus Here  ----------------------- **/
  Widget buildBloc() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is LoadingState)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is SuccessCreatedUser)
          return Center(child: Text('Success Creating User!'));
        else if (state is SuccessUserList)
          return UsersList(users: state.userList);
        else if (state is FailureState)
          return Center(child: Text("Errooorrrrr!!"));
        else
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(GetUserEvent());
              },
              child: Text("Get Users List"),
            ),
          );
      },
    );
  }
}
