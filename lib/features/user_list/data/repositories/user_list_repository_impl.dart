import 'package:swim_success/features/user_list/data/data_sources/user_list_data_source.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/features/user_list/domain/repositories/user_list_repository.dart';

class UserListRepositoryImpl implements UserListRepository {
  UserListRepositoryImpl(this.userListDataSource);

  final UserListDataSource userListDataSource;

  @override
  Future<List<UserEntity>> getUsers() async {
    final users = await userListDataSource.getUsers();
    final userEntities = users.map((user) => UserEntity.fromDto(user)).toList();
    return userEntities;
  }
}
