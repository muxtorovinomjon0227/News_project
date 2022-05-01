part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewsLodingState extends NewsState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewsLodedState extends NewsState{
  TeslaNews results;
  NewsLodedState(this.results);
  @override
  // TODO: implement props
  List<Object?> get props => throw NewsLodedState(results);
}
class NewsErrorState extends NewsState{
  String message;
  NewsErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => throw NewsErrorState(message);
}