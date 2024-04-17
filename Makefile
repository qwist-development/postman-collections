SOURCES = $(wildcard src/*.yaml)
TARGETS = $(patsubst src/%.yaml, target/%.json, $(SOURCES))

all: $(TARGETS)

$(TARGETS): target/%.json: src/%.yaml
	yq -p yaml -o json $< > $@

.PHONY:
clean:
	rm -f target/*
