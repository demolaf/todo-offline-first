import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/repositories.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SignInState.initial());

  final AuthRepository _authRepository;

  Future<void> signInUserWithGoogle() async {
    try {
      emit(
        const SignInState.authenticating(
          processingState: ProcessingState.processing,
          message: '',
        ),
      );

      await _authRepository.signIn();

      emit(
        const SignInState.authenticating(
          processingState: ProcessingState.success,
          message: '',
        ),
      );

      emit(const SignInState.authenticated());
    } on FirebaseAuthException catch (e) {
      emit(
        SignInState.authenticating(
          processingState: ProcessingState.failure,
          message: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        SignInState.authenticating(
          processingState: ProcessingState.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
