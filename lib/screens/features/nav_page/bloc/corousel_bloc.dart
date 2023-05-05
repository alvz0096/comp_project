import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'corousel_event.dart';
part 'corousel_state.dart';

class CorouselBloc extends Bloc<CorouselEvent, CorouselState> {
  CorouselBloc() : super(CorouselState()) {
    on<CorouselEvent>((event, emit) {
      emit(CorouselState(page: state.page));
    });
  }
}
