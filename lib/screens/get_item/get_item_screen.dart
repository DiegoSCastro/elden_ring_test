import 'package:elden_ring_test/screens/get_item/cubit/get_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetItemScreen extends StatefulWidget {
  const GetItemScreen({super.key});

  @override
  State<GetItemScreen> createState() => _GetItemScreenState();
}

class _GetItemScreenState extends State<GetItemScreen> {
  @override
  void initState() {
    context.read<GetItemCubit>().getItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetItemCubit, GetItemState>(
        builder: (context, state) {
          if (state is GetItemInitial) {
            return const Text('initialState');
          }
          if (state is GetItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetItemLoaded) {
            var firstItem = state.item?.data?.first;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(state.item?.count.toString() ?? '0'),
                  Text(firstItem?.name ?? ''),
                  Image.network(
                    firstItem?.image ?? '',
                    width: double.infinity,
                  ),
                  Text(firstItem?.description ?? ''),
                  const SizedBox(height: 20),
                  Text(firstItem?.type ?? ''),
                  const SizedBox(height: 20),
                  Text(firstItem?.effect ?? ''),
                ],
              ),
            );
          } else if (state is GetItemError) {
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
