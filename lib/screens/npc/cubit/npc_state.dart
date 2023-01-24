part of 'npc_cubit.dart';

abstract class NpcState {}

class NpcInitial extends NpcState {}

class NpcLoading extends NpcState {}

class NpcLoaded extends NpcState {
  final Npc? npc;
  NpcLoaded(this.npc);
}

class NpcError extends NpcState {}
