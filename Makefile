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

corrlocal.tgz: difx
	docker run --rm -d --name corr_tmp jbo/difx tail -f /dev/null
	docker exec -t corr_tmp tar cvf /tmp/corrlocal.tgz /usr/local
	docker cp corr_tmp:/tmp/corrlocal.tgz .
	docker stop corr_tmp


