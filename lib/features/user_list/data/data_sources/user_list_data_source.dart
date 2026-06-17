import 'package:swim_success/core/errors/exceptions.dart';
import 'package:swim_success/core/network/http_client.dart';
import 'package:swim_success/features/user_list/data/models/user_dto.dart';

abstract interface class UserListDataSource {
  Future<List<UserDto>> getUsers();
}

class UserListDataSourceImpl implements UserListDataSource {
  UserListDataSourceImpl(this.httpClient);

  static const _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  final HttpClient httpClient;
  
  @override
  Future<List<UserDto>> getUsers() async {
    final response = await httpClient.get(Uri.parse(_baseUrl));
    if (response is! List) {
      throw ServerException('Invalid response format');
    }

    final users = response.map((user) => UserDto.fromJson(user)).toList();
    return users;
  }
}
