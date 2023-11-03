import 'package:chat/features/auth/domain/entities/user_auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserAuthEntity {
  @HiveField(0)
  final bool emailVerified;
  @HiveField(1)
  final String? phoneNumber;
  @HiveField(2)
  final String? photoURL;
  @HiveField(3)
  final String? refreshToken;
  @HiveField(4)
  final String? tenantId;
  @HiveField(5)
  final String uid;
  @HiveField(6)
  final String? displayName;
  @HiveField(7)
  final String? userPassword;
  @HiveField(8)
  final String? emailAddress;

  const UserModel({
    required this.emailVerified,
    this.phoneNumber,
    this.photoURL,
    this.refreshToken,
    this.tenantId,
    required this.uid,
    required this.displayName,
    this.userPassword,
    this.emailAddress,
  }) : super(name: displayName, email: emailAddress, password: userPassword);

  @override
  List<Object?> get props => [name, email, password];

  factory UserModel.fromUserCredential(User user) {
    return UserModel(
      emailVerified: user.emailVerified,
      uid: user.uid,
      emailAddress: user.email,
      displayName: user.displayName,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
      refreshToken: user.refreshToken,
      tenantId: user.tenantId,
    );
  }
}
