#!/bin/sh

libname='nodeunit'
rm -f "${libname}.zip"
zip -r "${libname}.zip" haxelib.json nodeunit LICENSE README.md
echo "Saved as ${libname}.zip"