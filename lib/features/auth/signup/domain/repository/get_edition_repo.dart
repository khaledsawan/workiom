import 'package:dartz/dartz.dart';

import '../../data/model/response/edition/edition_id.dart';


abstract class GetEditionRepository {
  Future<Either<dynamic, EditionId>> getEdition();
}
