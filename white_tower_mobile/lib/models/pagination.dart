

class Pagination<T> {
  static const int defaultSize = 50;

  List<T> list;
  int currentPage;
  int size;
  bool isLoading;
  bool hasMore;

  Pagination({
    required this.list,
    required this.currentPage,
    this.size = defaultSize,
    required this.isLoading,
    required this.hasMore,
  });
}
