import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swim_success/core/di/injector.dart';
import 'package:swim_success/core/router/app_routes.dart';
import 'package:swim_success/core/widgets/home_shell.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_cubit.dart';
import 'package:swim_success/features/pace_selector/presentation/pages/pace_selector_page.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_cubit.dart';
import 'package:swim_success/features/user_list/presentation/pages/user_detail_page.dart';
import 'package:swim_success/features/user_list/presentation/pages/user_list_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.paceSelector,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.paceSelector,
              builder: (context, state) => BlocProvider(
                create: (_) => getIt<PaceCubit>(),
                child: const PaceSelectorPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.users,
              builder: (context, state) => BlocProvider(
                create: (_) => getIt<UserListCubit>()..getUsers(),
                child: const UserListPage(),
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final user = state.extra as UserEntity?;
                    if (user == null) {
                      return const Scaffold(
                        body: Center(child: Text('User not found')),
                      );
                    }
                    return UserDetailPage(user: user);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
