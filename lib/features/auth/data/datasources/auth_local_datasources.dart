import 'package:chat/core/utils/constants/string.dart';
import 'package:hive/hive.dart';

import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();
  UserModel? getUser();
  String getUserUid();
  bool isLoggedIn();
}

class AuthLocalDataSourceImp extends AuthLocalDataSource {
  const AuthLocalDataSourceImp();

  @override
  UserModel? getUser() {
    final Box<UserModel> box = Hive.box<UserModel>(AppString.userHive);
    if (box.isEmpty) return null;

    return box.values.first;
  }

  @override
  String getUserUid() => getUser()!.uid;

  @override
  bool isLoggedIn() => getUser() != null;
}
