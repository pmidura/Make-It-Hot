part of 'position_bloc.dart';

class PositionState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadedState extends PositionState {
  final List<Position> positions;

  LoadedState({
    required this.positions,
  });

  @override
  List<Object> get props => [positions];
}

class LoadingState extends PositionState {}

class ErrorState extends PositionState {
  final String error;

  ErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
