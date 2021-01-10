FLB_VERSION := 1.6.10

.PHONY: all clean amazonlinux2 upload

all: amazonlinux2
amazonlinux2:
	scripts/build.bash $(FLB_VERSION) amazonlinux2

upload:
	scripts/upload.sh $(FLB_VERSION) amazonlinux2

clean:
	rm -rf *.build.bak *.build bintray
