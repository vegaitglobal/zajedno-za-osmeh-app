import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: const Text(
          'Kontakt',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 24, left: 16, right: 16, bottom: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/icons/phone_ringing.png'),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '+381 64 2387 792',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/icons/email_address.png'),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'info@zajednozaosmeh.com',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
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
