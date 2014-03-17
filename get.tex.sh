#!/bin/bash

get_tex_as_html()
{
	cwd=$(pwd)
	name=$(basename $1)
	cd $1

	htlatex $name.tex

	more $cwd/main.css >> $name.css

	rm $name.4ct
	rm $name.4tc
	rm $name.idv
	rm $name.lg
	rm $name.tmp
	rm $name.xht
	rm $name.xref

	cd $cwd
}

get_tex_as_html /home/peter/Dropbox/Documents/Essays/CV
get_tex_as_html /home/peter/Dropbox/Documents/Essays/Publication_List
