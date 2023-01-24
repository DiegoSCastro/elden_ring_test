import 'dart:convert';

import 'item_data.dart';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));
String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    this.success,
    this.count,
    this.total,
    this.data,
  });

  Item.fromJson(dynamic json) {
    success = json['success'] as bool;
    count = json['count'] as int;
    total = json['total'] as int;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ItemData.fromJson(v));
      });
    }
  }
  bool? success;
  int? count;
  int? total;
  List<ItemData>? data;
  Item copyWith({
    bool? success,
    int? count,
    int? total,
    List<ItemData>? data,
  }) =>
      Item(
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
