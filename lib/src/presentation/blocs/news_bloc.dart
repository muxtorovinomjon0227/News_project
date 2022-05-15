import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_project/src/data/models/tesla_news_model.dart';

import '../../data/repositores/news_repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository repository;


  NewsBloc(this.repository) : super(NewsInitialState()) {
    on<FetchTeslaNewsEvent>((event, emit) async {
      try {
        TeslaNews results = (await repository.getTeslaNews(event.news));
        emit(NewsLodedState(results));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}