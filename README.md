# Docker image for building and flashing esp8266 modules
Image uses [esp8266 arduino](https://github.com/esp8266/Arduino.git) core.

Image assumes that the underlying project uses [makeEspArduino](https://github.com/plerup/makeEspArduino) makefile.

## Usage
Image expects a few arguments:
- Volume mapped to `/project`
- Serial device mapped to `/dev/ttyS0` if flashing is desired


The following command will build the source files and flash them to the device connected to `/dev/ttyS1`:
```
docker run -v \
	~/path-to-project:/project \
	--device=/dev/ttyS1:/dev/ttyS0 \
	esp8266build \
	make flash
```