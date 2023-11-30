import 'package:dartz/dartz.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/user_checker.dart';
import '../repository/auth_checker_repo.dart';

class AuthCheckerUseCase extends UseCase<UserChecker, NoParams> {
  final AuthCheckerRepository authCheckerRepository;

  AuthCheckerUseCase(this.authCheckerRepository);
  @override
  Future<Either<dynamic, UserChecker>> call(param) async =>
      await authCheckerRepository.userChecker();
}
