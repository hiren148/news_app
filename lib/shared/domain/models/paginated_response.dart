const int perPageLimit = 10;

class PaginatedResponse<T> {
  final int total;
  final List<T> data;

  PaginatedResponse({required this.total, required this.data});

  factory PaginatedResponse.fromJson(dynamic json, List<T> data,
          {Function(dynamic json)? fixture}) =>
      PaginatedResponse(
        total: json['totalResults'] ?? 0,
        data: data,
      );

  @override
  String toString() {
    return 'PaginatedResponse(total:$total, data:${data.length})';
  }
}
