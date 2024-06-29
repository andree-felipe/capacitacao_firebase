import 'dart:async';
import 'dart:io';
import 'dart:math';

import '../../models/app_user.dart';
import 'auth_service.dart';

class AuthMockService implements AuthService {
  // ignore: unused_field
  static final Map<String, AppUser> _users = {};
  static AppUser? _currentUser;
  static MultiStreamController<AppUser?>? _controller;
  static final _userStream = Stream<AppUser?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  // ignore: annotate_overrides
  AppUser? get currentUser {
    return _currentUser;
  }

  // ignore: annotate_overrides
  Stream<AppUser?> get userChanges {
    return _userStream;
  }

  // ignore: annotate_overrides
  Future<void> signup(String name, String email, String password, File image) async {
    final newUser = AppUser(
      id: Random().nextDouble().toString(),
      name: name, 
      email: email, 
      imageURL: image.path,
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  // ignore: annotate_overrides
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  // ignore: annotate_overrides
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(AppUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
