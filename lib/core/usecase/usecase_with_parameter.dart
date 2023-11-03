import '../status/status.dart';

abstract class UseCase<T, P> {
  const UseCase();
  Future<({Status status, T data})> call(P parameter);
}
