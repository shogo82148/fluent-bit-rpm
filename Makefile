FLB_VERSION := 1.7.8
FLB_RELEASE := 1

.PHONY: all clean amazonlinux2 centos7 centos8 upload almalinux8 rockylinux8

all: amazonlinux2 centos7 centos8 almalinux8 rockylinux8
amazonlinux2:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) amazonlinux2

centos7:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) centos7

centos8:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) centos8

almalinux8:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) almalinux8

rockylinux8:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) rockylinux8

upload:
	scripts/upload.pl

clean:
	rm -rf *.build.bak *.build
