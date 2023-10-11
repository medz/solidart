import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

/// Convenience extensions to interact with the [Solid] InheritedModel.
extension SolidExtensions on BuildContext {
  /// Obtains the Provider of the given type P and [id] corresponding to the
  /// nearest [Solid] widget.
  ///
  /// Throws if no such element or [Solid] widget is found.
  ///
  /// Calling this method is O(N) with a small constant factor where N is the
  /// number of [Solid] ancestors needed to traverse to find the provider with
  /// the given [id].
  ///
  /// If you've a single Solid widget in the whole app N is equal to 1.
  /// If you have two Solid ancestors and the provider is present in the nearest
  /// ancestor, N is still 1.
  /// If you have two Solid ancestors and the provider is present in the farest
  /// ancestor, N is 2, and so on.
  ///
  /// This method should not be called from State.dispose because the element
  /// tree is no longer stable at that time.
  ///
  /// Doesn't listen to the provider so it won't cause the widget to rebuild.
  ///
  /// You may call this method inside the `initState` or `build` methods.
  P get<P>([Identifier? id]) {
    return Solid.get<P>(this, id);
  }

  /// Tries to obtain the Provider of the given type P and [id] corresponding to
  /// the nearest [Solid] widget.
  ///
  /// Throws if no such element or [Solid] widget is found.
  ///
  /// Calling this method is O(N) with a small constant factor where N is the
  /// number of [Solid] ancestors needed to traverse to find the provider with
  /// the given [id].
  ///
  /// If you've a single Solid widget in the whole app N is equal to 1.
  /// If you have two Solid ancestors and the provider is present in the nearest
  /// ancestor, N is still 1.
  /// If you have two Solid ancestors and the provider is present in the farest
  /// ancestor, N is 2, and so on.
  ///
  /// This method should not be called from State.dispose because the element
  /// tree is no longer stable at that time.
  ///
  /// Doesn't listen to the provider so it won't cause the widget to rebuild.
  ///
  /// You may call this method inside the `initState` or `build` methods.
  P? maybeGet<P>([Identifier? id]) {
    return Solid.maybeGet<P>(this, id);
  }

  /// Obtains the SolidElement of a Provider of the given type T and [id]
  /// corresponding to the nearest [Solid] widget.
  ///
  /// Throws if no such element or [Solid] widget is found.
  ///
  /// Calling this method is O(N) with a small constant factor where N is the
  /// number of [Solid] ancestors needed to traverse to find the provider with
  /// the given [id].
  ///
  /// If you've a single Solid widget in the whole app N is equal to 1.
  /// If you have two Solid ancestors and the provider is present in the nearest
  /// ancestor, N is still 1.
  /// If you have two Solid ancestors and the provider is present in the farest
  /// ancestor, N is 2, and so on.
  ///
  /// This method should not be called from State.dispose because the element
  /// tree is no longer stable at that time.
  ///
  /// Doesn't listen to the provider so it won't cause the widget to rebuild.
  ///
  /// You may call this method inside the `initState` or `build` methods.
  SolidElement<P> getElement<P>([Identifier? id]) {
    return Solid.getElement<P>(this, id);
  }

  /// Subscribe to the [Signal] of the given type and [id] corresponding to the
  /// nearest [Solid] widget rebuilding the widget when the value exposed by the
  /// [Signal] changes.
  ///
  /// Throws if no such element or [Solid] widget is found.
  ///
  /// Calling this method is O(N) with a small constant factor where N is the
  /// number of [Solid] ancestors needed to traverse to find the signal with
  /// the given [id].
  ///
  /// If you've a single Solid widget in the whole app N is equal to 1.
  /// If you have two Solid ancestors and the signal is present in the nearest
  /// ancestor, N is still 1.
  /// If you have two Solid ancestors and the signal is present in the farest
  /// ancestor, N is 2, and so on.
  ///
  /// This method should not be called from State.dispose because the element
  /// tree is no longer stable at that time.
  ///
  /// Listens to the signal so it causes the widget to rebuild.
  ///
  /// You must call this method only from the `build` method.
  T observe<T>([Identifier? id]) {
    return Solid.observe<T>(this, id);
  }

  /// Convenience method to update a `Signal` value.
  ///
  /// You can use it to update a signal value, e.g:
  /// ```dart
  /// context.update<int>('counter', (value) => value * 2);
  /// ```
  /// This is equal to:
  /// ```dart
  /// // retrieve the signal
  /// final signal = context.get<Signal<int>>('counter');
  /// // update the signal
  /// signal.update((value) => value * 2);
  /// ```
  /// but shorter when you don't need the signal for anything else.
  void update<T>(T Function(T value) callback, [Identifier? id]) {
    return Solid.update<T>(this, callback, id);
  }
}
