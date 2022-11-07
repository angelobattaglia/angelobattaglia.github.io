# If you just type 'make' you'll get only the .pdf
# If you type 'make build' you'll get the website and the .pdf

MAIN = AngeloBattagliaMaths
TEX_RESOURCES = Makefile\
            	$(MAIN).tex\
            	# pub.bib
SHELL = /bin/bash
# FIGURES := $(shell find images/* -type f)

all: $(TEX_RESOURCES) # $(FIGURES)
	pdflatex $(MAIN).tex
	biber $(MAIN)
	pdflatex $(MAIN)
	pdflatex $(MAIN)

# Cleans the build files for the creation of the Curriculum in LaTeX
# clean-cv: 
# 	rm -f $(MAIN).{bbl,log,blg,bb,aux,out,toc,idx,bcf,run.xml,ind,ilg,fls,fdb_latexmk}

# Cleans all the metafiles needed for the build of the .pdf
clean: 
	rm -f $(MAIN).{bbl,log,blg,bb,aux,out,toc,idx,bcf,run.xml,ind,ilg,fls,fdb_latexmk}
	rm texput.log

# Cleans all the metafiles needed for the build of the .pdf, including the .pdf generated
clean-pdf: 
	rm -f $(MAIN).{pdf,bbl,log,blg,bb,aux,out,toc,idx,bcf,run.xml,ind,ilg,fls,fdb_latexmk}

# # Deploys on port 8000 using python
# deploy:
# echo "Open your browser and type http://localhost:8000/ on the search bar"
# python3 -m http.server --directory ./dst/

# Uses the build.sh script located in the / directory to build the website and the .pdf
# build:
# 	make clean-cv

.PHONY: clean all
