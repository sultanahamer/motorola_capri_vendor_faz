#!/vendor/bin/sh

notice()
{
	echo "$*"
	echo "$scriptname: $*" > /dev/kmsg
}

path=/vendor/etc/acdbdata
device=common

# For capri power, use seprate parameter files.
if [ "`getprop ro.vendor.hw.batt`" == "6000" ]; then
	device=power
fi

index=0
for file in $(ls $path/$device/); do
    setprop persist.vendor.audio.calfile$index $path/$device/$file
    index=$((index+1))
done
notice "hw.batt: [`getprop ro.vendor.hw.batt`], calfile6: [`getprop persist.vendor.audio.calfile6`]"
