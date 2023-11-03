// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      emailVerified: fields[0] as bool,
      metadata: fields[1] as UserMetadata,
      phoneNumber: fields[2] as String?,
      photoURL: fields[3] as String?,
      refreshToken: fields[4] as String?,
      tenantId: fields[5] as String?,
      uid: fields[6] as String,
      displayName: fields[7] as String?,
      userPassword: fields[8] as String?,
      emailAddress: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.emailVerified)
      ..writeByte(1)
      ..write(obj.metadata)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.photoURL)
      ..writeByte(4)
      ..write(obj.refreshToken)
      ..writeByte(5)
      ..write(obj.tenantId)
      ..writeByte(6)
      ..write(obj.uid)
      ..writeByte(7)
      ..write(obj.displayName)
      ..writeByte(8)
      ..write(obj.userPassword)
      ..writeByte(9)
      ..write(obj.emailAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
