import 'package:swim_success/core/errors/exceptions.dart';
import 'package:swim_success/core/errors/failures.dart';
import 'package:swim_success/features/user_list/data/data_sources/user_list_data_source.dart';
import 'package:swim_success/features/user_list/data/models/user_dto.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/features/user_list/domain/repositories/user_list_repository.dart';

class UserListRepositoryImpl implements UserListRepository {
  UserListRepositoryImpl(this.userListDataSource);

  final UserListDataSource userListDataSource;

  @override
  Future<List<UserEntity>> getUsers() async {
    final List<UserDto> users;
    try {
      users = await userListDataSource.getUsers();
    } on ServerException catch (e) {
      throw ServerFailure(e.message, statusCode: e.statusCode);
    } on NetworkException {
      throw const NetworkFailure();
    } on ParsingException {
      throw const ParsingFailure();
    } catch (_) {
      throw const UnknownFailure();
    }
    return users.map(UserEntity.fromDto).toList();
  }
}
