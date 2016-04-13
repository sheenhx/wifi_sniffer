################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
gpio_if.obj: D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common/gpio_if.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="gpio_if.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.obj: ../main.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="main.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

pinmux.obj: ../pinmux.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="pinmux.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

sniff.obj: ../sniff.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="sniff.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

uart_if.obj: D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common/uart_if.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/bin/armcl" -mv7M4 --abi=eabi -me --include_path="D:/TI/ccsv6/tools/compiler/ti-cgt-arm_5.2.7/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/include" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/simplelink/source" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/example/common" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/oslib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/driverlib" --include_path="D:/TI/CC3200SDK_1.1.0/cc3200-sdk/inc" -g --define=ccs --define=USE_TIRTOS --define=SL_PLATFORM_MULTI_THREADED --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="uart_if.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


