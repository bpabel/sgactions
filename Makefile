SGACTIONS_DEPLOY := $(shell python -c 'import sgactions.deploy as x; print x.__file__')

.PHONY : default sgactions clean

default : sgactions

SGACTIONS_SENTINEL := .sgactions.make-sentinel
sgactions : $(SGACTIONS_SENTINEL)
$(SGACTIONS_SENTINEL) : examples.yml $(SGACTIONS_DEPLOY)
	python -m sgactions.deploy examples.yml
	@ touch $(SGACTIONS_SENTINEL)

clean:
	- rm $(SGACTIONS_SENTINEL)