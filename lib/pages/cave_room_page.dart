import 'package:flutter/material.dart';

class CaveRoomPage extends StatelessWidget {
  const CaveRoomPage({super.key, this.left, this.right, this.down = const []});

  final VoidCallback? left;
  final VoidCallback? right;
  final List<VoidCallback> down;

  @override
  Widget build(BuildContext context) {
    final isDeadEnd = left == null && right == null && down.isEmpty;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            isDeadEnd
                ? Center(child: Icon(Icons.warning_outlined, size: 100))
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (left != null)
                            ElevatedButton(
                              onPressed: left,
                              child: Text('Left'),
                            ),
                          Spacer(),
                          if (right != null)
                            ElevatedButton(
                              onPressed: right,
                              child: Text('Right'),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        spacing: 16,
                        children: [
                          for (final downAction in down.indexed)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: downAction.$2,
                                child: Text('Down ${downAction.$1 + 1}'),
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
