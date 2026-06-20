import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swim_success/core/di/injector.dart';
import 'package:swim_success/features/user_list/presentation/cubits/user_list_cubit.dart';
import 'package:swim_success/features/user_list/presentation/pages/user_list_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<UserListCubit>()..getUsers(),
        child: const UserListPage(),
      ),
    ),
  ],
);
