import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';

/// State for login form
class LoginState {
  final String email;
  final String password;
  final bool isObscured;
  final bool isLoading;
  final String? error;
  final LoginResponseEntity? loginResponse;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isObscured = true,
    this.isLoading = false,
    this.error,
    this.loginResponse,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isObscured,
    bool? isLoading,
    String? error,
    LoginResponseEntity? loginResponse,
    bool clearError = false,
    bool clearLoginResponse = false,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isObscured: isObscured ?? this.isObscured,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      loginResponse: clearLoginResponse ? null : (loginResponse ?? this.loginResponse),
    );
  }

  /// Check if form is valid
  bool get isValid {
    return email.isNotEmpty && 
           password.isNotEmpty && 
           password.length >= 8 &&
           _isValidEmail(email);
  }

  /// Simple email validation
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

/// ViewModel for login screen
class LoginViewModel extends StateNotifier<LoginState> {
  final AuthRepository authRepository;

  LoginViewModel({required this.authRepository}) : super(const LoginState());

  /// Update email
  void updateEmail(String value) {
    state = state.copyWith(email: value.trim(), clearError: true);
  }

  /// Update password
  void updatePassword(String value) {
    state = state.copyWith(password: value, clearError: true);
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    state = state.copyWith(isObscured: !state.isObscured);
  }

  /// Submit login form
  Future<bool> login() async {
    if (!state.isValid) {
      state = state.copyWith(
        error: 'Mohon lengkapi email dan password (minimal 8 karakter)',
      );
      return false;
    }

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await authRepository.login(state.email, state.password);

      return result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
          return false;
        },
        (loginResponse) {
          state = state.copyWith(
            isLoading: false,
            loginResponse: loginResponse,
          );
          return true;
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
      return false;
    }
  }

  /// Login with Google
  Future<bool> loginWithGoogle() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // TODO: Implement Google Sign-In
      state = state.copyWith(
        isLoading: false,
        error: 'Login dengan Google belum tersedia',
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
      return false;
    }
  }
}
