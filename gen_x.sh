#!/bin/sh

source common.sh

echo "\nResHelper: Generating data...\n";
name="shaper_calibrate_x";
[ ! -d $HOME"/printer_data/config/${OUTPUT_DIR}/" ] && mkdir ~/printer_data/config/"${OUTPUT_DIR}";

#graph generation
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o ~/printer_data/config/"${OUTPUT_DIR}"/shaper_calibrate_x.png;

#damping ratio
dr="$(Rscript ~/ResHelper/X.R)";
dr=${dr#"[1] "};
echo "Damping ratio for X calculated:\ndamping_ratio_x: $dr\n ";
name="$name-dr_$dr-v$(date "+%Y%m%d_%H%M").png";

#cleanup
mv ~/printer_data/config/"${OUTPUT_DIR}"/shaper_calibrate_x.png ~/printer_data/config/"${OUTPUT_DIR}"/$name;
find '/tmp/' -name "resonances_x_*.csv" -print 2>/dev/null -exec rm {} \;

