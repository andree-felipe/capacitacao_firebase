import 'dart:io';

import '../../models/app_user.dart';

abstract class AuthService {
  AppUser? get currentUser;

  Stream<AppUser?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();
}
