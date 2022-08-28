import '../bloc/user_events.dart';
import '../bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
  UsersBloc() : super(InitialState()) {}
}
