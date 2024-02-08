part of 'wine_bloc.dart';

abstract class WineState extends Equatable {
  const WineState();
  
  @override
  List<Object> get props => [];
}

final class WineInitial extends WineState {}
final class WineLoading extends WineState {}
final class WineLoaded extends WineState {
  final List<WineModel> wineModel;
  const WineLoaded({required this.wineModel});
  
}
final class WineError extends WineState {
  final String? message;

  WineError( {required this.message});
}