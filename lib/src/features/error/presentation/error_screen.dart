import 'package:flutter/material.dart';
import 'package:kaimono_list/src/features/error/presentation/components/error_details_view.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    required this.error,
    super.key,
  });

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: ErrorDetailsView(
          error: error,
        ),
      ),
    );
  }
}
