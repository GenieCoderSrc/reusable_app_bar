import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class SearchFieldCubit extends Cubit<bool> {
  SearchFieldCubit() : super(false);

  void toggleSearchField() {
    debugPrint('SearchFieldCubit | toggleSearchField | state: ${!state}');
    emit(!state);
  }
}
