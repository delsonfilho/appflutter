import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String lastName;
  final int age;

  final String? image;

  const MyUser(this.id, this.name, this.lastName, this.age, {this.image});

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'age': age,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> map)
      : id = map['id'] as String,
        name = map['name'] as String,
        lastName = map['lastName'] as String,
        age = map['age'] as int,
        image = map['image'] as String?;

  @override
  List<Object?> get props => [id, name, lastName, age, image];
}
