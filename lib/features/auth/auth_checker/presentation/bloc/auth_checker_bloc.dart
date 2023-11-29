import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_checker_event.dart';
part 'auth_checker_state.dart';

class AuthCheckerBloc extends Bloc<AuthCheckerEvent, AuthCheckerState> {
  AuthCheckerBloc() : super(AuthCheckerInitial()) {
    on<AuthCheckerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
