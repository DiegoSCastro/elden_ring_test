import 'dart:convert';

import 'npc_data.dart';

Npc npcFromJson(String str) => Npc.fromJson(json.decode(str));
String npcToJson(Npc data) => json.encode(data.toJson());

class Npc {
  Npc({
    this.success,
    this.count,
    this.total,
    this.data,
  });

  Npc.fromJson(dynamic json) {
    success = json['success'];
    count = json['count'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(NpcData.fromJson(v));
      });
    }
  }
  bool? success;
  int? count;
  int? total;
  List<NpcData>? data;
  Npc copyWith({
    bool? success,
    int? count,
    int? total,
    List<NpcData>? data,
  }) =>
      Npc(
        success: success ?? this.success,
        count: count ?? this.count,
        total: total ?? this.total,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['count'] = count;
    map['total'] = total;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

NpcData dataFromJson(String str) => NpcData.fromJson(json.decode(str));
String dataToJson(NpcData data) => json.encode(data.toJson());
