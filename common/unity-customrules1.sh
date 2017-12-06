TIMEOFEXEC=3
if [ "$ABI" == "arm" ]; then
  $CP_PRFX $INSTALLER/custom/lib/arm/libjamesdsp.so $UNITY$SYS/lib/soundfx/libjamesdsp.so
  $CP_PRFX $INSTALLER/custom/lib/arm/libjamesDSPImpulseToolbox.so $UNITY$SYS/lib/libjamesDSPImpulseToolbox.so
else
  $CP_PRFX $INSTALLER/custom/lib/x86/libjamesdsp.so $UNITY$SYS/lib/soundfx/libjamesdsp.so
  $CP_PRFX $INSTALLER/custom/lib/x86/libjamesDSPImpulseToolbox.so $UNITY$SYS/lib/libjamesDSPImpulseToolbox.so
fi
# App only works when installed normally to data in oreo
if [ $API -ge 26 ]; then
  if $BOOTMODE; then SDCARD=/storage/emulated/0; else SDCARD=/data/media/0; fi
  ui_print " "
  ui_print "   Copying apk to root of internal storage (sdcard)"
  ui_print "   Install apk after booting"
  sleep 2
  cp -f $INSTALLER/custom/JamesDSPManager/JamesDSPManager.apk $SDCARD/JamesDSPManager.apk
else
  custom_app_install JamesDSPManager
fi
