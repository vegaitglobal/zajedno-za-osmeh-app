import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

import 'model/benefit_model.dart';

class CarouselCard extends StatelessWidget {
  final BenefitModel data;

  const CarouselCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: Column(
        children: [
          Image.network(
            data.coverImgUrl,
            height: 176,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor),
                ),
                Text(
                  '${data.address}, ${data.city}',
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
                        data.services.first,
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
    );
  }
}
