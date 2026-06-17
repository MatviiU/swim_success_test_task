import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';

abstract interface class UserListRepository {
  Future<List<UserEntity>> getUsers();
}
