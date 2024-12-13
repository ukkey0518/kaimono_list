#
# --- Projects --- #
#

## Run the app
install:
	flutter pub get
	bundle install
	cd ios; pod install

clean_update:
	rm -rf pubspec.lock Gemfile.lock vendor/bundle ios/Podfile.lock ios/Pods
	@make install

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