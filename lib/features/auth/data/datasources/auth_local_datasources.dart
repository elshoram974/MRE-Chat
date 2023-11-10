import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthLocalDataSource {
  const AuthLocalDataSource();
  User? getUser();
  String getUserUid();
  bool isLoggedIn();
}

class AuthLocalDataSourceImp extends AuthLocalDataSource {
  const AuthLocalDataSourceImp(this.firebase);
  final FirebaseAuth firebase;

  @override
  User? getUser() => firebase.currentUser;
  

  @override
  String getUserUid() => getUser()!.uid;

  @override
  bool isLoggedIn() => getUser() != null;
}
