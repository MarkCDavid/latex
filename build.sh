#!/bin/sh

document="${1%.*}"

[ -d ./aux ] || mkdir ./aux


_pdflatex() {
    echo "pdflatex - $1"
    pdflatex \
        -synctex=1 \
        -output-directory=./aux \
        -halt-on-error \
        "$document.tex" 1>/dev/null
    status=$?
    [ $status -eq 0 ] || _error
}

_bibtex() {
    echo "bibtex - $1"
    bibtex \
        "./aux/$document" 1>/dev/null
    status=$?
    [ $status -eq 0 ] || _error
}

_error() {
    if [ -f "./aux/$document.log" ]; then
        cp "./aux/$document.log" . &&
        echo "Error occured - check '$document.log' for details"
    else
        echo "Error occured, no log file is available"
    fi
    exit 1
}

_postprocessing() {
    cp "./aux/$document.pdf" .
    cp "./aux/$document.log" .
    rm -r ./aux
}

_pdflatex "Generating document"
_bibtex "Generating references"
_pdflatex "Attaching references"
_pdflatex "Enumerating references"
_postprocessing