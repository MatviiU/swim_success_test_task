import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:swim_success/core/errors/exceptions.dart';

class HttpClient {
  HttpClient(this.client);

  final http.Client client;

  static const _timeout = Duration(seconds: 15);

  Future<dynamic> get(Uri url) async {
    return _send(() => client.get(url).timeout(_timeout));
  }

  Future<dynamic> post(Uri url, {Map<String, dynamic>? body}) async {
    return _send(
      () => client
          .post(
            url,
            headers: const {'Content-Type': 'application/json'},
            body: body == null ? null : jsonEncode(body),
          )
          .timeout(_timeout),
    );
  }

  Future<dynamic> _send(Future<http.Response> Function() request) async {
    final http.Response response;
    try {
      response = await request();
    } on SocketException {
      throw const NetworkException();
    } on HttpException {
      throw const NetworkException();
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      try {
        return jsonDecode(response.body);
      } on FormatException {
        throw const ParsingException();
      }
    }

    throw ServerException(
      'Request failed with status ${response.statusCode}',
      statusCode: response.statusCode,
    );
  }
}
