REGISTRY?=jbo
DOCKERFILES=$(shell find * -type f -name Dockerfile)
IMAGES=$(subst /,-,$(subst /Dockerfile,,$(DOCKERFILES)))
$(info $$IMAGES is [${IMAGES}])
DEPENDS=.depends.mk
.PHONY: all clean $(IMAGES)
all: $(IMAGES)

clean:
	rm -f $(DEPENDS)
$(DEPENDS): $(DOCKERFILES) Makefile
	grep '^FROM $(REGISTRY)/' $(DOCKERFILES) | \
	awk -F '/Dockerfile:FROM $(REGISTRY)/' '{ print $$1 " " $$2 }' | \
	sed 's@[:/]@\\:@g' | awk '{ print $$1 ": " $$2 }' > $@
sinclude $(DEPENDS)
$(IMAGES): %:
	docker build -t $(REGISTRY)/$@ $(subst -,/,$@)