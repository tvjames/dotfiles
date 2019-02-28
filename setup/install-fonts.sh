#!/usr/bin/env bash

set -euxo pipefail

prefix=
source_fonts_dir="$( cd "$( dirname "$0" )" && pwd )/../assets/fonts"
extract_fonts_dir="${source_fonts_dir}/extracted"

if test "$(uname)" = "Darwin" ; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.local/share/fonts"
  mkdir -p ${font_dir}
fi

echo "Extracting fonts from ${source_fonts_dir}"
echo "into ${extract_fonts_dir}..."

mkdir -p ${extract_fonts_dir}
unzip -o "${source_fonts_dir}/*.zip" -d "${extract_fonts_dir}"

echo "Copying fonts to ${font_dir}..."
find "$extract_fonts_dir" \( -name "$prefix*.[ot]tf" -or -name "$prefix*.pcf.gz" \) -type f -print0 | xargs -0 -n1 -I % cp "%" "$font_dir/"
rm -rf ${extract_fonts_dir}

git clone https://github.com/aftertheflood/sparks.git "${source_fonts_dir}/fonts-sparks" --depth=1
cd ${source_fonts_dir}/fonts-sparks/output/ttf
cp * ~/Library/Fonts
cd -
rm -rf ${source_fonts_dir}/fonts-sparks

git clone --single-branch --branch patching-strategy https://github.com/gabrielelana/awesome-terminal-fonts.git "${source_fonts_dir}/fonts-awesome-terminal-fonts" --depth=1
cd ${source_fonts_dir}/fonts-awesome-terminal-fonts/patched
cp * ~/Library/Fonts
cd -
rm -rf ${source_fonts_dir}/fonts-awesome-terminal-fonts

git clone https://github.com/powerline/fonts.git "${source_fonts_dir}/fonts-powerline" --depth=1
cd ${source_fonts_dir}/fonts-powerline
./install.sh
cd -
rm -rf ${source_fonts_dir}/fonts-powerline

echo "Done."
