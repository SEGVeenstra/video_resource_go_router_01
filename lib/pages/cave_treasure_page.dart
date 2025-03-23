import 'package:flutter/material.dart';

class CaveTreasurePage extends StatelessWidget {
  const CaveTreasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Treasure')),
      body: Center(child: Icon(Icons.diamond_outlined, size: 128)),
    );
  }
}
