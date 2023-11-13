import 'dart:async';

import '../status/status.dart';

abstract class UseCase<T> {
  const UseCase();
  FutureOr<({Status status, T data})> call();
}
