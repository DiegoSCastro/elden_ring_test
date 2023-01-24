import 'package:elden_ring_test/screens/npc/cubit/npc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NpcScreen extends StatefulWidget {
  const NpcScreen({super.key});

  @override
  State<NpcScreen> createState() => _NpcScreenState();
}

class _NpcScreenState extends State<NpcScreen> {
  @override
  void initState() {
    context.read<NpcCubit>().getNpc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NpcCubit, NpcState>(
        builder: (context, state) {
          if (state is NpcInitial) {
            return const Text('initialState');
          }
          if (state is NpcLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NpcLoaded) {
            var firstItem = state.npc?.data?.first;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(state.npc?.count.toString() ?? '0'),
                  Text(firstItem?.name ?? ''),
                  Image.network(
                    firstItem?.image ?? '',
                    width: double.infinity,
                  ),
                  Text(firstItem?.quote ?? ''),
                  const SizedBox(height: 20),
                  Text(firstItem?.location ?? ''),
                  const SizedBox(height: 20),
                  Text(firstItem?.role ?? ''),
                ],
              ),
            );
          } else if (state is NpcError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
