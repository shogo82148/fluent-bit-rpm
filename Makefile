FLB_VERSION := 1.9.5
FLB_RELEASE := 1

.PHONY: all
all: amazonlinux2 centos7 almalinux8 almalinux9 rockylinux8
.PHONY: amazonlinux2
amazonlinux2:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) amazonlinux2

.PHONY: centos7
centos7:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) centos7

.PHONY: almalinux8
almalinux8:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) almalinux8

.PHONY: almalinux9
almalinux9:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) almalinux9

.PHONY: rockylinux8
rockylinux8:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) rockylinux8

.PHONY: test
test: test-amazonlinux2 test-centos7 test-almalinux8 test-almalinux9 test-rockylinux8

.PHONY: test-amazonlinux2
test-amazonlinux2:
	scripts/test.bash amazonlinux2

.PHONY: test-centos7
test-centos7:
	scripts/test.bash centos7

.PHONY: test-almalinux8
test-almalinux8:
	scripts/test.bash almalinux8

.PHONY: test-almalinux9
test-almalinux9:
	scripts/test.bash almalinux9

.PHONY: test-rockylinux8
test-rockylinux8:
	scripts/test.bash rockylinux8

.PHONY: upload
upload:
	scripts/upload.pl

.PHONY: clean
clean:
	rm -rf *.build.bak *.build
