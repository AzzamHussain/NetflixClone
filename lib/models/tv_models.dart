import 'dart:convert';

class TvSeriesModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  TvSeriesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  TvSeriesModel copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      TvSeriesModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) {
    return TvSeriesModel(
      page: json['page'],
      results:
          List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  List<OriginCountry> originCountry;
  OriginalLanguage originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  DateTime firstAirDate;
  String name;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  Result copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    List<OriginCountry>? originCountry,
    OriginalLanguage? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? firstAirDate,
    String? name,
    double? voteAverage,
    int? voteCount,
  }) =>
      Result(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalName: originalName ?? this.originalName,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        name: name ?? this.name,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      id: json['id'],
      originCountry: List<OriginCountry>.from(
          json['origin_country'].map((x) => originCountryValues.map[x]!)),
      originalLanguage: originalLanguageValues.map[json['original_language']]!,
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      firstAirDate: DateTime.parse(json['first_air_date']),
      name: json['name'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

enum OriginCountry { NL, US, ZA }

enum OriginalLanguage { AF, EN, ES, NL }

final originCountryValues = EnumValues({
  "NL": OriginCountry.NL,
  "US": OriginCountry.US,
  "ZA": OriginCountry.ZA,
});

final originalLanguageValues = EnumValues({
  "af": OriginalLanguage.AF,
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "nl": OriginalLanguage.NL,
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
