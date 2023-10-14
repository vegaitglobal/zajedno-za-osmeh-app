import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';

import '../model/carousel_item_model.dart';

class CarouselCard extends StatelessWidget {
  final BenefitModel benefitData;

  const CarouselCard({required this.benefitData, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.go(AppRoutes.benefitDetail.path(), extra: benefitData),
      child: Container(
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        child: Column(
          children: [
            Image.network(
              benefitData.coverImgUrl,
              height: 176,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    benefitData.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor),
                  ),
                  Text(
                    benefitData.address,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayBlue),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/icons/check_icon.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          benefitData.services.first,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
