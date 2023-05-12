import 'dart:convert';

class Data {
  Data({
    required this.bannerTitle,
    required this.bannerImages,
    required this.rating,
    required this.description,
    required this.details,
    required this.popularTreks,
  });

  final String bannerTitle;
  final List<String> bannerImages;
  final double rating;
  final String description;
  final List<String> details;
  final List<PopularTreks> popularTreks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannerTitle: json['bannerTitle'],
        bannerImages: List.castFrom<dynamic, String>(json['bannerImages']),
        rating: json['rating'],
        description: json['description'],
        details: List.castFrom<dynamic, String>(json['details']),
        popularTreks: List.from(json['popularTreks'])
            .map((e) => PopularTreks.fromJson(e))
            .toList(),
      );

  factory Data.fromString(String data) => Data.fromJson(jsonDecode(data));

  Map<String, dynamic> toJson() => {
        'bannerTitle': bannerTitle,
        'bannerImages': bannerImages,
        'rating': rating,
        'description': description,
        'details': details,
        'popularTreks': popularTreks.map((e) => e.toJson()).toList(),
      };
}

class PopularTreks {
  PopularTreks({
    required this.title,
    required this.thumbnail,
  });
  late final String title;
  late final String thumbnail;

  PopularTreks.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'thumbnail': thumbnail,
      };
}
