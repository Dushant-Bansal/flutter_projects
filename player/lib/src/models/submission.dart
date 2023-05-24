class Submission {
  String title;
  String description;
  String mediaUrl;
  String thumbnail;
  String hyperlink;
  String placeholderUrl;

  Submission(
      {required this.title,
      required this.description,
      required this.mediaUrl,
      required this.thumbnail,
      required this.hyperlink,
      required this.placeholderUrl});

  factory Submission.fromJson(Map<String, dynamic> json) => Submission(
        title: json['title'],
        description: json['description'],
        mediaUrl: json['mediaUrl'],
        thumbnail: json['thumbnail'],
        hyperlink: json['hyperlink'],
        placeholderUrl: json['placeholderUrl'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['mediaUrl'] = mediaUrl;
    data['thumbnail'] = thumbnail;
    data['hyperlink'] = hyperlink;
    data['placeholderUrl'] = placeholderUrl;
    return data;
  }
}
