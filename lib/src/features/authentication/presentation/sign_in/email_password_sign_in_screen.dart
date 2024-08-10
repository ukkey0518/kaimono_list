import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/app_sizes.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_controller.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_type.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/global_key_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';
import 'package:kaimono_list/src/utils/hooks/use_form_key.dart';
import 'package:kaimono_list/src/utils/snackbar.dart';

class EmailPasswordSignInScreen extends HookConsumerWidget {
  const EmailPasswordSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final type = useState(EmailPasswordSignInType.signIn);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(
      emailPasswordSignInControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> submit() async {
      // Validate all fields in the form and scroll to the first invalid field.
      final isValid = await formKey.validateAndScrollToInvalidField();
      if (!isValid) {
        return;
      }

      // Perform sign in logic.
      final isSuccessful =
          await ref.read(emailPasswordSignInControllerProvider.notifier).submit(
                type.value,
                emailController.text,
                passwordController.text,
              );
      if (!isSuccessful) {
        return;
      }

      if (context.mounted) {
        await AppSnackbar.showSuccess(context, 'ログイン成功'.hardcoded);
      }
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Consumer(
            builder: (context, ref, _) {
              final isLoading =
                  ref.watch(emailPasswordSignInControllerProvider).isLoading;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    type.value == EmailPasswordSignInType.signIn
                        ? 'Sign In'.hardcoded
                        : 'Register'.hardcoded,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Gap(Sizes.p8),
                  _EmailFormField(
                    controller: emailController,
                    enabled: !isLoading,
                  ),
                  const Gap(Sizes.p8),
                  _PasswordFormField(
                    controller: passwordController,
                    enabled: !isLoading,
                  ),
                  const Gap(Sizes.p16),
                  ElevatedButton(
                    onPressed: isLoading ? null : submit,
                    child: Text(
                      type.value == EmailPasswordSignInType.signIn
                          ? 'Sign In'.hardcoded
                          : 'Register'.hardcoded,
                    ),
                  ),
                  const Gap(Sizes.p8),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            type.value =
                                type.value == EmailPasswordSignInType.signIn
                                    ? EmailPasswordSignInType.register
                                    : EmailPasswordSignInType.signIn;
                          },
                    child: Text(
                      type.value == EmailPasswordSignInType.signIn
                          ? 'Create an account'.hardcoded
                          : 'Sign in instead'.hardcoded,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _EmailFormField extends StatelessWidget {
  const _EmailFormField({
    required this.controller,
    required this.enabled,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      enabled: enabled,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: 'わすれとるで'.hardcoded,
        ),
        FormBuilderValidators.email(
          errorText: 'アドレス間違えてない？'.hardcoded,
        ),
      ]),
      decoration: InputDecoration(
        labelText: 'Email'.hardcoded,
        hintText: 'sample@sample.com'.hardcoded,
      ),
    );
  }
}

class _PasswordFormField extends HookWidget {
  const _PasswordFormField({
    required this.controller,
    required this.enabled,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(true);

    return TextFormField(
      controller: controller,
      obscureText: isObscure.value,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      enabled: enabled,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: 'わすれとるで'.hardcoded,
        ),
        FormBuilderValidators.minLength(
          8,
          errorText: 'ちょっと短すぎるね〜'.hardcoded,
        ),
      ]),
      decoration: InputDecoration(
        labelText: 'Password'.hardcoded,
        suffixIcon: IconButton(
          icon: Icon(isObscure.value ? Icons.visibility : Icons.visibility_off),
          onPressed: () => isObscure.value = !isObscure.value,
        ),
      ),
    );
  }
}
