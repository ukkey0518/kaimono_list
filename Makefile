# Projects

## Generate new feature directory
new_feature:
	@dart scripts/src/new_feature.dart

# Generator

## Run build_runner build
genb:
	@flutter pub run build_runner build -d

## Run build_runner watch
genw:
	@flutter pub run build_runner watch -d
