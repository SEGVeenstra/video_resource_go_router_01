import 'package:flutter/material.dart';
import 'package:go_router_01/cave_explorer_app.dart';
import 'package:go_router_01/cave_explorer_router.dart';

void main() {
  final router = CaveExplorerRouter();
  runApp(CaveExplorerApp(router: router));
}
