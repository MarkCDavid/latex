\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vilniustech}[2022 Rašto darbo klasė (Vilnius Tech)]
\PassOptionsToClass{12pt, a4paper}{article}
\ProcessOptions\relax
\LoadClass{article}

% Rakto-reikšmių parametrams
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=vt,
    prefix=vt@
}

\DeclareStringOption{university}
\DeclareStringOption{faculty}
\DeclareStringOption{cathedral}
\DeclareStringOption{workTitle}
\DeclareStringOption{workType}
\DeclareStringOption{workAuthorGroup}
\DeclareStringOption{workAuthorName}
\DeclareStringOption{workRecipient}
\ProcessKeyvalOptions*

\newcommand{\vilniustechsetup}{
  \kvsetkeys{vt}
}

% Lietuviško teksto kodavimas
% https://www.vtex.lt/tex/littex/index.html
\RequirePackage[utf8]{inputenc}
\RequirePackage[L7x,T1]{fontenc}
\RequirePackage[lithuanian]{babel}

% Į 'Times New Roman' panašus šriftas
\RequirePackage{mathptmx} 

% Lapo paraštės
\RequirePackage{geometry}
\geometry{
    a4paper,
    top=20mm,
    right=10mm,
    bottom=20mm,
    left=30mm,
}

% Lygiuotė pagal abi lapo puses
% Naudojant /justify
\RequirePackage[document]{ragged2e}

% Eilutės pastraipoje atitraukimo dydis
\setlength{\JustifyingParindent}{10mm}

% Pirmos eilutės pastraipoje atitraukimas
\usepackage{indentfirst}


% Tarpams tarp eilučių
\RequirePackage{setspace}

% 1.5 intervalas tarp eilučių
\onehalfspacing

% Veikiančios turinio, lentelių, paveikslėlių ir bendrosios nuorodos
\RequirePackage[unicode]{hyperref}

% Papildomas 'float' objektų funkcionalumas
% 'float' objektų talpinimo prieš skyrių prevencija
\RequirePackage{float}
\RequirePackage[section]{placeins}

% Teksto atvaizdavimo patobulinimai
\RequirePackage{microtype}

% Teisingas kablelio atvaizdavimas skaitmenyse
\RequirePackage{icomma}

