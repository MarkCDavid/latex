# LaTeX papildiniai Vilnius Tech rašto darbams

Repozitorijoje saugomi dokumentų šablonai (legacy) ir dokumentų klasės.

## Reikalavimai

`vilniustech` dokumento klasė naudoja kelis modernius paketus, kurių dažniausiai nėra įdiegiamame `tex-live-full` pakete (pvz.: Ubuntu 20.04.4 LTS įdiegiamas 2019 metų paketas).

[Šiame blogo įraše](https://fahim-sikder.github.io/post/installing-texlive-latest-ubuntu/) pateikiama naujausios `TeX Live` versijos diegimo instrukcija.

## Diegimas

Objektai esantys `texmf/tex/latex` direktorijoje turi būti nukopijuoti į `$HOME/texmf/tex/latex` direktoriją.

Jei ši direktorija neegzistuoja, ją galima sukurti [šio skripto](https://github.com/amunn/make-local-texmf/blob/master/mklocaltexmf.sh) pagalba.

## Dokumento gaminimas

Dokumentas gaminamas naudojant `build.sh` skriptą. Šiuo metu skriptas turi būti leidžiamas iš direktorijos kurioje yra `*.tex` failas. 

## TODO

Šiuo metu egzistuoja tik įprasto rašto darbo klasė, ji nėra tinkama baigiamiesiems rašto darbams. Taip pat nėra klasės skaidrėms. 

Išversti `lithuanian-apa.lbx` lokalizaciją ir įtraukti ją į [biblatex-apa](https://github.com/plk/biblatex-apa) projektą.

Modifikuoti `build.sh` skriptą, leidžiant vartotojui pagaminti dokumentą iš bet kurios direktorijos.

Išnagrinėti egzistuojančias `build system` LaTeX dokumentų gaminimui ir pradėti jas naudoti.

