import 'package:chat/features/auth/domain/entities/user_auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserAuthEntity {
  final bool emailVerified;
  final UserMetadata metadata;
  final String? phoneNumber;
  final String? photoURL;
  final List<UserInfo> providerData;
  final String? refreshToken;
  final String? tenantId;
  final String uid;

  const UserModel({
    required this.emailVerified,
    required this.metadata,
    this.phoneNumber,
    this.photoURL,
    required this.providerData,
    this.refreshToken,
    this.tenantId,
    required this.uid,
    required super.name,
    required super.email,
    super.password,
  });

  @override
  List<Object?> get props => [name, email, password];

  factory UserModel.fromUserCredential(User user) {
    return UserModel(
      emailVerified: user.emailVerified,
      metadata: user.metadata,
      providerData: user.providerData,
      uid: user.uid,
      email: user.email,
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
      refreshToken: user.refreshToken,
      tenantId: user.tenantId,
    );
  }
}
