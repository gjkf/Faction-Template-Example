%vim: set filetype=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{factiontemplate}[2020/12/25]

\LoadClass[14pt]{extarticle}

\RequirePackage[landscape,left=1cm,right=1cm,bottom=1cm,headsep=1cm,headheight=20pt]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
% This needs to be installed on the system to actually work
% Due to this package (fontspec) the file has to be compiled by either lualatex or xelatex
\setsansfont{OPTICopperplate-Heavy}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xcolor}
\RequirePackage[nostruts]{titlesec}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{microtype}
\RequirePackage[colaction]{multicol}
\RequirePackage{changepage}
\RequirePackage{caladea}

% Adding the padding around the icon
\RequirePackage{afterpage}
\newcommand{\AtBeginPage}{\if@firstcolumn
\global\everypar{\parshape=3 
    3cm \dimexpr \columnwidth-3cm\relax
    3.6cm \dimexpr \columnwidth-3.6cm\relax
    3.2cm \dimexpr \columnwidth-3,2cm\relax
  \global\everypar{}}\fi
\afterpage{\AtBeginPage}}

\AtBeginDocument{\AtBeginPage}

\pagestyle{fancy}
\fancyhf{}

% Header
\fancyhead[C]{%
\begin{tikzpicture}[remember picture, overlay]
  \filldraw[fill=FT@maincolor, draw=FT@maincolor!80]
  ([yshift=1.8cm,xshift=1cm]current page text area.north west) rectangle
  ([yshift=0.3cm]current page text area.north east);
%
  \node at ([yshift=-1.65cm]current page.north)
  {\color{white}\bfseries\LARGE\MakeUppercase{\textsf{\FT@name}}};
  \node at ([xshift=1.5cm]current page text area.north west)
  {\includegraphics[width=4cm]{\FT@logo}};
\end{tikzpicture}
}
\renewcommand{\headrulewidth}{0pt}

\setlength{\columnsep}{1cm}

\newcommand{\FT@name}{CHANGE ME}
\newcommand{\FT@logo}{example-image}

\newcommand{\setcolor}[1]{\colorlet{FT@maincolor}{#1}}
\newcommand{\name}[1]{\renewcommand{\FT@name}{#1}}
\newcommand{\logo}[1]{\renewcommand{\FT@logo}{#1}}

\titleformat{\section}
[display]
{\centering\Large\bfseries}
{\thesection}
{1cm}
{
\begin{tikzpicture}[remember picture, overlay]
  \node (O) at (0,-0.4){};
  \node (O1) at (0,0.7){};
  % We need to change the shift based on which column we are in
  \docolaction{
    \filldraw[fill=FT@maincolor,draw=FT@maincolor!80] 
      ([xshift=0cm]current page text area.west |- O) rectangle
      ([xshift=-0.5cm]current page text area.north |- O1);
  }{}{
    \filldraw[fill=FT@maincolor,draw=FT@maincolor!80] 
      ([xshift=13.5cm]current page text area.west |- O) rectangle
      ([xshift=13cm]current page text area.north |- O1);
  }
\end{tikzpicture}
\color{white}
}
[]

\newenvironment{advantages}[1]{%
\section*{\normalsize\MakeUppercase{\textsf{#1}}}
\begin{description}[leftmargin=0pt]
}
{\end{description}}
