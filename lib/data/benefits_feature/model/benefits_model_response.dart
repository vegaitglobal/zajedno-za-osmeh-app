import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';

class BenefitModelResponse {
  final String? title;
  final String? address;
  final String? city;
  final String? logoImgUrl;
  final String? coverImgUrl;
  final String? websiteUrl;
  final List<dynamic>? services;
  final List<dynamic>? tags;

  BenefitModelResponse({
    required this.title,
    required this.address,
    required this.city,
    required this.websiteUrl,
    required this.coverImgUrl,
    required this.logoImgUrl,
    required this.services,
    required this.tags,
  });

  BenefitModel toUiModel() {
    return BenefitModel(
      title: title ?? 'Anonymous',
      address: address ?? 'Unknown',
      city: city ?? 'Unknown',
      websiteUrl: websiteUrl ?? '',
      coverImgUrl: coverImgUrl != 'null'
          ? coverImgUrl!
          : 'https://media.istockphoto.com/id/1226328537/vector/image-place-holder-with-a-gray-camera-icon.jpg?s=612x612&w=0&k=20&c=qRydgCNlE44OUSSoz5XadsH7WCkU59-l-dwrvZzhXsI=',
      logoImgUrl: logoImgUrl != 'null'
          ? logoImgUrl!
          : 'https://media.istockphoto.com/id/1226328537/vector/image-place-holder-with-a-gray-camera-icon.jpg?s=612x612&w=0&k=20&c=qRydgCNlE44OUSSoz5XadsH7WCkU59-l-dwrvZzhXsI=',
      services: services!.map((e) => e.toString()).toList(),
      tags: tags!.map((e) => e.toString()).toList(),
    );
  }

  @override
  String toString() {
    return 'title: ${this.title}\naddress: ${this.address}\ncity: ${this.city}\nlogoImgUrl: ${this.logoImgUrl}\ncoverImgUrl: ${this.coverImgUrl}\nwebsiteUrl: ${this.websiteUrl}\nservices: ${this.services}\ntags: ${this.tags}\n';
  }
}
