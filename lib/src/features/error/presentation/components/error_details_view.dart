import 'package:flutter/material.dart';
import 'package:kaimono_list/src/common_widgets/big_icon_with_label.dart';

class ErrorDetailsView extends StatelessWidget {
  const ErrorDetailsView({
    required this.error,
    super.key,
  });

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BigIconWithLabel(
        icon: Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
        ),
        label: Text(
          error.toString(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}
