part of api_view;

abstract class ApiViewBaseModel {
  const ApiViewBaseModel();
}

class SocialMediaApiViewModel extends ApiViewBaseModel {
  final String id, email, name, gender;
  final List<String> pictures;

  const SocialMediaApiViewModel({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.pictures,
  });

  factory SocialMediaApiViewModel.fromJson(e) {
    final profile = e['profile'];
    return SocialMediaApiViewModel(
      id: e['id'],
      email: profile['email'],
      name: profile['name'],
      gender: profile['gender'],
      pictures: (e['pictures'] as List).map((e) => e.toString()).toList(),
    );
  }
}
