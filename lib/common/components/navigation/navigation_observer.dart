import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

final myNavigatorObserver = MyNavigatorObserver();

final navigatorKey = GlobalKey<NavigatorState>();

class MyNavigatorObserver extends NavigatorObserver {
  /// A stream that broadcasts whenever the navigation history changes.
  final StreamController<HistoryChange> _historyChangeStreamController =
      StreamController.broadcast();

  /// Accessor to the history change stream.
  Stream<HistoryChange> get historyChangeStream =>
      _historyChangeStreamController.stream;

  /// A list of all the past routes
  final List<Route<dynamic>?> _history = <Route<dynamic>?>[];

  /// Gets a clone of the navigation history as an immutable list.
  BuiltList<Route<dynamic>> get history =>
      BuiltList<Route<dynamic>>.from(_history);

  /// Gets the top route in the navigation stack.
  Route<dynamic>? get top => _history.last;

  /// A list of all routes that were popped to reach the current.
  final List<Route<dynamic>?> _poppedRoutes = <Route<dynamic>?>[];

  /// Gets a clone of the popped routes as an immutable list.
  BuiltList<Route<dynamic>> get poppedRoutes =>
      BuiltList<Route<dynamic>>.from(_poppedRoutes);

  /// Gets the next route in the navigation history,
  /// which is the most recently popped route.
  Route<dynamic>? get next => _poppedRoutes.last;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _poppedRoutes.add(_history.last);
    _history.removeLast();
    _historyChangeStreamController.add(
      HistoryChange(
        action: NavigationStackAction.pop,
        newRoute: route,
        oldRoute: previousRoute,
        routeStack: _history,
      ),
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.add(route);
    _poppedRoutes.remove(route);
    _historyChangeStreamController.add(
      HistoryChange(
        action: NavigationStackAction.push,
        newRoute: route,
        oldRoute: previousRoute,
        routeStack: _history,
      ),
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.remove(route);
    _historyChangeStreamController.add(
      HistoryChange(
        action: NavigationStackAction.remove,
        newRoute: route,
        oldRoute: previousRoute,
        routeStack: _history,
      ),
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final oldRouteIndex = _history.indexOf(oldRoute);
    _history.replaceRange(oldRouteIndex, oldRouteIndex + 1, [newRoute]);
    _historyChangeStreamController.add(
      HistoryChange(
        action: NavigationStackAction.replace,
        newRoute: newRoute,
        oldRoute: oldRoute,
        routeStack: _history,
      ),
    );
  }

  bool constaintRoute(String routeName) {
    return _history.any((e) => e?.settings.name == routeName);
  }
}

/// A class that contains all data that needs to be
/// broadcasted through the history change stream.
class HistoryChange {
  final NavigationStackAction? action;
  final Route<dynamic>? newRoute;
  final Route<dynamic>? oldRoute;
  final List<Route<dynamic>?> routeStack;

  HistoryChange({
    this.action,
    this.newRoute,
    this.oldRoute,
    this.routeStack = const [],
  });
}

enum NavigationStackAction { push, pop, remove, replace }
