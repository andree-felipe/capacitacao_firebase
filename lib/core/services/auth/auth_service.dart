import 'dart:io';

import 'package:capacitacao_firebase/core/services/auth/auth_mock_service.dart';

import '../../models/app_user.dart';

abstract class AuthService {
  AppUser? get currentUser;

  Stream<AppUser?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  factory AuthService() {
    return AuthMockService();
  }
}
