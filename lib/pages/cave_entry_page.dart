import 'package:flutter/material.dart';
import 'package:go_router_01/model/navigation_action.dart';

class CaveEntryPage extends StatelessWidget {
  const CaveEntryPage({super.key, this.enter});

  final NavigationAction? enter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cave Entry')),
      body: Center(
        child: ElevatedButton(
          onPressed: enter?.action,
          child: Text(enter?.name ?? ''),
        ),
      ),
    );
  }
}
