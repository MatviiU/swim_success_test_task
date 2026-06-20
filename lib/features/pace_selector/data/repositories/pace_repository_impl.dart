import 'package:swim_success/core/errors/exceptions.dart';
import 'package:swim_success/core/errors/failures.dart';
import 'package:swim_success/features/pace_selector/data/data_sources/pace_data_source.dart';
import 'package:swim_success/features/pace_selector/domain/repositories/pace_repository.dart';

class PaceRepositoryImpl implements PaceRepository {
  PaceRepositoryImpl(this.paceDataSource);

  final PaceDataSource paceDataSource;
  @override
  Future<void> submitPace(int seconds) async {
    try {
      await paceDataSource.submitPace(seconds);
    } on ServerException catch (e) {
      throw ServerFailure(e.message, statusCode: e.statusCode);
    } on NetworkException {
      throw const NetworkFailure();
    } on ParsingException {
      throw const ParsingFailure();
    } catch (_) {
      throw const UnknownFailure();
    }
  }
}
