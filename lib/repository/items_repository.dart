import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Item.dart';
import '../model/npc.dart';

const baseUrl = 'https://eldenring.fanapis.com/api';

class ItemsRepository {
  static Future<Item> getItem() async {
    var response = await http.get(Uri.parse('$baseUrl/items?limit=2'));

    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  static Future<Npc> getNpc() async {
    var response = await http.get(Uri.parse('$baseUrl/npcs'));
    if (response.statusCode == 200) {
      return Npc.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
