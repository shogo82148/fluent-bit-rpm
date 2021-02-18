FLB_VERSION := 1.6.10

.PHONY: all clean amazonlinux2 centos7 centos8 upload

all: amazonlinux2 centos7 centos8
amazonlinux2:
	scripts/build.bash $(FLB_VERSION) amazonlinux2

centos7:
	scripts/build.bash $(FLB_VERSION) centos7

centos8:
	scripts/build.bash $(FLB_VERSION) centos8

upload:
	scripts/upload.pl

clean:
	rm -rf *.build.bak *.build
