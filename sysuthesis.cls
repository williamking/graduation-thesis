% 定义模板样式
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sysuthesis}
  [2017/04/19 v4.2.3 Yat-Sen University undergraduate thesis document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[
  %fontset=adobe,
  fontset=fandol,  % texlive自带，可移植字体库，只有常用的6763个汉字
  %fontset=ubuntu,
  %fontset=mac,
  %fontset=windows,
  a4paper,
  %openright,
  openany,
  zihao=-4
]{ctexbook}

% 配置英文字体
\RequirePackage{fontspec}
% \setmainfont{Times New Roman}

\RequirePackage[margin=1in,headsep=.2in, headheight=2in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage[labelsep=space]{caption}
\RequirePackage[font=footnotesize]{subcaption}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage{endnotes}
\RequirePackage[section]{placeins}
\RequirePackage[chinese, onelanguage,linesnumbered,algochapter,ruled,vlined]{packages/algorithm2e}%不需要描述算法时把这行去掉
\RequirePackage{enumitem}
\RequirePackage{bbm}
\RequirePackage{bm}
\RequirePackage[notlof,notlot,nottoc,numbib]{tocbibind} %table of content
\RequirePackage{tocloft}
\RequirePackage{wrapfig}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{array}

% Insert a TRUE blank page which has no header or footer
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{
  \clearpage{
    \pagestyle{empty}
    \origdoublepage
  }
}

% 设定时间为中文日期
\ctexset{today=small}

\AtBeginDocument{ % we setup hyperreferrence here because we get ctitle and cauthmr util the begin of document
  \hypersetup{
    citecolor=green,
    filecolor=black,
    linkcolor=black,
    urlcolor=black,
    CJKbookmarks=true,
    pdftitle={\@ctitle},
    pdfauthor={\@cauthor},
    pdfkeywords={\@ckeywords},
    pdfcreator={LaTeX with hyperref package, using SYSU undergraduate Thesis LaTeX Template}
  }
}

\pagestyle{fancy}

% list environment,
\setlist[enumerate]{nosep}
\renewcommand\labelenumi{\theenumi}
\setlist[itemize]{nosep}
\setlist[description]{nosep}

% header, footer, footnote setting
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{ \markboth{#1}{} }
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\zihao{-5}\thepage}
  \fancyhead[L]{\zihao{-5}\@ctitle}
  \fancyhead[R]{\zihao{-5}\leftmark}
}
\pagestyle{plain}
\fancypagestyle{eAbstract}{\fancyhead[L]{\zihao{-5}\@etitle} }
\fancypagestyle{listoffiguretable}{\fancyhead[R]{\zihao{-5}插图与表格目录}}

% figure and table setting
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\setlength\heavyrulewidth{0.2em}
\captionsetup{font=small,format=hang}


% 目录设定，使用tocloft宏包
\setcounter{secnumdepth}{3} % depth of toc, 2
\setcounter{tocdepth}{1}

% 目录标题：3号宋体加粗
\renewcommand{\cfttoctitlefont}{\hfill\zihao{3}\songti\bfseries}
\renewcommand{\cftlottitlefont}{\hfill\zihao{3}\songti\bfseries}
\renewcommand{\cftloftitlefont}{\hfill\zihao{3}\songti\bfseries}

% 目录中章节标题：四号黑体
\renewcommand{\cftchapfont}{\zihao{4}\heiti}
\renewcommand{\cftchappagefont}{\zihao{4}\heiti}

% 目录中其他内容：小四号宋体
\renewcommand{\cftsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsecpagefont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecpagefont}{\zihao{-4}\songti}

% 插图目录
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\cftfigfont}{\zihao{-4}\songti}
\renewcommand{\cftfigpagefont}{\zihao{-4}\songti}

% 表格目录
\renewcommand{\listtablename}{表格目录}
\renewcommand{\cfttabfont}{\zihao{-4}\songti}
\renewcommand{\cfttabpagefont}{\zihao{-4}\songti}

\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftnodots}{\cftdotsep}   % 使用点指示页数

