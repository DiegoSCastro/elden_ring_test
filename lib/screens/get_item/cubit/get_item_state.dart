part of 'get_item_cubit.dart';

@immutable
abstract class GetItemState {}

class GetItemInitial extends GetItemState {}

class GetItemLoading extends GetItemState {}

class GetItemLoaded extends GetItemState {
  final Item? item;
  GetItemLoaded(this.item);
}

class GetItemError extends GetItemState {}
