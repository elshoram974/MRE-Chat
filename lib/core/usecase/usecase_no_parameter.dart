import '../status/status.dart';

abstract class UseCase<T> {
  const UseCase();
  Future<({Status status, T data})> call();
}
