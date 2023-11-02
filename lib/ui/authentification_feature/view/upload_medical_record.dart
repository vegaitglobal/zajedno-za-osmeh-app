import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

import '../components/auth_card.dart';

class UploadMedicalrecordCard extends StatefulWidget {
  const UploadMedicalrecordCard({super.key, required this.onSubmit});

  final Function(String) onSubmit;

  @override
  State<UploadMedicalrecordCard> createState() =>
      _UploadMedicalrecordCardState();
}

class _UploadMedicalrecordCardState extends State<UploadMedicalrecordCard> {
  Key formKey = GlobalKey();
  bool submitEnabled = false;

  String? filePath = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Registracija',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.royalBlue,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/icons/info.png'),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                  child: Text(
                'U sledećem koraku će biti potrebno priložiti izveštaj lekara',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ))
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Form(
          key: formKey,
          child: AuthCard(children: [
            Text(
              'Priložite izveštaj lekara',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: AppColors.textColor),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () async {
                final result = await FilePicker.platform.pickFiles();
                filePath = result?.files.single.path;
                if (filePath != null) {
                  setState(() {
                    submitEnabled = true;
                  });
                }
              },
              child: DottedBorder(
                dashPattern: const [5, 4],
                color: AppColors.buttonDisabled,
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/icons/upload_file.png'),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Klikni da odabereš fajl iz galerije',
                        style:
                            TextStyle(fontSize: 12, color: AppColors.textColor),
                      ),
                      Text(
                        'Potrebno je priložiti fotografiju dokumenta ....',
                        style:
                            TextStyle(fontSize: 10, color: AppColors.grayBlue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: submitEnabled
                    ? () {
                        (filePath != null) ? widget.onSubmit(filePath!) : null;
                      }
                    : null,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: submitEnabled
                        ? AppColors.buttonEnabled
                        : AppColors.buttonDisabled,
                  ),
                  child: const Text(
                    'Pošalji zahtev',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )),
          ]),
        ),
      ],
    );
  }
}
