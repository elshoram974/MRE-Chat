import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthEntity extends Equatable {
  final String? name;
  final String? email;
  final String? password;

  const UserAuthEntity({
    required this.name,
    required this.email,
    this.password,
  });

  @override
  List<Object?> get props => [name, email, password];

  factory UserAuthEntity.fromUserCredential(User user) {
    return UserAuthEntity(
      name: user.displayName,
      email: user.email,
    );
  }
}
