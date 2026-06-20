import 'package:flutter/material.dart';
import 'package:swim_success/core/constants/app_constants.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget({
    required this.message,
    required this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text(AppStringsConstants.tryAgain),
          ),
        ],
      ),
    );
  }
}
