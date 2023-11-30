import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../di.dart';
import '../../domain/entities/user_checker.dart';
import '../../domain/use_case/auth_checker_use_case.dart';

part 'auth_checker_event.dart';
part 'auth_checker_state.dart';

class AuthCheckerBloc extends Bloc<AuthCheckerEvent, AuthCheckerState> {
  AuthCheckerUseCase authCheckerUseCase = getIt();
  AuthCheckerBloc() : super(AuthCheckerInitial()) {
    on<AuthCheckerEvent>(_onUserFetched);
  }

  Future<void> _onUserFetched(
      AuthCheckerEvent event, Emitter<AuthCheckerState> emit) async {
      emit(AuthCheckerLoading());
      final posts = await authCheckerUseCase.call(NoParams());
      posts.fold((l) => emit(AuthCheckerFail()), (r) => emit(AuthCheckerLoaded(r)));
  }
}
