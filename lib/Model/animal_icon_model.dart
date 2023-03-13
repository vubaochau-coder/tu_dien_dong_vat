import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalIconModel {
  final String name;
  final String imageRrl;
  final String id;

  AnimalIconModel({
    required this.name,
    required this.imageRrl,
    required this.id,
  });

  factory AnimalIconModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;

    return AnimalIconModel(
      name: data['name'],
      imageRrl: data['icon_url'],
      id: snapshot.id,
    );
  }
}
