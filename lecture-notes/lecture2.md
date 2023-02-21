# Best computing practices
See [Wilson, et al 2014](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745)

1. Write programs for people, not computers
2. Let the computer do the work (functions, scripts)
3. Make incremental changes (use version control)
4. Don’t repeat yourself (or others): no copy-paste!
5. Plan for mistakes (add assersions to programs, code defensively)
6. Optimize software only after it works correctly
7. Document design and purpose, not mechanics
8. Collaborate (github pull requests/issues)


## Organization of projects

This section is inspired by Karl Broman's notes.

![](http://www.phdcomics.com/comics/archive/phd052810s.gif)

- Put everything in a common directory. If using RStudio, for example, create a new project which will contain all the files corresponding to this project. You can link this project to a github repository (see below)
- Separate raw from processed data; it is tempting to hand-edit datafiles: **don't!**
- Separate code from data
- Don't use absolute paths
- Use readme and markdown (`md`) files to explain structure of folder and files within folder/subfolders; create logfiles as a "Dear diary" with details of analyses. See this [Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- Use R Markdown (`Rmd`) files for data analyses and reports. See this [R Markdown tutorial](https://bookdown.org/yihui/rmarkdown/)
- Slow down and think about file/folder organization

Convention on naming files (very important for globbing to narrow file listing):

- Avoid spaces, punctuation, accented characters, case sensitivity
- Deliberate use of delimiters
- Name contains info on content
- Put something numeric first (left pad numbers with zeros)
- Use the ISO 8601 standard for dates: YYYY-MM-DD

## Write clear code

This section is inspired by Karl Broman's notes.

![](https://geekandpoke.typepad.com/geekandpoke/images/2008/02/04/aop1b.jpg)

- First code that works, then efficiency
- Readable for humans; code format: indentation, white space, meaningful names
- Modular, reusable (no copy-paste of lines: functions)
- Write general code (not specific to data/situation at hand)
- No global variables ever!
- Comment code but mostly big picture, major sections, input/output, not minor details that can be understood from the code itself; "plan to spend 1/4 time commenting", Karl Broman
- Meaningful error messages; tests/checks for inputs; document assumptions on input 
  - Statistics: rows=individuals, columns=variables
  - Machine learning: rows=variables, columns=individuals
- Code defensively; handle cases that "can't happen"
- Slow down, breathe, don't be in a hurry!

## Data Organization in spreadsheets

[(Broman and Woo, 2017)](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375989)

1. Be consistent
  - Don't use female/male and F/M in the same file
2. Choose good names for things
  - No spaces in column names (or anywhere)
  - Avoid special characters
3. Write dates as YYYY-MM-DD
4. No empty cells
5. Put just one thing in a cell
6. Make it a rectangle
7. Create a data dictionary
8. No calculations in raw data files
9. Don't use font color or highlighting as data
  - The file should be machine-readable, not human readable
10. Save data as texfiles
