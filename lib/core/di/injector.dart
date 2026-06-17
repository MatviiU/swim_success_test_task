import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:swim_success/core/network/http_client.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  _registerCore();
}

void _registerCore() {
  getIt
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton(() => HttpClient(getIt()));
}
