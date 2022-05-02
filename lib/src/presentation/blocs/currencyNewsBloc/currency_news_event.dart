part of 'currency_news_bloc.dart';

@immutable
abstract class CurrencyNewsEvent  extends Equatable{}



class FetchCurrencyNewsEvent extends CurrencyNewsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}