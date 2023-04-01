\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vilniustech-en}[2022 Rašto darbo klasė (Vilnius Tech) (Anglų kalba)]
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
\DeclareStringOption{workAuthorNames}
\DeclareStringOption{workRecipient}
\ProcessKeyvalOptions*

\newcommand{\vilniustechsetup}{
  \kvsetkeys{vt}
}

\newcommand{\ifblankvt}[1]{
  \expandafter\ifblank\expandafter{#1}
}

\newcommand{\parenreflst}[1]{
  (ištrauka \ref{#1})
}

\newcommand{\parenrefsec}[1]{
  (skyrius \ref{#1})
}

% Lietuviško teksto kodavimas
% https://www.vtex.lt/tex/littex/index.html
% Būtinas, prireikus koduoti lietuviškus simbolius angliškame dokumente
\RequirePackage[utf8]{inputenc}
\RequirePackage[L7x,T1]{fontenc}

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
\RequirePackage{indentfirst}

% listings
\RequirePackage{listings}
\RequirePackage{xcolor}

\colorlet{punct}{red!60!black}
\definecolor{background}{HTML}{EEEEEE}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}

\lstdefinelanguage{json}{
    basicstyle=\normalfont\ttfamily,
    numbers=left,
    numberstyle=\scriptsize,
    stepnumber=1,
    numbersep=8pt,
    showstringspaces=false,
    breaklines=true,
    frame=lines,
    backgroundcolor=\color{background},
    literate=
     *{0}{{{\color{numb}0}}}{1}
      {1}{{{\color{numb}1}}}{1}
      {2}{{{\color{numb}2}}}{1}
      {3}{{{\color{numb}3}}}{1}
      {4}{{{\color{numb}4}}}{1}
      {5}{{{\color{numb}5}}}{1}
      {6}{{{\color{numb}6}}}{1}
      {7}{{{\color{numb}7}}}{1}
      {8}{{{\color{numb}8}}}{1}
      {9}{{{\color{numb}9}}}{1}
      {:}{{{\color{punct}{:}}}}{1}
      {,}{{{\color{punct}{,}}}}{1}
      {\{}{{{\color{delim}{\{}}}}{1}
      {\}}{{{\color{delim}{\}}}}}{1}
      {[}{{{\color{delim}{[}}}}{1}
      {]}{{{\color{delim}{]}}}}{1},
}


% Tarpams tarp eilučių
\RequirePackage[nodisplayskipstretch]{setspace}

% 1.5 intervalas tarp eilučių
\setstretch{1.427465}

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

% Kelių stulpelių aplinka
\usepackage{multicol}

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
\RequirePackage{wrapfig}

% Nustatymai antraštėms
\RequirePackage{caption}
\captionsetup{
    format = hang,
    labelfont = bf,
    font = small,
}
\captionsetup[table]{
    labelsep = period,
    singlelinecheck = off,
    justification=raggedright
}
\captionsetup[figure]{
    labelsep = period
}
\renewcommand{\lstlistingname}{Ištrauka}
\renewcommand{\lstlistlistingname}{Ištraukų sąrašas}

% Modernus lentelių paketas
\RequirePackage{tabularray}
\RequirePackage{varwidth}
\RequirePackage{enumitem}
\DefTblrTemplate{caption-tag}{vtTag}{\small\textbf{Table\ \thetable.}}
\DefTblrTemplate{caption-text}{vtText}{\small\InsertTblrText{caption}}
\DefTblrTemplate{caption-tag}{vtContTag}{\small\textbf{Table\ \thetable\ (Continued).}}

\DefTblrTemplate{caption}{vt}{
    \UseTblrTemplate {caption-tag}{vtTag}
    \UseTblrTemplate {caption-text}{vtText}
}
\DefTblrTemplate{capcont}{default}{
    \UseTblrTemplate{caption-tag}{vtContTag}
    \UseTblrTemplate{caption-text}{vtText}
}
\SetTblrTemplate{caption}{vt}

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
\RequirePackage[figure,table,lstlisting]{totalcount}

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
            \ifblankvt{\vt@workAuthorName}{}{Author: \vt@workAuthorGroup\ group student \vt@workAuthorName}
            \ifblankvt{\vt@workAuthorNames}{}{Authors: \vt@workAuthorGroup\ group students: \\ \vt@workAuthorNames}
    
            Checked by: \vt@workRecipient 
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

    \iftotallstlistings
        \lstlistoflistings
    \fi

    \newpage
}

% Komanda skirta generuoti dokumento pradžią
\newcommand{\VTDocumentBegin}
{
    \begin{document}
    \MakeTitlePage
    \MakeContentTables
    \justifying
}

% Komanda skirta generuoti dokumento pabaigą
\newcommand{\VTDocumentEnd}
{
    \newpage
    \printbibliography
    \end{document}
}