% Lietuviškos kabutės
\RequirePackage{csquotes}
\DeclareQuoteAlias{german}{lithuanian}
\MakeOuterQuote{"}

% Antraščių formatavimas
\RequirePackage{titlesec}
\titleformat
    {\section}
    {\normalfont\Large\bfseries\justifying}
    {\thesection.}
    {14pt}
    {}

\titleformat
    {\subsection}
    {\normalfont\large\bfseries}
    {\thesubsection.}
    {13pt}
    {}
\titleformat
    {\subsubsection}
    {\normalfont\normalfont\bfseries}
    {\thesubsubsection.}
    {12pt}
    {}

% Bibliografija
% (2022-08-20) https://github.com/plk/biblatex-apa
% biblatex-apa paketas neturi lithuanian-apa.lbx failo, kuris būtinas norint naudoti
% APA stiliaus citavimą. Reikia padaryti egzistuojančio *-apa.lbx failo kopiją, ir ją
% pervadinti lithuanian-apa.lbx.
\RequirePackage[
    backend=biber,
    style=apa,
    sorting=none,
    sortcites=true,
    block=none,
    indexing=false,
    citereset=none,
    isbn=true,
    url=true,
    doi=true,
    natbib=true
]{biblatex}

% Vaizdams dokumente
\RequirePackage{graphicx}

% Nustatymai antraštėms
\RequirePackage{caption}
\captionsetup{
    format = hang,
    labelfont = bf,
    font = small,
    tablename = lentelė,
    figurename = pav
}
\captionsetup[table]{
    labelsep = period,
    singlelinecheck = off,
    justification=raggedright
}
\captionsetup[figure]{
    labelsep = period
}

% Modernus lentelių paketas
\RequirePackage{tabularray}
\RequirePackage{varwidth}
\RequirePackage{enumitem}
\DefTblrTemplate{caption-tag}{lithuanian}{\small\textbf{\thetable\ lentelė.}}
\DefTblrTemplate{caption-text}{lithuanian}{\small\InsertTblrText{caption}}
\DefTblrTemplate{caption-tag}{lithuaniancont}{\small\textbf{\thetable\ lentelės tesinys.}}
\DefTblrTemplate{contfoot-text}{empty}{}
\DefTblrTemplate{caption}{lithuanian}{
    \UseTblrTemplate {caption-tag}{lithuanian}
    \UseTblrTemplate {caption-text}{lithuanian}
}
\DefTblrTemplate{capcont}{default}{
    \UseTblrTemplate{caption-tag}{lithuaniancont}
    \UseTblrTemplate{caption-text}{lithuanian}
}
\SetTblrTemplate{caption}{lithuanian}
\SetTblrTemplate{contfoot-text}{empty}

\NewTblrEnviron { vttable }
\SetTblrOuter [ vttable ] { long }
\SetTblrInner [ vttable ] { hlines, vlines, rowsep=0pt, hspan=minimal }

\def\VTTable#1
{
    \begin{singlespace}
    \small
    \begin{vttable}#1
    \end{vttable}
    \end{singlespace}
}

\def\VTTableBeginEnumerate
{
    \begin{varwidth}[t]{\linewidth}
    \begin{enumerate}[topsep=0pt,parsep=0pt]
}

\def\VTTableEndEnumerate
{
    \strut
    \end{enumerate}
    \end{varwidth}
}

\def\VTTableBeginItemize
{
    \begin{varwidth}[t]{\linewidth}
    \begin{itemize}[topsep=0pt,parsep=0pt]
}

\def\VTTableEndItemize
{
    \strut
    \end{itemize}
    \end{varwidth}
}

% PDF puslapių įterpimas
\RequirePackage{pdfpages}

% Turinio atvaizdavimas
\RequirePackage{tocloft}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% Nustatyti, ar lentelių/iliustracijų sąrašas reikalingas dokumente
\RequirePackage[figure,table]{totalcount}

%%%
%%% Papildomos komandos dokumento stiliui
%%%

% Komanda skirta generuoti titulinį lapą
\newcommand{\MakeTitlePage}
{
    \begin{center}
        \includegraphics[height=1.7cm]{logo/vt_logo_lt.png}
        \vspace{0.9cm}

        {\large\MakeUppercase{\vt@university}\vspace{0.15cm}}

        {\MakeUppercase{\vt@faculty}\vspace{0.1cm}}

        {\MakeUppercase{\vt@cathedral}\vspace{6cm}}

        {\MakeUppercase{\textbf{\vt@workTitle}}\vspace{0.1cm}}

        {\vt@workType\vspace{5cm}}

        \begin{flushright}
            Atliko: \vt@workAuthorGroup\ grupės studentas \vt@workAuthorName
    
            Tikrino: \vt@workRecipient
        \end{flushright}
        \vspace{\fill}

        Vilnius, \the\year{}
    \end{center}
    \thispagestyle{empty}
    \newpage
}

% Komanda skirta generuoti turinį
\newcommand{\MakeContentTables}
{
    \tableofcontents
    
    \iftotalfigures
        \listoffigures
    \fi
    
    \iftotaltables
        \listoftables
    \fi

    \newpage
}

% Komanda skirta generuoti dokumento pradžią
\newcommand{\VTDocumentBegin}
{
    \begin{document}
    \MakeTitlePage
    \MakeContentTables
    \justify 
}

% Komanda skirta generuoti dokumento pabaigą
\newcommand{\VTDocumentEnd}
{
    \newpage
    \printbibliography
    \end{document}
}