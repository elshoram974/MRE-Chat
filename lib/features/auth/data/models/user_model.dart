import 'package:chat/features/auth/domain/entities/user_auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends UserAuthEntity {
  @HiveField(0)
  final bool emailVerified;
  @HiveField(1)
  final UserMetadata metadata;
  @HiveField(2)
  final String? phoneNumber;
  @HiveField(3)
  final String? photoURL;
  @HiveField(4)
  final String? refreshToken;
  @HiveField(5)
  final String? tenantId;
  @HiveField(6)
  final String uid;
  @HiveField(7)
  final String? displayName;
  @HiveField(8)
  final String? userPassword;
  @HiveField(9)
  final String? emailAddress;

  const UserModel({
    required this.emailVerified,
    required this.metadata,
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
      metadata: user.metadata,
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
