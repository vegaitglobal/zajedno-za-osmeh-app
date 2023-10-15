import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/authentification_feature/view/forgot_password_card.dart';
import 'package:gu_mobile/ui/authentification_feature/view/signup_card.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail_card.dart';
import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

import '../../authentification_feature/view/login_card.dart';
import '../../authentification_feature/view/upload_medical_record.dart';

class AuthentificationView extends StatefulWidget {
  AuthentificationView({super.key});

  @override
  State<AuthentificationView> createState() => _AuthentificationViewState();
}

class _AuthentificationViewState extends State<AuthentificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: GestureDetector(
          onTap: () {
            // TODO: handle back
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Image.asset('assets/images/icons/arrow.png'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Nazad',
                  style: TextStyle(fontSize: 14, color: AppColors.royalBlue),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: UploadMedicalrecordCard(),
          ),
        ],
      ),
    );
  }
}
