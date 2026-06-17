import 'package:equatable/equatable.dart';
import 'package:swim_success/core/errors/failures.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';

sealed class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object?> get props => [];
}

final class UserListInitial extends UserListState {
  const UserListInitial();
}

final class UserListLoading extends UserListState {
  const UserListLoading();
}

final class UserListLoaded extends UserListState {
  const UserListLoaded({required this.users, this.query = ''});

  final List<UserEntity> users;
  final String query;

  List<UserEntity> get filteredUsers {
    if (query.isEmpty) return users;
    final lowerCaseQuery = query.toLowerCase();

    return users.where((user) {
      final lowerCaseName = user.name.toLowerCase();
      final isNameMatch = lowerCaseName.contains(lowerCaseQuery);
      return isNameMatch;
    }).toList();
  }

  UserListLoaded copyWith({String? query}) {
    return UserListLoaded(users: users, query: query ?? this.query);
  }

  @override
  List<Object?> get props => [users, query];
}

final class UserListFailure extends UserListState {
  const UserListFailure({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
