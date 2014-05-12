
EMSCRIPTEN=$(HOME)/Downloads/emsdk_portable/emscripten/1.16.0


# s2js:
# 	echo "building s2js"
# 	$(EMSCRIPTEN)/emcc wrapper.c -I./s2-geometry-library/geometry -L./s2-geometry-library/geometry -ls2lib


s2map: zlib openssl
	cd s2-geometry-library/geometry; \
	$(EMSCRIPTEN)/emmake make; \


# Serious Emscripten hack that might not actually work
openssl: openssl-1.0.1g
	cd openssl-1.0.1g; \
	./config --prefix=$(EMSCRIPTEN)/system
	make
	make install
	touch openssl


openssl-1.0.1g: openssl-1.0.1g.tar.gz
	tar xvzf openssl-1.0.1g.tar.gz


openssl-1.0.1g.tar.gz:
	curl "https://www.openssl.org/source/openssl-1.0.1g.tar.gz" -o openssl-1.0.1g.tar.gz


zlib: zlib-1.2.8
	cd zlib-1.2.8; \
	$(EMSCRIPTEN)/emconfigure ./configure --prefix=$(EMSCRIPTEN)/system; \
	$(EMSCRIPTEN)/emmake make; \
	$(EMSCRIPTEN)/emmake make install;
	touch zlib


zlib-1.2.8: zlib-1.2.8.tar.gz
	tar xvzf zlib-1.2.8.tar.gz


zlib-1.2.8.tar.gz:
	curl "http://zlib.net/zlib-1.2.8.tar.gz" -o zlib-1.2.8.tar.gz


clean:
	echo "clean"


tests:
	echo "tests"