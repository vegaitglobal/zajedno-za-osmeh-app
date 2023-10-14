import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/donate_page/view/contact_info.dart';
import 'package:gu_mobile/ui/donate_page/view/payments_info.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donate page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/icons/left_arrow.png',
                    height: 14,
                    width: 7,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Nazad',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ContactInfo(),
              SizedBox(
                height: 20,
              ),
              PaymentInfo(),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.bodyBackgroundColor,
    );
  }
}
