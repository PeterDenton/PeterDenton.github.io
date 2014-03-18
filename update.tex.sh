#!/bin/bash

tex_2_html()
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

mod_css()
{
	cwd=$(pwd)
	name=$(basename $1)
	cd $1

	more $cwd/main.css >> $name.css

	cd $cwd
}

update()
{
	tex_2_html $1
	mod_css $1
}

update /home/peter/Dropbox/Documents/Essays/CV
update /home/peter/Dropbox/Documents/Essays/Publication_List
update /home/peter/Dropbox/Books/Fiction/Original/Surface
update /home/peter/Dropbox/Books/Fiction/Original/Plays
