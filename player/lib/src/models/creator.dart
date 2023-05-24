class Creator {
  String? name;
  String id;
  String handle;
  String pic;

  Creator(
      {this.name, required this.id, required this.handle, required this.pic});

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        name: json['name'],
        id: json['id'],
        handle: json['handle'],
        pic: json['pic'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['handle'] = handle;
    data['pic'] = pic;
    return data;
  }
}
