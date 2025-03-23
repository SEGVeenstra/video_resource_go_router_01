import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_01/model/navigation_action.dart';
import 'package:go_router_01/pages/cave_entry_page.dart';
import 'package:go_router_01/pages/cave_room_page.dart';
import 'package:go_router_01/pages/cave_treasure_page.dart';

// NOTE: I like to extend GoRouter so I can add my own methods as you will see below.
class CaveExplorerRouter extends GoRouter {
  CaveExplorerRouter()
    // NOTE: It's important to use the super.routingConfig constructor.
    : super.routingConfig(
        initialLocation: '/',
        routingConfig: ValueNotifier(RoutingConfig(routes: _routes)),
      );

  // NOTE: I like to add my own methods to the router for navigation.
  // They are basically shortcuts for navigating to specif routes.
  // I prefer this because it keeps the navigation logic in one place, the router.
  void goToEntry() => goNamed('entry');
  void goToTreasure() => goNamed('treasure');
  void goToRoom(String name) => goNamed(name);

  // NOTE: Adding this static function makes it easy to get the router from the context.
  static CaveExplorerRouter of(BuildContext context) =>
      GoRouter.of(context) as CaveExplorerRouter;
}

// NOTE: With this extension, using the router is even more pretty!
// Instead of `CaveRouter.of(context)`, you can use `context.caveRouter`.
extension CaveExplorerRouterExt on BuildContext {
  CaveExplorerRouter get caveRouter => CaveExplorerRouter.of(this);
}

// NOTE: These are all the routes to the app.
final _routes = <RouteBase>[
  GoRoute(
    name: 'entry',
    path: '/',
    builder:
        (context, state) => CaveEntryPage(
          enter: NavigationAction(
            'Enter',
            () => context.caveRouter.goToRoom('room'),
          ),
        ),
  ),
  GoRoute(
    name: 'treasure',
    path: '/treasure',
    builder: (context, state) => CaveTreasurePage(),
  ),
  GoRoute(
    name: 'room',
    path: '/room',
    builder:
        (context, state) => CaveRoomPage(
          name: 'Room',
          left: NavigationAction('Left', context.caveRouter.goToEntry),
          down: [
            NavigationAction('Down 1', () => context.caveRouter.goToEntry()),
            NavigationAction('Down 2', () => context.caveRouter.goToTreasure()),
          ],
        ),
  ),
];
