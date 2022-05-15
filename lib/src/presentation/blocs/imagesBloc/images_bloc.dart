import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_project/src/data/models/new_images_models.dart';
import '../../../data/repositores/image_repo.dart';
part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesRepository repository;


  ImagesBloc(this.repository) : super(ImagesInitialState()) {
    on<FetchImagesEvent>((event, emit) async  {
      try {
        List<NewImages> results = (await repository.getImages());
        emit(ImagesLodedState(results));
      } catch (e) {
        emit(ImagesErrorState(e.toString()));
      }
    });
  }
}



