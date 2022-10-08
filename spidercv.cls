%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spider CV
% LaTeX Class
% Version 1.1 (08/10/22)
%
% Name like this because of the spider chart widget.
% 
% Authors:
% ROMAINPC
% Inspired by developercv (Jan Vorisek)
% Inspired by developercv Doji variant (Stijn Dejongh)
% Inspired by limecv (Olivier Pieters)
% Inspired by altacv (LianTze Lim)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spidercv}[03/01/2022]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation
\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links
\newcommand{\lorem}{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.} % Dummy text
\pagestyle{empty} % No headers or footers
\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)
\usepackage{fontawesome} % fontawesome
\usepackage{ifthen}


%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------
\usepackage[dvipsnames]{xcolor}

\definecolor{Black}{HTML}{212121}
\definecolor{White}{HTML}{FFFFFF}
\definecolor{GreenArmy}{HTML}{252e25}
\definecolor{GreenIT}{HTML}{4caf50}

%%%%% color macros, use it at the beginning of your cv to quickly use the enterprise colors (Pro HRD tips)
\newcommand{\DefineColorMacros}[5]{% COLORS : TextSide / TextMain / HighLight / Background /Other
    \def\ColorTextSide{#1}
    \def\ColorTextMain{#2}
    \def\ColorHighlight{#3}
    \def\ColorBackground{#4}
    \def\ColorOther{#5}
    \color{\ColorTextMain} % Default text color
}

\DefineColorMacros{White}{Black}{GreenIT}{Black}{GreenArmy}



%----------------------------------------------------------------------------------------
%	Printable mode
%----------------------------------------------------------------------------------------
\newcommand{\PrintableMode}{
    \def\PM{} % PM command used in if statements
    \def\ColorTextSide{\ColorTextMain} % Use same text color everywhere
}


%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

% \usepackage{roboto}
\usepackage[scaled]{helvet}


\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used



%----------------------------------------------------------------------------------------
%	GEOMETRIE
%----------------------------------------------------------------------------------------
\usepackage{calc}
\usepackage{tikz}
\usetikzlibrary{calc,positioning,backgrounds,matrix}

\newlength\margin
\setlength\margin{0.5cm}
\usepackage[margin=\margin,noheadfoot,a4paper]{geometry}
\newlength\sidewidth
\setlength\sidewidth{0.33333\paperwidth-2\margin}
\newlength\mainwidth
\setlength\mainwidth{\paperwidth-4\margin-\sidewidth}
\newlength\anglesize
\setlength\anglesize{0.7cm}
\newlength\topheight
\setlength\topheight{\sidewidth}
\newlength\profilesize
\setlength\profilesize{0.7\topheight}




%----------------------------------------------------------------------------------------
%	MAIN SECTIONS
%----------------------------------------------------------------------------------------

\usepackage{ragged2e}
\usepackage[absolute,overlay]{textpos} % option needed to use absolute positionning and to have text on front

\newenvironment{SideBar}[2]{% Background color, Text color
    \begin{tikzpicture}[remember picture,overlay]% put text anywhere

        \ifx\PM\undefined % side and top background
        \fill[fill=#1, shift={(current page.north west)}] 
        \else
        \draw[draw=#1, shift={(current page.north west)}, very thick]
        \fi
            % \fill[fill=#1, shift={(current page.north west)}] 
            (0,-\paperheight) --
            (0,-\anglesize) --
            (\anglesize,0) --
            (\paperwidth,0) --
            (\paperwidth,-\topheight-2\margin) --
            (\sidewidth+2\margin+\anglesize,-\topheight-2\margin) --
            (\sidewidth+2\margin,-\topheight-2\margin-\anglesize) --
            (\sidewidth+2\margin,-\paperheight) --
            cycle;
        \draw [draw=#1, shift={(current page.north west)}, very thick]
            (\paperwidth-0.5\margin,-\topheight-3\margin) --
            (\paperwidth-0.5\margin,-\paperheight+0.5\margin+0.5\anglesize) --
            (\paperwidth-0.5\margin-0.5\anglesize,-\paperheight+0.5\margin) --
            (\sidewidth+3\margin,-\paperheight+0.5\margin);
    \end{tikzpicture}%
    %%%%%%%%%%%%%
    % \TPmargin{}{}
    \begin{textblock*}{\sidewidth}(\margin,\topheight + 3\margin -0.4cm)
    \begin{center}
    \color{#2}
    % Please use vspace to verticaly align manually your content
}{
    \end{center}
    \end{textblock*}
}


\newenvironment{TopBar}[1]{ % Text color
    \begin{textblock*}{\mainwidth}(\sidewidth+3\margin,\margin-0.4cm)
    \begin{center}
    \color{#1}
}{
    \end{center}
    \end{textblock*}
}


\newenvironment{MainPart}{
    \begin{textblock*}{\mainwidth}(\sidewidth+3\margin,\topheight + 3\margin-0.4cm)
    \begin{center}
}{
    \end{center}
    \end{textblock*}
}


\usetikzlibrary{shapes,decorations}

%%%%%%% Picture
\newcommand{\DefineProfile}[3]% Background color, Highlight color, Img path
{   
    \begin{tikzpicture}[remember picture,overlay]
        \node [rectangle, draw=#2, rounded corners=0.5mm, very thick,
        shift={(current page.north west)}, xshift=\anglesize, yshift=-\anglesize,
        ](s1){};
        \node [rectangle, draw=#2, rounded corners=0.5mm, very thick,
        shift={(current page.north west)}, xshift=(\sidewidth+2\margin), yshift=-(\sidewidth+2\margin),
        ](s2){};
        \draw [draw=#2, very thick]
        (s1) -- (s2);
        %%%%%%%%%%%%%%%
        \def\backcolor{\ifx\PM\undefined#1\else White\fi}
        \node[
            shift={(current page.north west)},
            xshift=(\sidewidth+2\margin)/2,
            yshift=-(\sidewidth+2\margin)/2,
            chamfered rectangle, draw=#2, very thick,
          minimum size=\profilesize,
          fill=\backcolor,
          path picture={
            \node at (path picture bounding box.center){
            \includegraphics[height=\profilesize]{#3}
            };
          }]
          {};
      \end{tikzpicture}
}



%----------------------------------------------------------------------------------------
%	COMMANDS AND ENVIRONMENTS
%----------------------------------------------------------------------------------------

%%%%%%% Top bar

%%% Name
\newcommand{\Name}[4]% Highlight color, Name, Profession, Age
{
    {\HUGE{\textbf{\color{#1}#2}}\\
    \Large{#3}
    \hfill
    \Large{#4}}
}

%%%%%%%%% Side bar

%%% Spider chart
\usepackage{xparse}
\newcounter{spidercount}
\ExplSyntaxOn
\NewDocumentCommand{\newList}{m}
 {
  \seq_new:c { l_kees_list_#1_seq }
 }
\NewDocumentCommand{\addToList}{mm}
 {
  \seq_put_right:cn { l_kees_list_#1_seq } { #2 }
 }
\NewDocumentCommand{\getFromList}{mm}
 {
  \seq_item:cn { l_kees_list_#1_seq } { #2 }
 }
\ExplSyntaxOff
\newList{skilllist}
\newList{masterlist}

\newcommand{\addSkill}[2]{ % Skill label, Strenght
    \stepcounter{spidercount}
    \addToList{skilllist}{#1}
    \addToList{masterlist}{#2}
}

\newcounter{var}
\newenvironment{SpiderDiagram}[2]{ % Axes color, Highlight color
    \def\n{\thespidercount}
    \def\N{5}
    \def\nC{#1}
    \def\hC{#2}
    \vspace*{0.15cm}
}{
    \begin{tikzpicture}[scale=0.35]
        \foreach \x in{1,2,...,\n}{
            \setcounter{var}{360/\n*\x}
            \ifthenelse{\thevar = 180 \OR \thevar = 360}{
                \draw [draw=\nC, very thick] (0,0)--(\thevar:\N) node
                [shift=(\thevar-145:-15pt),
                color=\hC] {\small\getFromList{skilllist}{\x}}
            }
            {
                \draw [draw=\nC, very thick] (0,0)--(\thevar:\N) node
                [shift=(\thevar:10pt),
                color=\hC] {\small\getFromList{skilllist}{\x}}
            }
            ;
        }
        \newcounter{temp}
        \newcounter{tempbis}
        \foreach[count=\x] \y in{2,3,...,\n}{
            \setcounter{temp}{\getFromList{masterlist}{\x}}
            \setcounter{tempbis}{\getFromList{masterlist}{\y}}
            \draw [draw=\hC,  very thick]
                (360/\n*\x:\thetemp) -- (360/\n*\x+360/\n:\thetempbis);
        }
        \setcounter{temp}{\getFromList{masterlist}{\n}}
        \setcounter{tempbis}{\getFromList{masterlist}{1}}
        \draw [draw=\hC,  very thick]
            (360:\thetemp) -- (360+360/\n:\thetempbis);


    \end{tikzpicture}
}


%%%%%%%%%%%%%% Main part

%%%%%% Section title
\newcommand{\MainTitleBis}[4]{%Background color, Highlight color, Left text, Right text
    \begin{tikzpicture}[baseline]
        \def\backcolor{\ifx\PM\undefined#1\else White\fi}    
        \node[draw=#2,rounded corners,fill=\backcolor,inner sep=3pt, very thick, anchor=west]
        at (0,0) (box1)
            {\textbf{\Large\color{#2}#3}};
        \node[draw=#2,rounded corners,fill=\backcolor,inner sep=3pt, very thick, anchor=east]
        at (\textwidth,0) (square)
        {\textbf{\Large\color{#2}#4}};
        \draw [very thick, draw=#2, inner sep=0pt] (box1) -- (square);
    \end{tikzpicture}\\
}
\newcommand{\MainTitle}[3]{%Background color, Highlight color, Title text
    \begin{tikzpicture}[baseline]    
            \def\backcolor{\ifx\PM\undefined#1\else White\fi}  
            \node[draw=#2,rounded corners,fill=\backcolor,inner sep=3pt, very thick, anchor=west]
            at (0,0) (box1)
            {\textbf{\Large\color{#2}#3}};
            \node at (\textwidth,0) [rectangle, draw=#2,rounded corners=0.5mm,fill=\backcolor, anchor=east, very thick] (square) {};
        \draw [very thick, draw=#2, inner sep=0pt] (box1) -- (square);
    \end{tikzpicture}\\
}

\def\hrulefill{\leavevmode\leaders\hrule height 0.35mm\hfill\kern\z@} % ~ very thick
%%%%%%% Experience
\newcommand{\Experience}[5]{%Highlight color,  Ttile, Left subtitle, Right subtitle, Description
    \begin{flushleft}
        \large{\textbf{#2\hfill{\small\color{#1}#4}}}\\\vspace{-.4ex}
        \small{{\color{#1}\hrulefill}
        \hspace{1ex}\raisebox{-.4ex}{\color{Black}\textbf{#3}}
        }\\
	    \normalsize{#5}% Description
    \end{flushleft}
}




%%%%%% Common tools

%%% Text separators

\newcommand{\TextSeparator}[2]% Highlight color, Text
{
    \noindent\makebox[\linewidth]{{\color{#1}\hrulefill}
    \hspace{1ex}\raisebox{-.4ex}{\textbf{\large{#2}}}
    \hspace{1ex}{\color{#1}\hrulefill}}
}

\newcommand{\TextSeparatorBis}[3]% Highlight color, Left text, Right text
{
    \noindent\makebox[\linewidth]{\raisebox{-.4ex}{\textbf{\large{#2}}}\hspace{1ex}
    {\color{#1}\hrulefill}
    \hspace{1ex}\raisebox{-.4ex}{\textbf{\large{#3}}}}
}

\newcommand{\SimpleSeparator}[1]% Highlight color
{
    \noindent\makebox[\linewidth]{
    {\color{#1}\hrulefill}}
}

%%% ItemList
\usepackage{enumerate}
\newenvironment{ItemList}[1] % Bullet color
  { \renewcommand{\descriptionlabel}[1]{
    \def\temp{##1}\ifx\temp\empty
        \hspace\labelsep{\textbf{\color{#1}\tiny\faSquare}}% Default bullet
    \else
        \hspace\labelsep{\textbf{\color{#1}##1}}
    \fi
    }%
    \begin{description}}
  {\end{description}}


%%% DoubleColumns
\newenvironment{DoubleColumns}{
    %%%%%%%%% Use this command to split
    \newcommand{\nextcolumn}{\end{center}\end{minipage}\hfill\begin{minipage}[t]{0.5\textwidth-0.5\margin}\begin{center}}

    \begin{minipage}[t]{0.5\textwidth-0.5\margin}
    \begin{center}
}{
    \end{center}
    \end{minipage}\\\vspace*{0.15cm}
}

%%% TripleColumns
\newenvironment{TripleColumns}{
    %%%%%%%%% Use this command to split
    \newcommand{\nextcolumn}{\end{center}\end{minipage}\hfill\begin{minipage}[t]{0.3333\textwidth-0.5\margin}\begin{center}}
    
    \begin{minipage}[t]{0.3333\textwidth-0.5\margin}
    \begin{center}
}{
    \end{center}
    \end{minipage}\\\vspace*{0.15cm}
}

%%% Label
\newcommand{\Label}[2]{% Highlight color, Text
    \tikz[baseline]\node[anchor=base,draw=#1,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex, thick]{#2};
}



%%% Skill Gauges
\newenvironment{SkillGauges}[1]{% Highlight color
    \def\highlightColor{\color{#1}}
    \begin{tabular}{l l}
}{
    \end{tabular}
}
\newcommand{\addGauge}[3][\faSquareO]{% Optional fa symbol | Text | Number of symbols
    #2 & \foreach \i in{1,...,#3}{\highlightColor#1\space} \\
}
