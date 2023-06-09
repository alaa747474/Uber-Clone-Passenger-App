import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber_clone/features/Auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
    super.name,
    super.email,
    super.uid,
    super.address,
    super.phone,
    super.image
  );
  factory UserModel.fromJson(DocumentSnapshot snap) {
    return UserModel(
      snap['name'],
      snap['email'],
      snap['uid'],
      snap['address'],
      snap['phone'],
      snap['image']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'address': address,
      'phone': phone,
      'image':image
    };
  }
}
