import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_cubit.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_state.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserListCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
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
                  child: TextField(
                    onChanged: (value) => cubit.searchUsers(value),
                    decoration: const InputDecoration(
                      hintText: 'Search by name',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => cubit.getUsers(),
                    child: state.filteredUsers.isEmpty
                        ? ListView(
                            children: [
                              const Center(child: Text('No users found')),
                            ],
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: state.filteredUsers.length,
                            itemBuilder: (context, index) {
                              final user = state.filteredUsers[index];
                              return ListTile(
                                title: Text(user.name),
                                subtitle: Text(user.email),
                                trailing: Text(user.phone),
                                onTap: () => context.go('user/${user.userId}'),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
            UserListFailure() => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  Text(state.failure.message),
                  ElevatedButton(
                    onPressed: () => cubit.getUsers(),
                    child: const Text('Try again'),
                  ),
                ],
              ),
            ),
          };
        },
      ),
    );
  }
}
