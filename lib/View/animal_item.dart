import 'package:flutter/material.dart';
import 'package:tu_dien_dong_vat/Model/animal_icon_model.dart';

class AnimalItem extends StatelessWidget {
  const AnimalItem({super.key, required this.data});

  final AnimalIconModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(data.imageRrl),
        const SizedBox(
          height: 4,
        ),
        Text(
          data.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
