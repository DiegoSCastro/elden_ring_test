class NpcData {
  NpcData({
    this.id,
    this.name,
    this.image,
    this.quote,
    this.location,
    this.role,
  });

  NpcData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    quote = json['quote'];
    location = json['location'];
    role = json['role'];
  }
  String? id;
  String? name;
  String? image;
  dynamic quote;
  String? location;
  String? role;
  NpcData copyWith({
    String? id,
    String? name,
    String? image,
    dynamic quote,
    String? location,
    String? role,
  }) =>
      NpcData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        quote: quote ?? this.quote,
        location: location ?? this.location,
        role: role ?? this.role,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['quote'] = quote;
    map['location'] = location;
    map['role'] = role;
    return map;
  }
}
