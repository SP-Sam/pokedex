import 'package:flutter/material.dart';

class PokeAbilityChip extends StatelessWidget {
  final String? ability;

  const PokeAbilityChip({
    Key? key,
    this.ability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        ability!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      backgroundColor: Colors.grey,
    );
  }
}
