import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';

abstract interface class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> getUser(String userId);
}
