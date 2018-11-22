all: report.html

clean: 
	rm -f words.txt histogram.tsv histogram.png report.html

words.txt:
	Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", \
	destfile = "words.txt", quiet = TRUE)'
	
# '\' continues Rscript to next line
	
histogram.tsv: histogram.R words.txt
	RScript $<
	
histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm -f Rplots.pdf
	
#can create any phony target for generating a different set of outputs
#e.g.
#plots: histogram.png histogram2.png

report.html: report.rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'