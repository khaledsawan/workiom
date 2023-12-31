import '../../../../../constant/url/app_api_url.dart';
import '../../../../../core/base/base_repo.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/repository/auth_checker_repo.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/user_checker.dart';
import '../model/courses.dart';

class AuthCheckerRepositoryImp extends MainRepository implements AuthCheckerRepository {
  AuthCheckerRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });
  Future<Either<dynamic, UserChecker>> userChecker() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      final result = await data(
        getData: () => remoteData.get(
          path: AppApiUrl.GET_CURRENT_LOGIN_INFORMATION_URL,
          headers: headers,
          model: UserChecker(),
        ),
        needCash: false,
      );
      return result.fold((l) => Left(l), (Courses) => Right(Courses));
    } else {
      return Left(NetworkFailure('You Are Offline'));
    }
  }
}
