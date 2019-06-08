FLB_VERSION := 1.1.2

.PHONY: all clean amazonlinux2

all: amazonlinux2
amazonlinux2: amazonlinux2.build


%.build: Dockerfile.%
	test -d $@.bak && rm -rf $@.bak || true
	test -d $@ && mv $@ $@.bak || true
	mkdir $@
	docker build \
		--build-arg FLB_VERSION=$(FLB_VERSION) \
		--build-arg FLB_PREFIX=v \
		-t flb-$@-$(FLB_VERSION) \
		-f $< $@
	docker run \
		--rm \
		-v $(PWD)/$@:/output \
		flb-$@-$(FLB_VERSION)

bintray:
	./scripts/build_bintray_json.bash \
		fluent-bit

clean:
	rm -rf *.build.bak *.build bintray
