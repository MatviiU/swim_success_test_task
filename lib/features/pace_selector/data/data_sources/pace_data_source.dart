import 'package:swim_success/core/network/http_client.dart';

abstract interface class PaceDataSource {
  Future<void> submitPace(int seconds);
}

class PaceDataSourceImpl implements PaceDataSource {
  PaceDataSourceImpl(this.httpClient);

  final HttpClient httpClient;

  static const _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<void> submitPace(int seconds) async {
    await httpClient.post(Uri.parse(_baseUrl), body: {'pace_seconds': seconds});
  }
}
