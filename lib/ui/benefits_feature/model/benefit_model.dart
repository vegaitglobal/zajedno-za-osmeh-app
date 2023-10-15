class BenefitModel {
  final String title;
  final String address;
  final String city;
  final String logoImgUrl;
  final String coverImgUrl;
  final String websiteUrl;
  final List<String> services;
  final List<String> tags;

  BenefitModel({
    required this.title,
    required this.address,
    required this.city,
    required this.websiteUrl,
    required this.coverImgUrl,
    required this.logoImgUrl,
    required this.services,
    required this.tags,
  });

  @override
  String toString() {
    return 'title: ${this.title}\naddress: ${this.address}\ncity: ${this.city}\nlogoImgUrl: ${this.logoImgUrl}\ncoverImgUrl: ${this.coverImgUrl}\nwebsiteUrl: ${this.websiteUrl}\nservices: ${this.services}\ntags: ${this.tags}\n';
  }
}
