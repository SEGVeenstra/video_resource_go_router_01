import 'dart:ui';

class NavigationAction {
  NavigationAction(this.name, this.action);

  final String name;
  final VoidCallback action;
}
