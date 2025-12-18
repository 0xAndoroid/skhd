FRAMEWORKS     = -framework Cocoa -framework Carbon -framework CoreServices
BUILD_PATH     = ./bin
BUILD_FLAGS    = -std=c99 -Wall -g -O0
SKHD_SRC       = ./src/skhd.c
BINS           = $(BUILD_PATH)/skhd

.PHONY: all clean install sign

all: clean $(BINS)

install: BUILD_FLAGS=-std=c99 -Wall -O2
install: clean $(BINS) sign

sign: $(BINS)
	codesign --force --sign - $<

clean:
	rm -rf $(BUILD_PATH)

$(BUILD_PATH)/skhd: $(SKHD_SRC)
	mkdir -p $(BUILD_PATH)
	clang $^ $(BUILD_FLAGS) $(FRAMEWORKS) -o $@
