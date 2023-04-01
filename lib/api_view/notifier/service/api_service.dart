part of api_view;

abstract class ApiBaseService<T extends ApiViewBaseModel> {
  final Dio client;

  final String path;

  ApiBaseService(
    this.path, {
    required this.client,
  });

  Object Function(Object e)? errorParser;

  String query = '';

  String queryParser(bool success, dynamic data);

  List<T> parse(dynamic data);

  bool _isFetching = false;

  Future<List<T>> next() async {
    if (_isFetching) return [];
    _isFetching = true;
    try {
      final Response response = await client.get("$path?$query");
      if (response.statusCode == 200) query = queryParser(true, response.data);
      _isFetching = false;
      return parse(response.data);
    } catch (e) {
      _isFetching = false;
      if (errorParser == null) rethrow;
      throw errorParser!.call(e);
    }
  }
}
