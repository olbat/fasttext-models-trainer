FASTTEXT_REPOSITORY=https://github.com/facebookresearch/fastText
FASTTEXT_REVISION=3c4a3ea5f59480377ad82ad39e7b8b4c10d29280

MODELS=$(shell grep -v '^\#' conf/models.csv | cut -d, -f1)

resources/datasets/%.txt:
	$(eval name=$(basename $(notdir $@)))
	$(eval url=$(shell grep "^$(name)" conf/models.csv | cut -d, -f2))
	$(eval dump=resources/dumps/$(name).txt)
	mkdir -p resources/dumps/
	mkdir -p resources/datasets/
	([ -e $(dump) ] && cat $(dump) || (bin/fetch "$(url)" | tee $(dump))) | bin/preprocess  > $@

resources/dumps/%.txt:
	$(eval name=$(basename $(notdir $@)))
	$(eval url=$(shell grep "^$(name)" conf/models.csv | cut -d, -f2))
	mkdir -p resources/dumps/
	bin/fetch "$(url)" > $@
