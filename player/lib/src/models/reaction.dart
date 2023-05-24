class Reaction {
  int count;
  bool voted;

  Reaction({required this.count, required this.voted});

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        count: json['count'],
        voted: json['voted'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['voted'] = voted;
    return data;
  }
}
