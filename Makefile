FLB_VERSION := 2.1.7
FLB_RELEASE := 1

.PHONY: all
all: amazonlinux2 amazonlinux2022 amazonlinux2023 centos7 almalinux8 almalinux9 rockylinux8 rockylinux9
.PHONY: amazonlinux2
amazonlinux2:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) amazonlinux2

.PHONY: amazonlinux2022
amazonlinux2022:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) amazonlinux2022

.PHONY: amazonlinux2023
amazonlinux2023:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) amazonlinux2023

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

.PHONY: rockylinux9
rockylinux9:
	scripts/build.bash $(FLB_VERSION) $(FLB_RELEASE) rockylinux9

.PHONY: test
test: test-amazonlinux2 test-amazonlinux2022 test-centos7 test-almalinux8 test-almalinux9 test-rockylinux8 test-rockylinux9

.PHONY: test-amazonlinux2
test-amazonlinux2:
	scripts/test.bash amazonlinux2

.PHONY: test-amazonlinux2022
test-amazonlinux2022:
	scripts/test.bash amazonlinux2022

.PHONY: test-amazonlinux2023
test-amazonlinux2023:
	scripts/test.bash amazonlinux2023

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

.PHONY: test-rockylinux9
test-rockylinux9:
	scripts/test.bash rockylinux9

.PHONY: upload
upload:
	scripts/upload.pl

.PHONY: clean
clean:
	rm -rf *.build.bak *.build
