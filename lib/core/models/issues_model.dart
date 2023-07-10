import 'dart:convert';

class IssuesModel {
  String error;
  int offset;
  List<Result> results;
  int numberOfTotalResults;

  IssuesModel({
    required this.error,
    required this.offset,
    required this.results,
    required this.numberOfTotalResults
  });

  factory IssuesModel.fromRawJson(String str) => IssuesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesModel.fromJson(Map<String, dynamic> json) => IssuesModel(
        error: json["error"],
        offset: json["offset"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        numberOfTotalResults: json["numberOfTotalResults"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "offset": offset,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };

}

class Result {
  String apiDetailUrl;
  DateTime dateAdded;
  Image image;
  String? name;

  Result({
    required this.apiDetailUrl,
    required this.dateAdded,
    required this.image,
    this.name,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        apiDetailUrl: json["api_detail_url"],
        dateAdded: DateTime.parse(json["date_added"]),
        image: Image.fromJson(json["image"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "date_added": dateAdded.toIso8601String(),
        "image": image.toJson(),
        "name": name,
    };

}

class Image {
  String originalUrl;

  Image({
    required this.originalUrl,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        originalUrl: json["original_url"],
    );

    Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
    };

}
