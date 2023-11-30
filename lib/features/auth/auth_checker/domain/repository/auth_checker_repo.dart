import 'package:dartz/dartz.dart';

import '../entities/user_checker.dart';

abstract class  AuthCheckerRepository {
  Future<Either<dynamic, UserChecker>> userChecker();
}


