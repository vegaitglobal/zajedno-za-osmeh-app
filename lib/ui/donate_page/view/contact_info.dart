import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Bloc with Streams')),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.white),
            child: ExpansionTile(
              title: Text(
                'Kontakt',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
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
                          Image.asset('assets/images/icons/phone-ringing.png'),
                          SizedBox(
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/icons/email-address.png'),
                          SizedBox(
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
          ),
        ));
  }
}
