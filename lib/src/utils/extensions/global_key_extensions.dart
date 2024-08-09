import 'package:flutter/material.dart';

extension FormKeyEx on GlobalKey<FormState> {
  /// Validate all fields in the form and scroll to the first invalid field.
  Future<bool> validateAndScrollToInvalidField() async {
    final invalidFields = currentState!.validateGranularly();
    if (invalidFields.firstOrNull case final firstInvalidateField?) {
      await Scrollable.ensureVisible(
        firstInvalidateField.context,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
      );
      return false;
    }
    return true;
  }
}
