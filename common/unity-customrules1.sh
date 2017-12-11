TIMEOFEXEC=3
if [ "$ABI" == "arm" ]; then
  $CP_PRFX $INSTALLER/custom/lib/arm/libjamesdsp.so $UNITY$LIBDIR/lib/soundfx/libjamesdsp.so
  $CP_PRFX $INSTALLER/custom/lib/arm/libjamesDSPImpulseToolbox.so $UNITY$LIBDIR/lib/libjamesDSPImpulseToolbox.so
else
  $CP_PRFX $INSTALLER/custom/lib/x86/libjamesdsp.so $UNITY$LIBDIR/lib/soundfx/libjamesdsp.so
  $CP_PRFX $INSTALLER/custom/lib/x86/libjamesDSPImpulseToolbox.so $UNITY$LIBDIR/lib/libjamesDSPImpulseToolbox.so
fi
# App only works when installed normally to data in oreo
if $OREONEW; then
  mkdir -p $SDCARD/.jdsptempdonotdelete
  cp -f $INSTALLER/custom/JamesDSPManager/JamesDSPManager.apk $SDCARD/.jdsptempdonotdelete/JamesDSPManager.apk
else
  custom_app_install JamesDSPManager
fi
