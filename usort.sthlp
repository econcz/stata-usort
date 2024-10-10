{smcl}
{* *! version 1.0.0  07oct2024}{...}
{viewerjumpto "Examples" "summarizeby##examples"}{...}
{title:Title}

{phang}
{bf:usort} {hline 2} perform a {helpb gsort} and add a sort flag

{marker examples}{...}
{title:Examples}

        {cmd:. sysuse auto, clear}

        * simple example, collect all statistics returned by summarize
        {cmd:. usort +mpg -price}

{title:Author}

{pstd}
{bf:Ilya Bolotov}
{break}Prague University of Economics and Business
{break}Prague, Czech Republic
{break}{browse "mailto:ilya.bolotov@vse.cz":ilya.bolotov@vse.cz}

{pstd}
    Thanks for citing this software and my works on the topic:

{p 8 8 2}
Bolotov, I. (2024). USORT: Stata module to add a sort flag after performing 
    gsort. Available from
    {browse "https://ideas.repec.org/c/boc/bocode/[to be announced].html"}.
