import 'status.dart';

final class Success<T> extends Status {
  final T? data;
  const Success({this.data});

  @override
  List<Object?> get props => [data];
}
