import 'dart:convert';

class PhotoModel {
  PhotoModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.liked,
    required this.alt,
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  bool liked;
  String alt;
  String original;

  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    final String original = json["src"] != null ? json["src"]["original"] : "";
    final String large = json["src"] != null ? json["src"]["large"] : "";
    final String medium = json["src"] != null ? json["src"]["medium"] : "";
    final String small = json["src"] != null ? json["src"]["small"] : "";
    final String portrait = json["src"] != null ? json["src"]["portrait"] : "";
    final String landscape =
        json["src"] != null ? json["src"]["landscape"] : "";
    final String tiny = json["src"] != null ? json["src"]["tiny"] : "";
    return PhotoModel(
      id: json["id"],
      width: json["width"],
      height: json["height"],
      url: json["url"],
      photographer: json["photographer"],
      photographerUrl: json["photographer_url"],
      photographerId: json["photographer_id"],
      avgColor: json["avg_color"],
      liked: json["liked"],
      alt: json["alt"],
      original: original,
      large: large,
      medium: medium,
      small: small,
      portrait: portrait,
      landscape: landscape,
      tiny: tiny,
    );
  }

  static Map<String, dynamic> toJson(PhotoModel photoModel) => {
        "id": photoModel.id,
        "width": photoModel.width,
        "height": photoModel.height,
        "url": photoModel.url,
        "photographer": photoModel.photographer,
        "photographer_url": photoModel.photographerUrl,
        "photographer_id": photoModel.photographerId,
        "avg_color": photoModel.avgColor,
        "liked": photoModel.liked,
        "alt": photoModel.alt,
        "original": photoModel.original,
        "large": photoModel.large,
        "medium": photoModel.medium,
        "small": photoModel.small,
        "portrait": photoModel.portrait,
        "landscape": photoModel.landscape,
        "tiny": photoModel.tiny,
      };

  static String encode(List<PhotoModel> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => PhotoModel.toJson(music))
            .toList(),
      );

  static List<PhotoModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<PhotoModel>((item) => PhotoModel.fromJson(item))
          .toList();
}
