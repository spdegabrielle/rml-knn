PACKAGENAME=rml-knn
COLLECTS=rml-knn
TESTS=$(COLLECTS)/test
SCRBL=rml-knn/scribblings/rml-knn.scrbl

all: setup

clean:
	find . -name compiled -type d | xargs rm -rf
	rm -rf htmldocs

setup:
	raco setup --tidy $(COLLECTS)

link:
	raco pkg install --link -n $(PACKAGENAME) $$(pwd)

unlink:
	raco pkg remove $(PACKAGENAME)

test:
	raco test $(TESTS)

htmldocs: $(SCRBL)
	raco scribble \
		--html \
		--dest rml-knn/doc \
		--dest-name index \
		++main-xref-in \
		--redirect-main http://docs.racket-lang.org/ \
		\
		$(SCRBL)

viewdocs:
	raco docs
