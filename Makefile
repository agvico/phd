build: PhD.tex 
	@echo "Compiling thesis..."
	@xelatex -synctex=1 -interaction=nonstopmode "PhD".tex
	@biber "PhD"
	@xelatex -synctex=1 -interaction=nonstopmode "PhD".tex
	@xelatex -synctex=1 -interaction=nonstopmode "PhD".tex
	@echo "Done."

compress: PhD.pdf
	@gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=PhD_reduced.pdf PhD.pdf
	@rm PhD.pdf
	@mv PhD_reduced.pdf PhD.pdf

clean:
	@rm *.aux *.log *.bbl *.blg *.bcf *.lof *.run.xml *.synctex.gz *.toc  
