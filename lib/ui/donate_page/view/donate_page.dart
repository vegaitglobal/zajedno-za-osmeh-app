import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/common/left_arrow_back_button.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/donate_page/bloc/donate_page_bloc.dart';
import 'package:gu_mobile/ui/donate_page/view/contact_info.dart';
import 'package:gu_mobile/ui/donate_page/view/payments_info.dart';

import '../../common/custom_appbar.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DonatePageBloc>().add(const DonatePageFetchOrganization());

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocListener<DonatePageBloc, DonatePageState>(
        listener: (context, state) {},
        child: BlocBuilder<DonatePageBloc, DonatePageState>(
          builder: (context, state) {
            return switch (state) {
              DonatePageInitialState() => const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 16,
                    right: 16,
                  ),
                  child: LeftArrowBackButton(),
                ),
              DonatePageSuccessState() => ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LeftArrowBackButton(),
                          const SizedBox(
                            height: 10,
                          ),
                          ContactInfo(organization: state.organization),
                          const SizedBox(
                            height: 20,
                          ),
                          const PaymentInfo(),
                        ],
                      ),
                    )
                  ],
                ),
              DonatePageFailureState() => const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 16,
                    right: 16,
                  ),
                  child: LeftArrowBackButton(),
                ),
            };
          },
        ),
      ),
      backgroundColor: AppColors.bodyBackgroundColor,
    );
  }
}
