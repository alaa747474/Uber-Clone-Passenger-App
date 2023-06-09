import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String uid;
  final String address;
  final String phone;
  final String image;

  const UserEntity(
    this.name,
    this.email,
    this.uid,
    this.address,
    this.phone,
    this.image,
  );

  @override
  List<Object?> get props => [name, email, uid, address, phone];
}
