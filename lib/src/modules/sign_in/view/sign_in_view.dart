import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:todo_bloc/src/modules/create_todo/bloc/create_todo_bloc.dart';
import 'package:todo_bloc/src/modules/sign_in/cubit/sign_in_cubit.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  await context.read<SignInCubit>().signInUserWithGoogle();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                        return Center(
                          child: SizedBox(
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onBackground,
                              strokeWidth: 3,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          'Login with Google',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
