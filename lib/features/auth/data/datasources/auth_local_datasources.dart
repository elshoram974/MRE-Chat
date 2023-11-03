import 'package:chat/core/utils/constants/string.dart';
import 'package:hive/hive.dart';

import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();
  Future<UserModel?> getUser();
  Future<String> getUserUid();
  Future<bool> isLoggedIn();
}

class AuthLocalDataSourceImp extends AuthLocalDataSource {
  const AuthLocalDataSourceImp();

  @override
  Future<UserModel?> getUser() async {
    final Box<UserModel> box;
    box = await Hive.openBox<UserModel>(AppString.userHive);

    return box.values.first;
  }

  @override
  Future<String> getUserUid() async => (await getUser())!.uid;

  @override
  Future<bool> isLoggedIn() async => await getUser() != null;
}
