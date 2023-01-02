import 'package:solidart/solidart.dart';

/// A derived signal.
///
/// [SignalSelector] is a [Signal] that notifies only whenever the selected
/// value changes.
class SignalSelector<Input, Output> extends Signal<Output> {
  SignalSelector({
    required this.signal,
    required this.selector,
    SignalOptions<Output> options = const SignalOptions(),
  }) : super(selector(signal.value), options: options) {
    // dispose the [SignalSelector] when the signal disposes
    signal.onDispose(dispose);
    _listenAndSelect();
  }

  /// The signal that was selected
  final Signal<Input> signal;

  /// The selector applied
  final Output Function(Input) selector;

  void _listener() {
    value = selector(signal.value);
  }

  void _listenAndSelect() {
    signal.addListener(_listener);
  }

  @override
  void dispose() {
    signal.removeListener(_listener);
    super.dispose();
  }
}
