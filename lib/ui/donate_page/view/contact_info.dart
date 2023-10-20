import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/donate_page/model/organization_ui_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key, required this.organization});

  final OrganizationUIModel organization;

  @override
  Widget build(BuildContext context) {
    void launchLink({required String link, required bool isPhone}) async {
      try {
        final Uri convertedLink =
            Uri(scheme: isPhone ? 'tel' : 'mailto', path: link);
        await launchUrl(convertedLink);
      } catch (e) {
        throw Exception('Could not launch $e');
      }
    }

    return Container(
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
            padding:
                const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    launchLink(link: organization.phoneNumber, isPhone: true);
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/images/icons/phone_ringing.png'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        organization.phoneNumber,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    launchLink(link: organization.email, isPhone: false);
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/images/icons/email_address.png'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        organization.email,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
