import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/app_sizes.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Ukkey): Implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Item List Screen'),
            const Gap(Sizes.p8),
            Consumer(
              builder: (context, ref, child) {
                final authRepository = ref.read(authRepositoryProvider);
                return IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: authRepository.signOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
