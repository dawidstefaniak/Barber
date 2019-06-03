import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ImagesState extends Equatable {
  ImagesState([List props = const []]) : super(props);
}

class UninitializedImages extends ImagesState {
  @override
  String toString() {
    return 'UninitializedImages';
  }
}
class LoadingImages extends ImagesState {
  @override
  String toString() {
    return 'LoadingImages';
  }
}
class InitializedImages extends ImagesState {
  final List<String> images;

  InitializedImages([this.images = const []]) : super([images]);

  @override
  String toString() {
    return 'InitializedImages';
  }
}
class ErrorLoadingImages extends ImagesState {
  @override
  String toString() {
    return 'ErrorLoadingImages';
  }
}
