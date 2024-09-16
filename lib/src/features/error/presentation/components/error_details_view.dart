import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/common_widgets/big_icon_with_label.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/utils/app_logger.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ErrorDetailsView extends StatelessWidget {
  const ErrorDetailsView({
    required this.error,
    this.stackTrace,
    super.key,
  });

  final dynamic error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    AppLogger().captureException(error, stackTrace);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BigIconWithLabel(
          icon: Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
          ),
          label: Text(
            'エラーが発生しました'.hardcoded,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Gap(Sizes.p24),
        Text(
          error.toString(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
