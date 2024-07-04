import 'dart:convert';

class Search {
  int page;
  List<dynamic> results;
  int totalPages;
  int totalResults;

  Search({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      page: json['page'],
      results: json['results'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  Search copyWith({
    int? page,
    List<dynamic>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      Search(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
}
