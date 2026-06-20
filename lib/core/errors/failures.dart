import 'package:equatable/equatable.dart';
import 'package:swim_success/core/constants/app_constants.dart';

sealed class Failure extends Equatable implements Exception {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.statusCode});

  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

final class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = AppStringsConstants.noInternetConnection,
  ]);
}

final class ParsingFailure extends Failure {
  const ParsingFailure([
    super.message = AppStringsConstants.failedToParseServerResponse,
  ]);
}

final class UnknownFailure extends Failure {
  const UnknownFailure([
    super.message = AppStringsConstants.somethingWentWrong,
  ]);
}
