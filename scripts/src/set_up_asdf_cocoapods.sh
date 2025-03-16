#!/bin/bash

# This script is for resolving dependency errors in projects using Ruby and CocoaPods installed via asdf.
# 
# Ref:
#   https://github.com/ronnnnn/asdf-cocoapods?tab=readme-ov-file#resolution
#

cd "$(dirname "$0")"

GLOBAL_ASDF_DIR="$HOME/.asdf"
GLOBAL_TOOL_VERSIONS_FILE="$HOME/.tool-versions"
PROJECT_TOOL_VERSIONS_FILE="../../.tool-versions"

# Get Ruby version from the .tool-versions file
function get_ruby_version_from_tool_versions_file() {
  local tool_versions_file="$1"
  local ruby_version=$(grep '^ruby ' "$tool_versions_file" | sed -e 's/^ruby //')
  echo "$ruby_version"
}

# Get CocoaPods version from the .tool-versions file
function get_cocoapods_version_from_tool_versions_file() {
  local tool_versions_file="$1"
  local cocoapods_version=$(grep '^cocoapods ' "$tool_versions_file" | sed -e 's/^cocoapods //')
  echo "$cocoapods_version"
}

# --- Main ---

echo "* Checking tool versions in the project..."
echo ""

project_ruby_version=$(get_ruby_version_from_tool_versions_file "$PROJECT_TOOL_VERSIONS_FILE")
if [ -z "$project_ruby_version" ]; then
  echo "Error: Ruby version is not specified in the project .tool-versions file."
  echo ""
  exit 1
fi

project_cocoapods_version=$(get_cocoapods_version_from_tool_versions_file "$PROJECT_TOOL_VERSIONS_FILE")
if [ -z "$project_cocoapods_version" ]; then
  echo "Error: CocoaPods version is not specified in the project .tool-versions file."
  echo ""
  exit 1
fi

echo "* Checking tool installations..."
echo ""

ruby_dir="$GLOBAL_ASDF_DIR/installs/ruby/$project_ruby_version"
if [ ! -d "$ruby_dir" ]; then
  echo "Error: Ruby $project_ruby_version is not installed."
  echo ""
  echo "Please run the following command to install Ruby:"
  echo "  asdf install ruby $project_ruby_version"
  echo ""
  exit 1
fi

cocoapods_dir="$GLOBAL_ASDF_DIR/installs/cocoapods/$project_cocoapods_version"
if [ ! -d "$cocoapods_dir" ]; then
  echo "Error: CocoaPods $project_cocoapods_version is not installed."
  echo ""
  echo "Please run the following command to install CocoaPods:"
  echo "  asdf install cocoapods $project_cocoapods_version"
  echo ""
  exit 1
fi

echo "* Checking tool versions in the global..."
echo ""

global_ruby_version=$(get_ruby_version_from_tool_versions_file "$GLOBAL_TOOL_VERSIONS_FILE")
if [ "$project_ruby_version" != "$global_ruby_version" ]; then
  echo "Error: Ruby version in the global .tool-versions file is different from the project .tool-versions file."
  echo "  Project Ruby version: $project_ruby_version"
  echo "  Global Ruby version: $global_ruby_version"
  echo ""
  echo "Please run the following command to set the global Ruby version:"
  echo "  asdf set --home ruby $project_ruby_version"
  echo ""
  exit 1
fi

echo "* Redownload and reinstall the dependencies..."
echo ""

cd ~/.asdf/installs/cocoapods/$project_cocoapods_version
bundle install --redownload

echo ""
echo "* Done."