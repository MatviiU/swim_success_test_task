import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:swim_success/core/network/http_client.dart';
import 'package:swim_success/features/user_list/data/data_sources/user_list_data_source.dart';
import 'package:swim_success/features/user_list/data/repositories/user_list_repository_impl.dart';
import 'package:swim_success/features/user_list/domain/repositories/user_list_repository.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  _registerCore();
  _registerFeatures();
}

void _registerCore() {
  getIt
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton(() => HttpClient(getIt()));
}

void _registerFeatures() {
  _registerUserList();
}

void _registerUserList() {
  getIt
    ..registerLazySingleton<UserListDataSource>(
      () => UserListDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<UserListRepository>(
      () => UserListRepositoryImpl(getIt()),
    )
    ..registerFactory(() => UserListCubit(getIt()));
}
