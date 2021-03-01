
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oxmathproblems}[2020/05/12 v1.3 Oxford Maths problem sheet class]
\LoadClass[11pt,a4paper]{exam} 

%space out the lines by 25% more than the default (basically 1.5 line spacing)
\linespread{1.25}

% General thinking is that 12pt font, with 1.25 spread, black on white text,
% gives a good readable document for most people. For those that benefit
% from larger fonts many will be best zooming / expanding the document on
% screen or simply printing enlarged on A3 as that will best preserve the
% formatting rather than enlarging the font whilst still fitting into an A4
% sized space.  For those that benefit from a different background colour
% this is likely easiest achieved if the document is on white and then
% software or a film is used to change the white to cream, blue etc

%load in some commonly needed packages 
\RequirePackage{ifthen,amsmath,amssymb,amsthm,bm,graphicx,color}

%increase the printed page area width
\extrawidth{0.5cm}

%increase header space on title page only
\extraheadheight[1.5cm]{0cm}

%setup page headers/footers for first and subsequent pages
\pagestyle{headandfoot}
\lhead{}
\chead[\bfseries \Large \thecourse\\ \ifprintanswers \ Solutions \fi \group\\%
\ifprintanswers \textit{\textcolor{red}{For Tutors Only --- Not For Distribution}}\\ \fi
\thesheettitle]{}
\rhead{ADA No. I}
\lhead{Fecha}
\lfoot{\footnotesize Facultad de Ingeniería, Universidad Autónoma De Yucatán \\ \thecontact}
\cfoot{}
\rfoot{Page \thepage{} of \numpages}
\footrule

% define newcommands for user set page header details
\newcommand*{\group}[1]{\def\thegroup{#1}}
\newcommand*{\course}[1]{\def\thecourse{#1}}
\newcommand*{\sheetnumber}[1]{\def\thesheetnumber{#1}}
\newcommand*{\sheettitle}[1]{\def\thesheettitle{#1}}
\group{}\course{}\sheetnumber{}\sheettitle{}

% define a command for user to set some contact info in the footer
\newcommand*{\contact}[1]{\def\thecontact{#1}}
\contact{}

% revised question command that tries to encourage page breaks
% to lie between questions rather than within questions
\newcommand{\nquestion}[1][]{\filbreak
  \ifthenelse{\equal{#1}{}}{\question}{\question[#1]}
}

% do not put a box/frame around printed solutions
\unframedsolutions

\renewcommand{\subpartlabel}{(\thesubpart)}

%if you produce a problem sheet with solutions but want to strip the
%solutions from the tex file (e.g. to give to a student who needs to use a
%screen reader) you could run one of
%sed '/\\begin{solution}/,/\\end{solution}/d' file.tex > file-nosoln.tex
%perl -ne 'print unless /^\\begin\{solution\}/ .. /^\\end\{solution\}/' file.tex > file-nosoln.tex
