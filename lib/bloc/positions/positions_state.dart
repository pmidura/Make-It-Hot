part of 'positions_cubit.dart';

enum ListStatus {
  loading,
  success,
  failure,
}

class PositionsState extends Equatable {
  final ListStatus status;
  final List<Position> positions;

  const PositionsState._({
    this.status = ListStatus.loading,
    this.positions = const <Position>[],
  });
  
  const PositionsState.loading() : this._();

  const PositionsState.success(List<Position> positions) :
    this._(status: ListStatus.success, positions: positions);

  const PositionsState.failure() : this._(status: ListStatus.failure);

  @override
  List<Object?> get props => [status, positions];
}
