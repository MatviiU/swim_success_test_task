import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/core/constants/app_constants.dart';
import 'package:swim_success/core/widgets/error_view_widget.dart';
import 'package:swim_success/core/widgets/search_input_widget.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_cubit.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_state.dart';
import 'package:swim_success/features/user_list/presentation/widgets/user_list_view_widget.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserListCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text(AppStringsConstants.users)),
      body: BlocBuilder<UserListCubit, UserListState>(
        builder: (context, state) {
          return switch (state) {
            UserListInitial() || UserListLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            UserListLoaded() => Column(
              spacing: 16,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchInputWidget(
                    onChanged: cubit.searchUsers,
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: cubit.getUsers,
                    child: UserListViewWidget(users: state.filteredUsers),
                  ),
                ),
              ],
            ),
            UserListFailure() => ErrorViewWidget(
              message: state.failure.message,
              onRetry: cubit.getUsers,
            ),
          };
        },
      ),
    );
  }
}
