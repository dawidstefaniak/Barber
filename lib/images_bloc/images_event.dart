import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ImagesEvent extends Equatable {
  ImagesEvent([List props = const []]) : super(props);
}

class GetImages extends ImagesEvent {
  @override
  String toString() {
    return 'GetImages';
  }
}
