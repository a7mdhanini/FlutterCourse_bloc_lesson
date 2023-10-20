import 'dart:async';
import 'dart:developer';

import 'package:bloc_lesson/BlocStateManagmentTemplates/data/api/user_api.dart';

import '../bloc/user_events.dart';
import '../bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialState()) {
    on<GetUserEvent>(_getUsersList);
    on<AddUserEvent>(_addUser);
  }

  FutureOr<void> _getUsersList(
      GetUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());

    try {
      List<UserModel> usersList = await UserApi().getUsers();
      emit(SuccessUserList(usersList));
    } catch (e) {
      log(e.toString());
      emit(FailureState());
    }
  }

  FutureOr<void> _addUser(AddUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());

    try {
      bool isCreated = await UserApi()
          .postUser(name: event.name, gender: event.gender, email: event.email);

      if (isCreated) {
        emit(SuccessCreatedUser());
      } else {
        emit(FailureState());
      }
    } catch (e) {
      log(e.toString());
      emit(FailureState());
    }
  }
}
