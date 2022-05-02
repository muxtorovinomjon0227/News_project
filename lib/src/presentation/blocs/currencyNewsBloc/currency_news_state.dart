part of 'currency_news_bloc.dart';

@immutable
abstract class CurrencyNewsState extends Equatable {}

class CurrencyNewsInitialState extends CurrencyNewsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CurrencyNewsLodingState extends CurrencyNewsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class  CurrencyNewsLodedState extends CurrencyNewsState{
  List<CurrencyNews> result;
  CurrencyNewsLodedState(this.result);

  @override
  // TODO: implement props
  List<Object?> get props => throw CurrencyNewsLodedState(result);
}

class  CurrencyNewsErrorState extends CurrencyNewsState{
  String message;
  CurrencyNewsErrorState(this.message);


  @override
  // TODO: implement props
  List<Object?> get props => throw CurrencyNewsErrorState(message);
}