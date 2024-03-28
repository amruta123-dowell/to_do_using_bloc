import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_app_bloc/to_do_model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState.initial()) {
    on<FilterEvent>((event, emit) {});
    on<ChangeFilterEvent>(changeFilterState);
  }

  FutureOr<void> changeFilterState(
      ChangeFilterEvent event, Emitter<FilterState> emit) {
    emit(state.copyWith(filter: event.newSelectedFilter));
  }
}
