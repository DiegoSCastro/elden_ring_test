import 'package:bloc/bloc.dart';
import 'package:elden_ring_test/model/npc.dart';
import 'package:elden_ring_test/repository/items_repository.dart';

part 'npc_state.dart';

class NpcCubit extends Cubit<NpcState> {
  NpcCubit() : super(NpcInitial());

  Npc? npc;

  Future<void> getNpc() async {
    if (state is NpcLoading) {
      return;
    }
    emit(NpcLoading());
    try {
      npc = await ItemsRepository.getNpc();
      emit(NpcLoaded(npc));
    } on Exception catch (e) {
      emit(NpcError());
    }
  }
}
