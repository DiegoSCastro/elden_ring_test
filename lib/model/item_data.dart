import 'dart:convert';

ItemData dataFromJson(String str) => ItemData.fromJson(json.decode(str));
String dataToJson(ItemData data) => json.encode(data.toJson());

class ItemData {
  ItemData({
    this.id,
    this.name,
    this.image,
    this.description,
    this.type,
    this.effect,
  });

  ItemData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    type = json['type'];
    effect = json['effect'];
  }
  String? id;
  String? name;
  String? image;
  String? description;
  String? type;
  String? effect;
  ItemData copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
    String? type,
    String? effect,
  }) =>
      ItemData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        type: type ?? this.type,
        effect: effect ?? this.effect,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['type'] = type;
    map['effect'] = effect;
    return map;
  }
}
