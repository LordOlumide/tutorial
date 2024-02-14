import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/domain/models/screen_details.dart';

part './basic_state.dart';

class BasicCubit extends Cubit<BasicState> {
  BasicCubit()
      : super(
          const BasicState(
            details: ScreenDetails(
              screenTitle: 'Initial title',
              displayList: ['Apple', 'Banana', 'Carrot', 'Drink'],
            ),
            squareColor: Colors.white,
            screenIsLoading: false,
          ),
        );

  void addItemToDisplayList(String item) {
    emit(
      state.copyWith(
        details: state.details.copyWith(
          displayList: [...state.details.displayList, item],
        ),
      ),
    );
  }

  void removeItemFromDisplayList(String item) {
    emit(
      state.copyWith(
        details: state.details.copyWith(
          displayList: state.details.displayList
              .where((element) => element != item)
              .toList(),
        ),
      ),
    );
  }

  void changeTitle(String newTitle) {
    emit(
      state.copyWith(
        details: state.details.copyWith(screenTitle: newTitle),
      ),
    );
  }

  Future<void> changeColor(Color newColor) async {
    emit(state.copyWith(screenIsLoading: true));

    // Delay. Maybe a network call or some async processing
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(squareColor: newColor));
    emit(state.copyWith(screenIsLoading: false));
  }
}
