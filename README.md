# fastText models trainer

## About
This repository contains few scripts to automate fastText word embedding models training using Wikipedia dumps as corpus and the instructions from the [official documentation](https://fasttext.cc/docs/en/unsupervised-tutorial.html).

One thing that differs from this instructions is that we don't use the _wikifil.pl_ script to extract and pre-process the text from Wikipedia dumps since it's English-targeted and it strips non-ASCII characters.

Instead we use [gensim](https://radimrehurek.com/gensim/)'s [segment_wiki](https://radimrehurek.com/gensim/scripts/segment_wiki.html) tool with a custom pre-processing [script](scripts/preprocess-text) (see [bin/preprocess](bin/preprocess)).


## Usage
Vefify the configuration and training parameters:
```
$ editor conf/train.env
```

Setup/Verify the corpora used to train the models:
```
$ edit conf/models.csv
```

Fetch dependencies and run the training process:
```
$ make train
```

Use models:
```
$ find resources/ -type f
resources/dumps/wikipedia-en.txt
resources/datasets/wikipedia-en.txt
resources/models/wikipedia-en.bin
resources/models/wikipedia-en.vec
```
