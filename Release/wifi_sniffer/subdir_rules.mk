################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
wifi_sniffer/main.obj: ../wifi_sniffer/main.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="wifi_sniffer/main.pp" --obj_directory="wifi_sniffer" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

wifi_sniffer/pinmux.obj: ../wifi_sniffer/pinmux.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="wifi_sniffer/pinmux.pp" --obj_directory="wifi_sniffer" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

wifi_sniffer/sniff.obj: ../wifi_sniffer/sniff.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="wifi_sniffer/sniff.pp" --obj_directory="wifi_sniffer" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


