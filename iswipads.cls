% basiert auf der Vorlage von O. Gerlach (2015), erweitert von C. Hinze (2020)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iswipads/iswipads}[2021/10/01 v. 1.2 ISW-IPA Reihe für Dissertationen]

\ProcessOptions\relax
\newcommand{\documentfontsize}{14pt}
\newcommand{\titlewidth}{1.0}
\newcommand{\introstart}{Der Fakult\"at}
\newcommand{\introstatus}{vorgelegte}
\newcommand{\documentsourceintro}{von}
\DeclareOption{accepted}{\renewcommand{\introstart}{Von der Fakult\"at}\renewcommand{\introstatus}{genehmigte}\renewcommand{\documentsourceintro}{Vorgelegt von}}
\DeclareOption{smalltext}{\renewcommand{\documentfontsize}{12pt}\renewcommand{\titlewidth}{0.9}}
\ProcessOptions
\LoadClass[fontsize=\documentfontsize,
DIV=calc,
twoside,
headings=normal,
headsepline,
listof=totoc,% add a tocentry for lists like LOF and LOT
]{scrbook} % KOMA-Script scrreprt, DIN A4, 14pt with bibliography in TOC
\usepackage[a4paper]{geometry}
\geometry{tmargin=3.0cm,bmargin=3.0cm,lmargin=2.0cm,rmargin=2.0cm,headheight=1cm,headsep=1cm,footskip=1cm,head=45pt}

\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

\RequirePackage{babel}

\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}{
	\relax
}{
	\PassOptionsToPackage{T1}{fontenc} % T2A for cyrillics
	\RequirePackage{fontenc}  

	\PassOptionsToPackage{utf8}{inputenc} % directly support utf8 characters, as ä,ö,ü,Ü,ß
	\RequirePackage{inputenc}  	 
}


\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}
   { % use fontspec and OpenType fonts with utf8 engines
	\RequirePackage{fontspec}%
	\defaultfontfeatures{Ligatures=TeX}%
	\setsansfont{texgyreheros}[
	Scale=MatchLowercase,% or MatchUppercase
	Extension=.otf,
	UprightFont=*-regular,
	ItalicFont=*-italic,
	BoldFont=*-bold,
	BoldItalicFont=*-bolditalic,
	]
	
	\setmainfont{texgyrepagella}[
	Scale=MatchLowercase,% or MatchUppercase
	Extension=.otf,
	UprightFont=*-regular,
	ItalicFont=*-italic,
	BoldFont=*-bold,
	BoldItalicFont=*-bolditalic,
	%Numbers={Proportional,OldStyle}
	]
	
	\linespread{1.05} % for pagella
	%\RequirePackage{unicode-math}
	%\setmathfont{TeX Gyre Pagella Math}%
	%\setmainfont[SmallCapsFeatures={LetterSpace=6}, Numbers={Proportional,OldStyle}]{Minion Pro}
	%\setsansfont[LetterSpace=3, Numbers={Proportional,OldStyle}]{Myriad Pro}
	\setmonofont[Scale=0.85]{DejaVu Sans Mono} 
   }
   { % use Type 1 fonts with pdflatex
	\PassOptionsToPackage{osf,sc}{mathpazo}%
	\RequirePackage{mathpazo} % Palatino with real small caps and old style figures
	\usepackage{tgheros}
	\linespread{1.05} % a bit more for Palatino
	\PassOptionsToPackage{scaled=0.85}{DejaVuSansMono}%
	\RequirePackage{DejaVuSansMono}%
	\RequirePackage{tgpagella}% bera monospace font
	\RequirePackage{textcomp}% declare missing symbols
   }

%\PassOptionsToPackage{activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10}{microtype}
\RequirePackage{microtype}



\RequirePackage[onehalfspacing]{setspace} 
\RequirePackage[automark,%
headsepline=0.20pt,%
%headtopline=0.00pt,%
%footsepline=0.20pt,%
draft=false,]{scrlayer-scrpage}	 % header & footer layout
\pagestyle{scrheadings}
\RequirePackage[pdfusetitle]{hyperref}

\RequirePackage[dvipsnames]{xcolor}
\definecolor{uniSblue}{RGB}{0,65,145}
\definecolor{uniSlightblue}{RGB}{0,190,255}
\definecolor{uniSgrey}{RGB}{62, 68, 76}
\definecolor{uniSyellow}{RGB}{255, 213, 0}
\definecolor{uniSred}{RGB}{230, 0, 50}
\definecolor{uniSgreen}{RGB}{0, 200, 50} 

\RequirePackage{graphicx}

\RequirePackage{titletoc}
\contentsmargin{2.5em}

% Verhindern von Schusterjungen und Hurenkindern über Penalty
\widowpenalty=10000
\clubpenalty=10000 
\displaywidowpenalty=10000

% Floats auf extra Float-Page oben platzieren
\setlength{\@fptop}{0pt}% default is 0\p@ \@plus 1fil
\setlength{\@fpsep}{\floatsep}% default is 8\p@ \@plus 2fil
\setlength{\@fpbot}{0pt plus 1fil}% default is 0\p@ \@plus 1fil

\renewcommand*{\chapterpagestyle}{scrheadings}	% IPA requires sepline and running title above chapters beginning from toc
\clearpairofpagestyles	% clear header and footer, IIRC
\ohead[\headmark]{\headmark}
\ofoot[\pagemark]{\pagemark}	% IPA requires page numbers nearly everywhere (also below new chapters)

%Schriftfamilien für Überschriften auf Schriften mit Serifen!
% \addtokomafont{chapter}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{chapterentry}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{section}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{subsection}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{subsubsection}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{title}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{disposition}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{labelinglabel}{\normalfont \bfseries}{\sffamily}
% \addtokomafont{descriptionlabel}{\normalfont \bfseries}{\sffamily}

% Titelei: Befehle (Hinweis: author & title sind schon definiert)
\newcommand*{\@birthplace}{\ClassError{iswipads/iswipads}{\string\birthplace\space missing}%
	{You have to use \string\birthplace\space to set up the place of the author's birth.}}
\newcommand*\birthplace[1]{\renewcommand\@birthplace{#1}}

\newcommand*{\@examiner}{\ClassError{iswipads/iswipads}{\string\examiner\space missing}%
	{You have to use \string\examiner\space to set up the your examiner,\MessageBreak e.g. `\string\examiner{Name of examiner}'.}}
\newcommand*\examiner[1]{\renewcommand\@examiner{#1}}

\newcommand*{\@coexaminer}{\ClassError{iswipads/iswipads}{\string\coexaminer\space missing}%
	{You have to use \string\coexaminer\space to set up the your co-examiner,\MessageBreak e.g. `\string\coexaminer{Name of co-examiner}'.}}
\newcommand*\coexaminer[1]{\renewcommand\@coexaminer{#1}}

\newcommand*{\@dateoforalexamination}{\ClassError{iswipads/iswipads}{\string\dateoforalexamination\space missing}%
	{You have to use \string\dateoforalexamination\space to set up the date of oral examination,\MessageBreak e.g. `\string\dateoforalexamination{TT.MM.YYYY}'.}}
\newcommand*\dateoforalexamination[1]{\renewcommand\@dateoforalexamination{#1}}

\newcommand*{\@yearofpublication}{\ClassError{iswipads/iswipads}{\string\yearofpublication\space missing}%
	{You have to use \string\yearofpublication\space to set up the publication year of your thesis,\MessageBreak e.g. `\string\yearofpublication{YYYY}'.}}
\newcommand*\yearofpublication[1]{\renewcommand\@yearofpublication{#1}}

\renewcommand*{\maketitle}{%
  \begin{titlepage}
	{
	  \fontsize{12pt}{15pt}\selectfont
    \centering
		\begin{minipage}{\titlewidth\textwidth}
			\centering
			{\LARGE\bfseries\sffamily\strut\ignorespaces\@title\par}
		\end{minipage}
		\vfill
		\begin{minipage}{\titlewidth\textwidth}
			\centering
			\introstart\ Konstruktions-, Produktions- und Fahrzeugtechnik\\
			der  Universit\"at Stuttgart zur Erlangung\\
			der W\"urde eines Doktor-Ingenieurs (Dr.-Ing.)\\
			\introstatus\ Abhandlung\par%
		\end{minipage}
		\vfill
		\begin{minipage}{0.8\textwidth}
			\centering
		\documentsourceintro\\
    {\bfseries\strut\ignorespaces\@author\\}
    aus \@birthplace\par%
		\end{minipage}
    \vfill
		\begin{minipage}{0.8\textwidth}
			\begin{tabbing}
				Hauptberichter:\qquad\qquad\qquad\qquad \=\@examiner \\
				Mitberichter:\> \@coexaminer \\[\baselineskip]
				Tag der m\"undlichen Pr\"ufung: \> \@dateoforalexamination \\
			\end{tabbing}
		\end{minipage}
		\vskip 2\baselineskip
		\begin{minipage}{0.8\textwidth}
			\centering
			Institut f\"ur Steuerungstechnik der Werkzeugmaschinen und Fertigungseinrichtungen der Universit\"at Stuttgart\\
			\vskip \baselineskip
			\@yearofpublication
		\end{minipage}
    \clearpage
	}
  \end{titlepage}
}

%\ifpdf
%\fi

% get footnotes right
\deffootnote{0em}{0em}{\thefootnotemark\hspace*{.5em}}

% Initialize hyperref

\hypersetup{%
	%draft, % hyperref's draft mode, for printing see below
	colorlinks=true, linktocpage=true, pdfstartpage=3,% pdfstartview=FitV,%
	% uncomment the following line if you want to have black links (e.g., for printing)
	%colorlinks=false, linktocpage=false, pdfstartpage=3, pdfstartview=FitV, pdfborder={0 0 0},%
	breaklinks=true, pageanchor=true,%
	pdfpagemode=UseNone,%
	plainpages=false, bookmarksnumbered, bookmarksopen=true,% bookmarksopenlevel=1,%
	hypertexnames=true, pdfhighlight=/O,%
	urlcolor=uniSblue, linkcolor=uniSblue, citecolor=uniSblue,% %pagecolor=uniSblue,%
	%urlcolor=Black, linkcolor=Black, citecolor=Black, %pagecolor=Black,%
}