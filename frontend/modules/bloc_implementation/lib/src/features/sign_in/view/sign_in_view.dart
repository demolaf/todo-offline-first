import 'package:bloc_implementation/src/features/home/view/home_view.dart';
import 'package:bloc_implementation/src/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static Route<SignInView> route() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => SignInCubit(
            authRepository: context.read<AuthRepository>(),
          ),
          child: const SignInView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInStateAuthenticated) {
              Navigator.of(context).push(HomeView.route());
            }
          },
          child: GestureDetector(
            onTap: () async {
              await context.read<SignInCubit>().signInUserWithGoogle();
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 44,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BlocSelector<SignInCubit, SignInState, bool>(
                  selector: (state) {
                    if (state is SignInStateAuthenticating) {
                      return state.processingState ==
                          ProcessingState.processing;
                    }
                    return false;
                  },
                  builder: (context, isAuthenticating) {
                    if (isAuthenticating) {
                      return const FittedBox(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                    return Text(
                      'Login with Google',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
