import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/core/errors/failures.dart';
import 'package:swim_success/features/user_list/domain/repositories/user_list_repository.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit(this.userListRepository) : super(const UserListInitial());

  final UserListRepository userListRepository;

  Future<void> getUsers() async {
    emit(const UserListLoading());
    try {
      final users = await userListRepository.getUsers();
      emit(UserListLoaded(users: users));
    } on Failure catch (e) {
      emit(UserListFailure(failure: e));
    }
  }

  void searchUsers(String query) {
    final state = this.state;

    if (state is UserListLoaded) {
      emit(state.copyWith(query: query));
    }
  }
}
