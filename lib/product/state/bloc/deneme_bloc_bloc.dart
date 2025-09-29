import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'deneme_bloc_event.dart';
part 'deneme_bloc_state.dart';

class DenemeBlocBloc extends Bloc<DenemeBlocEvent, DenemeBlocState> {
  DenemeBlocBloc() : super(DenemeBlocInitial()) {
    on<DenemeBlocEvent>((event, emit) {});
  }
}
