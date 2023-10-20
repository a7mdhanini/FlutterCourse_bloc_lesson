import '../data/models/user_model.dart';

abstract class UserState {}

class InitialState extends UserState {}

class SuccessUserList extends UserState {
  List<UserModel> userList;
  SuccessUserList(this.userList);
}

class SuccessCreatedUser extends UserState {}

class LoadingState extends UserState {}

class FailureState extends UserState {}
