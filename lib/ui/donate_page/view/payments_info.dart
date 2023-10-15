import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/donate_page/model/organization_ui_model.dart';

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
          'Instrukcije za naplatu iz inostranstva',
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
        Text(
          '${organization.correspondentBankSwift} – ${organization.correspondentBankName}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.textColor,
          ),
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
        Text(
          '${organization.beneficiaryBankSwift}\n${organization.beneficiaryBankName}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.textColor,
          ),
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
        Text(
          organization.beneficiaryIban,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.textColor,
          ),
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
      ],
    );
  }

  Row _buildBankInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/icons/bank_qr_code.png',
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
                    print('TODO');
                  },
                  child: Image.asset(
                    'assets/images/icons/pdf_icon.png',
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
}
