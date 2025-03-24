import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        (context, state) => CaveRoomPage(
          down: [
            () => context.caveRouter.goToRoom('A'),
            () => context.caveRouter.goToRoom('B'),
            () => context.caveRouter.goToRoom('C'),
          ],
        ),
    routes: [
      GoRoute(
        name: 'A',
        path: '/A',
        builder: (context, state) => CaveRoomPage(),
      ),
      GoRoute(
        name: 'B',
        path: '/B',
        builder:
            (context, state) => CaveRoomPage(
              right: () => context.caveRouter.goToRoom('C'),
              down: [
                () => context.caveRouter.goToRoom('D'),
                () => context.caveRouter.goToRoom('E'),
              ],
            ),
        routes: [
          GoRoute(
            name: 'D',
            path: '/D',
            builder:
                (context, state) =>
                    CaveRoomPage(right: () => context.caveRouter.goToRoom('E')),
          ),
          GoRoute(
            name: 'E',
            path: '/E',
            builder:
                (context, state) =>
                    CaveRoomPage(left: () => context.caveRouter.goToRoom('D')),
          ),
        ],
      ),
      GoRoute(
        name: 'C',
        path: '/C',
        builder:
            (context, state) => CaveRoomPage(
              left: () => context.caveRouter.goToRoom('B'),
              down: [
                () => context.caveRouter.goToTreasure(),
                () => context.caveRouter.goToRoom('F'),
              ],
            ),
        routes: [
          GoRoute(
            name: 'treasure',
            path: '/treasure',
            builder: (context, state) => CaveTreasurePage(),
          ),
          GoRoute(
            name: 'F',
            path: '/F',
            builder: (context, state) => CaveRoomPage(),
          ),
        ],
      ),
    ],
  ),
];
