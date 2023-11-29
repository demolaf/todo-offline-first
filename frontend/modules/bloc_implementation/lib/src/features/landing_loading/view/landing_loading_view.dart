import 'package:bloc_implementation/src/features/home/view/home_view.dart';
import 'package:bloc_implementation/src/features/landing_loading/bloc/landing_loading_bloc.dart';
import 'package:bloc_implementation/src/features/sign_in/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

class LandingLoadingView extends StatelessWidget {
  const LandingLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingLoadingBloc(
        authRepository: context.read<AuthRepository>(),
      )..add(const InitializationRequested()),
      child: BlocConsumer<LandingLoadingBloc, LandingLoadingState>(
        listener: (context, state) {
          if (state is NavigateToSignIn) {
            Navigator.of(context)
                .pushAndRemoveUntil(SignInView.route(), (route) => false);
          }

          if (state is NavigateToHome) {
            Navigator.of(context)
                .pushAndRemoveUntil(HomeView.route(), (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            // TODO(demolaf): You can add a splash animation here
            body: Container(),
          );
        },
      ),
    );
  }
}
