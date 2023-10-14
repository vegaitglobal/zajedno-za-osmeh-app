class CarouselItem {
  final String title;
  final String address;
  final String logoImgUrl;
  final String coverImgUrl;
  final String websiteUrl;
  final List<String> services;
  final List<String> tags;

  CarouselItem({
    required this.title,
    required this.address,
    required this.websiteUrl,
    required this.coverImgUrl,
    required this.logoImgUrl,
    required this.services,
    required this.tags,
  });
}
