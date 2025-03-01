
TARGETS_F051 := \
	FD6288 MP6531 IFLIGHT TMOTOR55 TMOTOR45 HGLRC SISKIN \
	DIATONE MAMBA_F40PRO MAMBA_F50PRO MAMBA_F60PRO \
	WRAITH32 CRTEENSY_HILARIESC

HAL_FOLDER_F051 := $(HAL_FOLDER)/f051

MCU_F051 := -mcpu=cortex-m0 -mthumb
LDSCRIPT_F051 := $(HAL_FOLDER_F051)/STM32F051K6TX_FLASH.ld

SRC_DIR_F051 += \
	$(HAL_FOLDER_F051)/Startup \
	$(HAL_FOLDER_F051)/Src \
	$(HAL_FOLDER_F051)/Drivers/STM32F0xx_HAL_Driver/Src

CFLAGS_F051 := \
	-I$(HAL_FOLDER_F051)/Inc \
	-I$(HAL_FOLDER_F051)/Drivers/STM32F0xx_HAL_Driver/Inc \
	-I$(HAL_FOLDER_F051)/Drivers/CMSIS/Include \
	-I$(HAL_FOLDER_F051)/Drivers/CMSIS/Device/ST/STM32F0xx/Include

CFLAGS_F051 += \
	-DHSE_VALUE=8000000 \
	-DSTM32F051x8 \
	-DHSE_STARTUP_TIMEOUT=100 \
	-DLSE_STARTUP_TIMEOUT=5000 \
	-DLSE_VALUE=32768 \
	-DDATA_CACHE_ENABLE=0 \
	-DINSTRUCTION_CACHE_ENABLE=0 \
	-DVDD_VALUE=3300 \
	-DLSI_VALUE=40000 \
	-DHSI_VALUE=8000000 \
	-DUSE_FULL_LL_DRIVER \
	-DPREFETCH_ENABLE=1

SRC_F051 := $(foreach dir,$(SRC_DIR_F051),$(wildcard $(dir)/*.[cs]))
