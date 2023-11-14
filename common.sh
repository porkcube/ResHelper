#!/usr/bin/env bash

PD_DIR="${HOME}/printer_data/config"
OUTPUT_DIR="shaper_graphs"

check_printdata()
{
    if [[ ! -d "${PD_DIR}" ]]; then
        echo -e "printer_data folder not found. Exiting ..."
        exit -1
    else
        echo "printer_data folder detected successfully!"
    fi
}

confirm_outputdir()
{
    echo "Default output is ${PD_DIR}/${OUTPUT_DIR}, change? [Y/n]"
    read changedir
    case "${changedir}" in
        N|n) OUTPUT_DIR="shaper_graphs";;
        *)
            echo -e "Enter desired dir in ${PD_DIR}: "
            read OUTPUT_DIR
#            echo 's/OUTPUT_DIR=\"RES_DATA\"/OUTPUT_DIR="'"${OUTPUT_DIR}"'"/' "$(dirname $0)"/common.sh
            sed -i -e 's/OUTPUT_DIR=\"RES_DATA\"/OUTPUT_DIR="'"$OUTPUT_DIR"'"/' "$(dirname $0)"/common.sh
            ;;
    esac

    if [[ ! -d "${PD_DIR}/${OUTPUT_DIR}" ]]; then
        mkdir -p "${PD_DIR}/${OUTPUT_DIR}"
    fi
}

