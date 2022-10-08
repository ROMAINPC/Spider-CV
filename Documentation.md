# Spider CV documentation

## General use
You normally don't need to modify the .cls file.
Just import the class by putting the .cls file next to your .tex which contains :
```LaTex
\documentclass[11pt]{spidercv}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\begin{document}
    % TODO
\end{document}
```

### Tools
You can add links to websites in your CV :
```LaTex
\href{https://github.com/romainpc}{my github}
```

You can use Fontawesome icons, [list here](http://mirrors.ibiblio.org/CTAN/fonts/fontawesome/doc/fontawesome.pdf)


### Colors
Most of the commands needs colors as arguments, this class is supplied with the following colors :
- Black #212121 (default text color)
- White #FFFFFF
- GreenArmy #252e25
- GrennIt #4caf50

To create your own colors :
```LaTex
\definecolor{blue-exemple}{HTML}{0d2778}
\definecolor{green-exemple}{HTML}{44, 151, 62}
```

The class provided the following macros to factorize colors choices :
- `\ColorTextSide` default to White
- `\ColorTextMain` default to Black
- `\ColorHighlight` default to GreenIT
- `\ColorBackground` default to Black
- `\ColorOther` default to GreenArmy
To redefine this macros add at the beginning of the document :
```LaTex
\DefineColorMacros{White}{Black}{GreenIT}{Black}{GreenArmy}
```


### Printable mode
If you wish to facilitate the printing of your CV, use the following command at the beginning of the document:
```LaTex
\PrintableMode
```
This will disable plain color backgrounds and use ColorTextMain also inside side bar.

## Parts
Three main environments are used to split the template.
By default, text are centered inside of each parts.
If you need to vertically center the content, you can use `\vspace{}` command.

#### Top Bar
Will define the text on top of the CV.
```LaTex
\begin{TopBar}{\ColorTextSide}
    % TODO
\end{TopBar}
```

#### Side Bar
Will define the text on left side of the CV.
And also the background color.
```LaTex
\begin{SideBar}{\ColorBackground}{\ColorTextSide}
    % TODO
\end{SideBar}
```

#### Main Part
Will define the main part.
```LaTex
\begin{MainPart}
    % TODO
\end{MainPart}
```

## Components

#### Picture
This command allow to display your profil picture on top-left of the template.
This command need to be placed __after__ the SideBar.
```LaTex
\DefineProfile{\ColorOther}{\ColorTextSide}{path/img.png}
```

#### Main section titles
Display your name and most important informations with the following command, to be used at top of the Top Bar.
```LaTex
\Name{\ColorHighlight}{Name}{Left text}{Right text}
```

To create sections titles in the Main part, use :
```LaTex
\MainTitle{\ColorHighlight}{\ColorTextMain}{Title}
% OR
\MainTitleBis{\ColorHighlight}{\ColorTextMain}{Left title}{Right title}% you can use fontawesome icons for one of the two titles.
```


#### Experiences
To display a professional experience or an academic degree :
```LaTex
\Experience
    {\ColorHighlight}
	{Title}
	{Subtitle}
    {date or subtitle}
    {Description of your activities\\
    And whatever you want.}
```


#### Separators
You can add horizontal separators, use it in top or side bar.
Feel free to adjust bottom spacing by adding line break after the following commands.
```LaTex
\TextSeparator{\ColorHighlight}{Center title}
% or
\TextSeparatorBis{\ColorHighlight}{Left title}{Right title}% you can use fontawesome icons for one of the two titles.
%or
\SimpleSeparator{\ColorHighlight}
```


#### Columns
To split a text area in several columns you can use the following structures :
```LaTex
\begin{DoubleColumns}
    % first colunm
    \nextcolumn
    % second column
\end{DoubleColumns}
```
or
```LaTex
\begin{TripleColumns}
    % first colunm
    \nextcolumn
    % second column
    \nextcolumn
    % third column
\end{TripleColumns}
```

#### Spider chart
You can display your strength in severals skills on a web chart.
```LaTex
\begin{SpiderDiagram}{\ColorTextSide}{\ColorHighlight}
    \addSkill{Skill1}{5}
    \addSkill{Skill2}{3}
    \addSkill{Skill3}{2}
    \addSkill{Skill4}{4}
    % etc
\end{SpiderDiagram}
```


#### Lists
Several components allows you to display hard or soft skills.
This is a simple list with highlighted bullet/title :
```LaTex
\begin{ItemList}{\ColorHighlight}
    \item [] text
    \item [] text
    \item [title] text
    \item [fa icon] text
    % etc
\end{ItemList}
```
If `[]` is empty, default `\faSquare` bullet will be used.



#### Gauges
Instead of the spider chart, you can simply display your skills mastering with gauges :
```LaTex
\begin{SkillGauges}{\ColorHighlight}
    \addGauge{skill1}{5}
    \addGauge{skill2}{4}
    \addGauge[\faCircle]{skill3}{1} % optional symbol
    % etc
\end{SkillGauges}
```
Default symbol is `\faSquareO`.



#### Labels
At last, you can display skills by a succession of labels:
```LaTex
\Label{\ColorHighlight}{Skill}
% etc
```
Don't forget to add line break at the end.