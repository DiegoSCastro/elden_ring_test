import 'package:elden_ring_test/screens/get_item/get_item_screen.dart';
import 'package:elden_ring_test/screens/npc/npc_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elden Ring'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const GetItemScreen()),
                );
              },
              child: const Text('Get items'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NpcScreen()),
                );
              },
              child: const Text('Get Npc'),
            ),
          ],
        ),
      ),
    );
  }
}
