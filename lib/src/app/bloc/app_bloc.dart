import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<EventNavigationButtonPressed>(_onNavigationPressed);
  }

  void _onNavigationPressed(EventNavigationButtonPressed event, Emitter<AppState> emit) {
    emit(AppStateChangeSelectedIndex(selectedIndex: event.index));
  }
}
