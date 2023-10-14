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
        child: const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
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
