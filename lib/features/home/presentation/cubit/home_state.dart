part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}
class LoadingState extends HomeState {
  const LoadingState();
}

class SuccessState extends HomeState {
  const SuccessState();
}

class FailureState extends HomeState {
  final String message;
  const FailureState(this.message);
}
