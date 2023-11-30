import 'package:dartz/dartz.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/model/response/edition/edition_id.dart';
import '../repository/get_edition_repo.dart';

class GetEditionUseCase extends UseCase<int, NoParams> {
  final GetEditionRepository getEditionRepository;

  GetEditionUseCase(this.getEditionRepository);
  @override
  Future<Either<dynamic, EditionId>> call(param) async =>
      await getEditionRepository.getEdition();
}
