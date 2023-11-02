import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/donate_page/model/organization_ui_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key, required this.organization});

  final OrganizationUIModel organization;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: SizedBox(
        child: ExpansionTile(
          title: const Text(
            'Uplate',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  _buildBankInfo(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildPaymentsInfo()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _buildPaymentsInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instrukcije za uplatu iz inostranstva',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'EUR correspodent is:',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            Text(
              'SWIFT/BIC',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '${organization.correspondentBankSwift}\n',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              'BANK',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${organization.correspondentBankName}\n',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Acc. With Institution: 57A:',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            Text(
              'SWIFT/BIC',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              organization.beneficiaryBankSwift,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.textColor,
              ),
            )
          ],
        ),
        Wrap(
          children: [
            Text(
              'BANK',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              organization.beneficiaryBankName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.textColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Beneficiary: 59:',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            Text(
              'IBAN',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              organization.beneficiaryIban,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.textColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          organization.beneficiaryName.toUpperCase(),
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
        Text(
          organization.beneficiaryAddress,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor),
        ),
      ],
    );
  }

  Row _buildBankInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          organization.ipsQrUrl,
          height: 80,
          width: 80,
        ),
        const SizedBox(
          width: 20,
          height: 0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dinarski račun:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              organization.account,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Pristupnica fondaciji:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _launchUrl(
                      Uri.parse(organization.accessFileUrl),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/pdf_icon.svg',
                    width: 24,
                    height: 32,
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
