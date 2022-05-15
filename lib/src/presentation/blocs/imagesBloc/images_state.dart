part of 'images_bloc.dart';

@immutable
abstract class ImagesState extends Equatable {}

class ImagesInitialState extends ImagesState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}







class ImagesLodingState extends ImagesState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}



class ImagesLodedState extends ImagesState{
  List<NewImages> images;
  ImagesLodedState(this.images);
  @override
  // TODO: implement props
  List<Object?> get props => throw ImagesLodedState(images);


}
class ImagesErrorState extends ImagesState{
  String messages;
  ImagesErrorState(this.messages);
  @override
  // TODO: implement props
  List<Object?> get props => throw ImagesErrorState(messages);
}