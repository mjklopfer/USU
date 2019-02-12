set_global_assignment -entity "ADC_Controller" -library "lib_ADC_Controller" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "ADC_Controller" -library "lib_ADC_Controller" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "ADC_Controller" -library "lib_ADC_Controller" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_ADC_Controller" -name SPD_FILE [file join $::quartus(sip_path) "../ADC_Controller.spd"]
set_global_assignment -library "lib_ADC_Controller" -name MISC_FILE [file join $::quartus(sip_path) "../../ADC_Controller.qsys"]

set_global_assignment -library "lib_ADC_Controller" -name MISC_FILE [file join $::quartus(sip_path) "ADC_Controller.vhd"]
