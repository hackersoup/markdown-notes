# The pandoc command to generate standard outputs.
# Note that this relies upon pdflatex being installed, which can be obtained
# on MacOS via the MacTex program (yes, I know its a 4GB application)
# -s				Create a standalone file output, not a file fragment
# -H pandoc-setup.tex		Configuration file to configure the output file styling
# --listings			Use the listings package for code blocks
# -V geometry:margin=0.5in	Pandoc creates some huge margins by default, this
#				  pecifies a much more reasonable margin size
# --toc				Create a Table of Contents
PANDOC=pandoc -s -H pandoc-setup.tex --listings -V geometry:margin=0.5in --toc

# Output directory for the generated PDFs. Set to whatever you want
OUTDIR=generated-pdfs

# Specifies which targets to build when you run `make all`
# Make sure you keep this up to date with edits!!!!
all: single-file-note multi-file-note


# For building multi-file notes with `make multi`
# Not sure why I need a PHONY target but I'm no makefile wizard, and this
# solves my problem of getting `make: 'daily-notes' is up to date.`
# So, here it lives on
.PHONY : multi
daily: multi-file-note


# Example of building a PDF from a single report file.
# Copy, paste, and edit this to add targets as needed.
# The $@ variable specifies the left side of the :, the $^ specifies the right
# side. Useful to create easier-to-copy rules.
single-file-note: single-file-note-example.md
	$(PANDOC) --toc-depth=1 -o $(OUTDIR)/$@.pdf $^


# Example of building a PDF from multiple note files, eg daily notes with one
# file for each day, or one file for each finding, or some other reason that
# notes would be split among multiple files. Note, they will be included in the
# PDF alphabetically by file name, so it would behoove one to name them in a
# definable order, eg page-01.md, page-02.md, page-03.md, or something similar.
# The $@ and $^ are Markdown substitutions that make building these
# commands a bit more easy to copy.
# $@	Substitute in the left-hand side of the colon (:) in the rule above
# $^	Substitute in all files defined on the right hand side of the colon (:)
multi-file-note: multi-file-note/*.md
	$(PANDOC) -o $(OUTDIR)/$@.pdf $^


# Cleanup rule to get rid of the generated PDFs if so desired.
.PHONY : clean
clean: $(OUTDIR)/*.pdf
	rm $^
