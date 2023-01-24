import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../model/Item.dart';
import '../../../repository/items_repository.dart';

part 'get_item_state.dart';

class GetItemCubit extends Cubit<GetItemState> {
  GetItemCubit() : super(GetItemInitial());

  Item? item;

  Future<void> getItem() async {
    if (state is GetItemLoading) {
      return;
    }
    emit(GetItemLoading());

    try {
      item = await ItemsRepository.getItem();

      emit(GetItemLoaded(item));
    } catch (e) {
      emit(GetItemError());
      debugPrint(state.toString());
    }
  }
}
