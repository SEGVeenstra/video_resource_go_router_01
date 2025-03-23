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

  void goToEntry() => goNamed('entry');
  void goToTreasure() => goNamed('treasure');
  void goToRoom(String name) => goNamed(name);

  static CaveExplorerRouter of(BuildContext context) =>
      GoRouter.of(context) as CaveExplorerRouter;
}

extension CaveExplorerRouterExt on BuildContext {
  CaveExplorerRouter get caveRouter => CaveExplorerRouter.of(this);
}

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
