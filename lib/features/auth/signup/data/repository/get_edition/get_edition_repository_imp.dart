import '../../../../../../constant/url/app_api_url.dart';
import '../../../../../../core/base/base_repo.dart';
import '../../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/repository/get_edition_repo.dart';
import '../../model/response/edition/edition_id.dart';


class AuthCheckerRepositoryImp extends MainRepository implements GetEditionRepository {
  AuthCheckerRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  }); 
  Future<Either<dynamic, EditionId>> getEdition() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      final result = await data(
        getData: () => remoteData.get(
          path: AppApiUrl.GET_CURRENT_LOGIN_INFORMATION_URL,
          headers: headers,
          model: EditionId(),
        ),
        needCash: false,
      );
      return result.fold((l) => Left(l), (Courses) => Right(Courses));
    } else {
      return Left(NetworkFailure('You Are Offline'));
    }
  }
}
