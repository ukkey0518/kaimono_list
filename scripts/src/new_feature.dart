import 'dart:io';

import 'package:recase/recase.dart';

const _featuresDirectoryPath = 'lib/features';

void main() {
  print('--- New Feature ---');

  late List<String> directories;

  while (true) {
    print('');
    print('* Enter the feature name:');
    final inputFutureName = stdin.readLineSync();

    if (inputFutureName == null || inputFutureName.isEmpty) {
      print('> Error: Feature name is required.');
      continue;
    }

    late String futureName;
    try {
      futureName = inputFutureName.snakeCase;
    } on Object catch (_) {
      print('> Error: Invalid feature name.');
      continue;
    }

    final featureDirectoryPath = '$_featuresDirectoryPath/$futureName';

    if (Directory(featureDirectoryPath).existsSync()) {
      print('> Error: Feature already exists.: $featureDirectoryPath');
      continue;
    }

    final dataDirectoryPath = '$featureDirectoryPath/data';
    final domainDirectoryPath = '$featureDirectoryPath/domain';
    final applicationDirectoryPath = '$featureDirectoryPath/application';
    final presentationDirectoryPath = '$featureDirectoryPath/presentation';

    directories = [
      featureDirectoryPath,
      dataDirectoryPath,
      domainDirectoryPath,
      applicationDirectoryPath,
      presentationDirectoryPath,
    ];

    print('');
    print('* Do you want to create these files? (y/n)');
    print('  - $featureDirectoryPath');
    print('  - $dataDirectoryPath');
    print('  - $domainDirectoryPath');
    print('  - $applicationDirectoryPath');
    print('  - $presentationDirectoryPath');
    final confirm = stdin.readLineSync();
    switch (confirm) {
      case 'y':
      case 'Y':
        break;
      case 'n':
      case 'N':
        print('> Feature creation canceled.');
        return;
      default:
        print('> Error: Invalid input.');
        continue;
    }

    break;
  }

  for (final directory in directories) {
    Directory(directory).createSync(recursive: true);
    print('> Directory created: $directory');
  }

  print('');
  print('* Feature created successfully.');
  print('-------------------');
}
