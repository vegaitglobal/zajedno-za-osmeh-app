import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/benefits_feature/components/tag_pill.dart';
import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BenefitDetailsCard extends StatelessWidget {
  final BenefitModel benefitData;
  final bool showAllServices;

  const BenefitDetailsCard(
      {required this.benefitData, required this.showAllServices, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                benefitData.logoImgUrl,
                fit: BoxFit.contain,
                width: 120,
                height: 70,
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl(Uri.parse(benefitData.websiteUrl));
                },
                child: Row(
                  children: [
                    Text(
                      'website donatora',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.grayBlue,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Image.asset('assets/images/icons/open_in_new_icon.png')
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: benefitData.tags
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: TagPill(text: e),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            benefitData.title,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor),
          ),
          Text(
            benefitData.address,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grayBlue),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: showAllServices
                ? benefitData.services
                    .map(
                      (serviceText) => BenefitServiceSingle(
                        service: serviceText,
                      ),
                    )
                    .toList()
                : [
                    BenefitServiceSingle(
                      service: benefitData.services.first,
                    )
                  ],
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class BenefitServiceSingle extends StatelessWidget {
  final String service;

  const BenefitServiceSingle({
    required this.service,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset('assets/images/icons/check_icon.png'),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              service,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
