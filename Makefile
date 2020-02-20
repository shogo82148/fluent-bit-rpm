FLB_VERSION := 1.3.8

.PHONY: all clean amazonlinux2

all: amazonlinux2
amazonlinux2:
	scripts/build.bash $(FLB_VERSION) amazonlinux2

bintray:
	./scripts/build_bintray_json.bash \
		fluent-bit

clean:
	rm -rf *.build.bak *.build bintray
