class BenefitModel {
  final String title;
  final String address;
  final String city;
  final String logoImgUrl;
  final String coverImgUrl;
  final String websiteUrl;
  final List<String> services;
  final String categoryName;

  BenefitModel({
    required this.title,
    required this.address,
    required this.city,
    required this.websiteUrl,
    required this.coverImgUrl,
    required this.logoImgUrl,
    required this.services,
    required this.categoryName,
  });

  @override
  String toString() {
    return 'title: ${this.title}\naddress: ${this.address}\ncity: ${this.city}\nlogoImgUrl: ${this.logoImgUrl}\ncoverImgUrl: ${this.coverImgUrl}\nwebsiteUrl: ${this.websiteUrl}\nservices: ${this.services}\ncategoryName: ${this.categoryName}\n';
  }
}
