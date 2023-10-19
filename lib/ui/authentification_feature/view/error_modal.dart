import 'package:flutter/material.dart';

class ErrorModal extends StatelessWidget {
  const ErrorModal({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Error', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(errorMessage),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
