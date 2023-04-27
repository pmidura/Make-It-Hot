part of 'position_bloc.dart';

class PositionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TableNameEvent extends PositionEvent {
  final String tableName;

  TableNameEvent({required this.tableName});

  @override
  List<Object?> get props => [];
}
