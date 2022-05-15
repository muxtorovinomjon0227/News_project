part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {}



class FetchTeslaNewsEvent extends NewsEvent {
  String news;
  FetchTeslaNewsEvent(this.news);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError(news);

}
