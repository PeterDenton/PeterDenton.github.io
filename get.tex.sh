#!/bin/bash

get_tex_as_html()
{
	cwd=$(pwd)
	name=$(basename $1)
	cd $name

	cp $1/*.bst .
	cp $1/$name.tex .
	cp $1/*.bib .

	htlatex $name.tex
	for f in *.aux
	do
		bibtex $f
	done
	htlatex $name.tex
	htlatex $name.tex

	more ../main.css >> $name.css

	cp $1/$name.pdf .
	
	rm $name.4ct
	rm $name.4tc
	rm *.aux
	rm *.bbl
	rm *.bib
	rm *.blg
	rm *.bst
	rm $name.dvi
	rm $name.idv
	rm $name.lg
	rm $name.log
	rm $name.tex
	rm $name.tmp
	rm $name.xht
	rm $name.xref

	cd $cwd
}

get_tex_as_html /home/peter/Dropbox/Documents/Essays/CV
get_tex_as_html /home/peter/Dropbox/Documents/Essays/Publication_List
