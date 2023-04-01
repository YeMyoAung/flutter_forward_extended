part of api_view;

class SocialMediaApiService extends ApiBaseService<SocialMediaApiViewModel> {
  SocialMediaApiService(super.path, [Dio? dio]) : super(client: dio ?? Dio());

  @override
  List<SocialMediaApiViewModel> parse(dynamic data) {
    if (data is! List) throw "Please implement new";
    return data.map((e) => SocialMediaApiViewModel.fromJson(e)).toList();
  }

  @override
  String queryParser(bool success, dynamic data) {
    return '';
  }

  @override
  Object Function(Object e)? get errorParser => null;
}
