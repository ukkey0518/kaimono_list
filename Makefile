#
# --- Projects --- #
#

## Generate new feature directory
new_feature:
	@dart scripts/src/new_feature.dart

#
# --- Generator --- #
#

## Run build_runner build
genb:
	@flutter pub run build_runner build -d

## Run build_runner watch
genw:
	@flutter pub run build_runner watch -d

#
# --- Bump version --- #
#

bump_build:
	@flutter pub run cider bump build --bump-build

bump_patch:
	@flutter pub run cider bump patch --bump-build

bump_minor:
	@flutter pub run cider bump minor --bump-build

bump_major:
	@flutter pub run cider bump major --bump-build