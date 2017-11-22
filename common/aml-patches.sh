ui_print "    Patching existing audio_effects files..."
for FILE in ${CFGS}; do
  if [ ! "$(cat $AMLPATH$FILE | grep ' jamesdsp {')" ]; then
    sed -i 's/^effects {/effects {\n  jamesdsp {\n    library jdsp\n    uuid f27317f4-c984-4de6-9a90-545759495bf2\n  }/g' $AMLPATH$FILE
    sed -i 's/^libraries {/libraries {\n  jdsp {\n    path \/system\/lib\/soundfx\/libjamesdsp.so\n  }/g' $AMLPATH$FILE
  fi
done