\addtolength{\cftchapnumwidth}{3\ccwd}
\newcommand\mybold[1]{\textit{\textbf{#1}}}

% chinese title is built in
\newcommand\ctitle[1]{\def\@ctitle{#1}}
\newcommand\etitle[1]{\def\@etitle{#1}} % declare variables to store info
\newcommand\cauthor[1]{\def\@cauthor{#1}} % author name in cover
\newcommand\eauthor[1]{\def\@eauthor{#1}}
\newcommand\studentid[1]{\def\@studentid{#1}}
\newcommand\cschool[1]{\def\@cschool{#1}}
\newcommand\cmajor[1]{\def\@cmajor{#1}}
\newcommand\emajor[1]{\def\@emajor{#1}}
\newcommand\cmentor[1]{\def\@cmentor{#1}}
\newcommand\ementor[1]{\def\@ementor{#1}}
\newcommand\ckeywords[1]{\def\@ckeywords{#1}}
\newcommand\ekeywords[1]{\def\@ekeywords{#1}}
\newcommand\cabstract[1]{\def\@cabstract{#1}}
\newcommand\eabstract[1]{\def\@eabstract{#1}}

\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newtheoremstyle{dotless}{3pt}{3pt}{\normalfont}{}{\bfseries}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{{定理}}[chapter]
\newtheorem{proposition}{{命题}}[chapter]
\newtheorem{lemma}{{引理}}[chapter]
\newtheorem{corollary}{{推论}}[chapter]
\newtheorem{definition}{{定义}}[chapter]
\newtheorem{remark}{{注记}}[chapter]
\newtheorem{eg}{例}[chapter]

\renewcommand{\proofname}{{\heiti 证明}}
\renewcommand{\notesname}{{\zihao{-5}\heiti 注释：\hfill}}
%\renewcommand{\bibname}{{\zihao{-5}\heiti 参考文献：}}
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    #1]\gnorespaces
}{
  \popQED\endtrivlist\@endpefalse
}

% 参考文献引用标记格式：右上角，带方括号
\usepackage[square,super]{natbib}

\renewcommand\maketitle {
  \begin{titlepage}
    \begin{center}
      \includegraphics[width=10cm]{image/logo} \\
      \songti
      \vspace{\baselineskip}
      \zihao{-0}\textbf{本科生毕业论文（设计）} \\
      \zihao{-2}\textbf{\textrm{Undergraduate Graduation Thesis（Design）}} \\
      \vspace{2\baselineskip}

      \zihao{3}\textbf{\@title}
      \vspace{2\baselineskip}

      {\fontsize{15}{10}\selectfont
      \begin{tabular}{l}
        \makebox[4.8cm]{院\hspace{2\ccwd}系:} \underline{\makebox[15em]{\hfill\@cschool\hfill}} \\
        \makebox[4.8cm]{School (Department)} \\
        \vspace{8pt} \\

        \makebox[4.8cm]{专\hspace{2\ccwd}业:} \underline{\makebox[15em]{\hfill\@cmajor\hfill}} \\
        \makebox[4.8cm]{Major} \\
        \vspace{8pt} \\

        \makebox[4.8cm]{学生姓名:} \underline{\makebox[15em]{\hfill\@cauthor\hfill}} \\
        \makebox[4.8cm]{Student Name} \\
        \vspace{8pt} \\

        \makebox[4.8cm]{学\hspace{2\ccwd}号:} \underline{\makebox[15em]{\hfill\@studentid\hfill}} \\
        \makebox[4.8cm]{Student No.} \\
        \vspace{8pt} \\

        \makebox[4.8cm]{指导教师(职 称):} \underline{\makebox[15em]{\hfill\@cmentor\hfill}} \\
        \makebox[4.8cm]{Supervisor (Title)} \\
      \end{tabular}
      }
      \vfill

      \zihao{-3}
      {\centering
        时间: \today    % 使用最后一次编译的日期, 实现日期的自动化
      }
    \end{center}
  \end{titlepage}
}

\newcommand\makedisclaim{
  \ctexset {
    chapter = {
      titleformat = {\zihao{-2}\fangsong\bfseries},
      beforeskip = {10pt},
      afterskip = {40pt}
    }
  }
  \input{docs/disclaim}
  \thispagestyle{empty}
  \clearpage
}

% 中文摘要、关键字标题：5号黑体并加方括号
% 中文摘要、关键字内容：5号楷体
\newcommand\makecabstract{
  \ctexset{
    section = {
      titleformat = {\zihao{4}\heiti},
      beforeskip = {10pt},
      afterskip = {20pt}
    }
  }

  % 使用隐藏目录项的section及添加为chapter形式目录的方法来去掉在openright环境中中英文摘要间出现空白页的情况
  \section*{摘\hspace{\ccwd}要}
  \addcontentsline{toc}{chapter}{摘\hspace{\ccwd}要}

  \zihao{5}\kaishu
  %\paragraph{\zihao{5}\heiti\textbf{[摘\hspace{\ccwd}要]}}
  \@cabstract
  \paragraph{\zihao{5}\heiti[关键词]}\@ckeywords
}

% 英文摘要、关键字标题：小四号新罗马体(Time New Roman)加粗并加方括号
% 英文摘要、关键字内容：小四号新罗马体(Time New Roman)
\newcommand\makeeabstract{
  \ctexset{
    section = {
      titleformat = {\zihao{4}\bfseries},
      beforeskip = {10pt},
      afterskip = {20pt}
    }
  }

  \section*{ABSTRACT}
  \addcontentsline{toc}{chapter}{ABSTRACT}

  \zihao{-4}
  %\paragraph{\textbf{[Abstract]}}
  \@eabstract
  \paragraph{\textbf{[Keywords]}}\@ekeywords
}

\newcommand\makeabstract{
  \setcounter{page}{1}
  \makecabstract
  \clearpage

  \makeeabstract
  \thispagestyle{eAbstract}
  \clearpage
  %\cleardoublepage
}

\newcommand\makelistoffiguretable{
  \clearpage
  \listoffigures
  \listoftables
  \thispagestyle{listoffiguretable}
  \cleardoublepage
}

\renewcommand\mainmatter{
  \@mainmattertrue
  \pagenumbering{arabic}
  \ctexset {
    chapter = {
      beforeskip = {10pt},
      afterskip = {20pt},
      nameformat = {\zihao{4}\heiti},
      titleformat = {\zihao{4}\heiti}
    },
    section = {
      format = {},
      nameformat = {\zihao{4}\heiti},
      titleformat = {\zihao{4}\heiti}
    },
    subsection = {
      format = {},
      nameformat = {\zihao{4}\heiti},
      titleformat = {\zihao{4}\heiti}
    },
		subsubsection = {
      format = {},
      nameformat = {\zihao{4}\heiti},
      titleformat = {\zihao{4}\heiti}
    }
  }

  \zihao{-4}\songti \linespread{1.5}\selectfont
}

\renewcommand\backmatter{
  \@mainmatterfalse
  \fancypagestyle{plain}{ \fancyhead[R]{\zihao{-5} \leftmark} }
  \pagestyle{plain}
}

\renewcommand\appendix{\par
  \@mainmattertrue
  \fancypagestyle{plain}{
    \fancyfoot{}
    \fancyhead[R]{\zihao{-5} 附录\thechapter \leftmark}
  }
  \pagestyle{plain}
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \gdef\@chapapp{\appendixname}
  \gdef\thechapter{\@Alph\c@chapter}
  \gdef\CTEX@prechapter{\CTEX@preappendix}
  \gdef\CTEX@thechapter{\CTEX@appendix@number}
  \gdef\CTEX@postchapter{}
  \ctexset {
    chapter = {
      format = {\centering},
      nameformat = {\zihao{4}\heiti},
      titleformat = {\zihao{4}\heiti},
    },
    section = {
      format = {\centering},
      nameformat = {\zihao{4}\heiti},
      titleformat = {\zihao{4}\heiti}
    },
    subsection = {
      format = {\centering},
      nameformat = {\zihao{4}\heiti},
      titleformat = {\zihao{4}\heiti}
    }
  }
}

% 配置超链接。
% hyperref一般要求是导言区最后一个宏包，才能正常工作
\RequirePackage[bottom]{footmisc}
\RequirePackage{setspace}
\RequirePackage[hidelinks, hyperfootnotes=true]{hyperref}
\RequirePackage{footnotebackref}

\xeCJKsetcharclass{`①}{`⑩}{1}
  \renewcommand{\@fnsymbol}[1]{
    \ifcase#1\or \text{①}\or \text{②}\or \text{③}\or  \text{④}\or \text{⑤}\or \text{⑥}\or \text{⑦}\or \text{⑧} \or \text{⑨} \or \text{⑩} \else\@ctrerr\fi}
\renewcommand{\theendnote}{\fnsymbol{endnote}}
