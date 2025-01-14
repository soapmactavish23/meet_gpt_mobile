import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meet_gpt_mobile/core/constants/local_storage_key.dart';
import 'package:meet_gpt_mobile/core/exception/service_exception.dart';
import 'package:meet_gpt_mobile/core/fp/either.dart';
import 'package:meet_gpt_mobile/core/auth/models/user.dart';
import 'package:meet_gpt_mobile/core/provider/user/user_provider.dart';
import 'package:meet_gpt_mobile/core/auth/models/token.dart';

import 'package:meet_gpt_mobile/core/auth/services/user/user_service_impl.dart';

class UserProviderImpl extends ChangeNotifier implements UserProvider {
  List<User> list = [];
  List<User> anoterUsers = [];
  User obj = User.empty();
  bool _loading = false;
  User? userLogged;
  UserServiceImpl service = UserServiceImpl();

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool get loading => _loading;

  UserProviderImpl() {
    loadCurrentUser();
  }

  Future<void> loadCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(LocalStorageKey.accessToken);

      if (token != null) {
        bool isExpired = JwtDecoder.isExpired(token);
        if (!isExpired) {
          final code = JwtDecoder.decode(token)['sub'];
          await findByCode(code);
        }
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> findByCode(String code) async {
    try {
      final result = await service.findByCode(code);
      switch (result) {
        case Success(value: final User user):
          userLogged = user;
          notifyListeners();
          return Future.value();
        case Failure(:final exception):
          return Future.error(exception.message);
      }
    } catch (e) {
      loading = false;
      return Future.error(
        ServiceException(
          message: 'Erro ao pesquisar usuário por e-mail: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(LocalStorageKey.accessToken);
    userLogged = null;
  }

  @override
  Future<void> signIn(String email, String password) async {
    final result = await service.signIn(email, password);
    switch (result) {
      case Success(value: final Token token):
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(LocalStorageKey.accessToken, token.accessToken);
        return Future.value();
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }

  Future<void> search({String name = ""}) async {
    loading = true;
    final result = await service.search(name: name);

    switch (result) {
      case Success(value: final List<User> users):
        list = users;
        loading = false;
      case Failure(:final exception):
        loading = false;
        return Future.error(exception.toString());
    }
  }

  @override
  Future<void> delete() async {
    loading = true;
    final result = await service.deleteById(obj.id!);
    obj = User.empty();
    loading = false;
    switch (result) {
      case Success():
        await search();
        Future.value();
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }

  @override
  Future<void> findById(String code) async {
    loading = true;
    final result = await service.findByCode(code);
    loading = false;
    switch (result) {
      case Success(:final value):
        obj = value;
        Future.value();
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }

  @override
  Future<void> save() async {
    loading = true;
    Either<ServiceException, User>? result;
    if (obj.id == null) {
      result = await service.create(obj);
    } else {
      result = await service.update(obj);
    }
    loading = false;

    switch (result) {
      case Success():
        await search();
        Future.value();
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }
}
