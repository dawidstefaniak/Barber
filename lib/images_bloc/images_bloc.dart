import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  @override
  ImagesState get initialState => UninitializedImages();

  @override
  Stream<ImagesState> mapEventToState(
    ImagesEvent event,
  ) async* {
    if (event is GetImages) {
      yield LoadingImages();
      try {
        _mapGetImagesToState();
        yield InitializedImages();
      } catch (_) {
        yield ErrorLoadingImages();
      }
    }
  }

  void _mapGetImagesToState() {
    
  }
}
