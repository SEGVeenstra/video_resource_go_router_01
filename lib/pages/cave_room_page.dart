import 'package:flutter/material.dart';
import 'package:go_router_01/model/navigation_action.dart';

class CaveRoomPage extends StatelessWidget {
  const CaveRoomPage({
    super.key,
    required this.name,
    this.left,
    this.right,
    this.down = const [],
  });

  final String name;
  final NavigationAction? left;
  final NavigationAction? right;
  final List<NavigationAction> down;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (left != null)
                    ElevatedButton(
                      onPressed: left!.action,
                      child: Text(left!.name),
                    ),
                  if (right != null)
                    ElevatedButton(
                      onPressed: right!.action,
                      child: Text(right!.name),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                spacing: 16,
                children: [
                  for (final downAction in down)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: downAction.action,
                        child: Text(downAction.name),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
