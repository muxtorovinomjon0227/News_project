
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_project/src/data/models/currency_news_model.dart';

import '../../../data/repositores/currency_news_repo.dart';


part 'currency_news_event.dart';
part 'currency_news_state.dart';

class CurrencyNewsBloc extends Bloc<CurrencyNewsEvent, CurrencyNewsState> {
  CurrencyNewsRepository repository;


  CurrencyNewsBloc(this.repository) : super(CurrencyNewsInitialState()) {
    on<CurrencyNewsEvent>((event, emit) async {
      try {
        CurrencyNews result = (await repository.getCurrencyNews());
        emit(CurrencyNewsLodedState(result));
      } catch (e) {
        emit(CurrencyNewsErrorState(e.toString()));
      }
    });
  }
}
