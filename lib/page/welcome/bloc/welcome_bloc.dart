import 'package:flutter_bloc/flutter_bloc.dart';

import 'welcome_event.dart';
import 'welcome_state.dart';

class WelcomeBlocs extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBlocs() : super(InitStates()) {
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeStates(page: state.page));
    });
  }
}
