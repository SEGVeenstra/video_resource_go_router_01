import 'package:flutter/material.dart';
import 'package:go_router_01/cave_explorer_router.dart';

class CaveExplorerApp extends StatelessWidget {
  const CaveExplorerApp({super.key, required this.router});

  final CaveExplorerRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
