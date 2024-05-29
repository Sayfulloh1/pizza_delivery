import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'app_view.dart';
import 'blocs/auth_bloc/authentication_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.repository});

  final UserRepository repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: repository),
      child: MyAppView(),
    );
  }
}
