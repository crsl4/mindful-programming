---
title: "From mindful programming to reproducible research"
author: "Claudia Solis-Lemus"
date: "2019-11-2"
output:
  html_document:
    keep_md: true
---

# shameless copy from
Cecile Ane class https://github.com/cecileane/computingtools
Jenny Bryan Happy git with R https://happygitwithr.com/
Karl Broman tools4rr http://kbroman.org/Tools4RR/
UW software carpentry https://uw-madison-datascience.github.io/2019-06-13-uwmadison-swc/

# why do we care about best practices and reproducibility?
- your closest collaborator is you six months ago, and you do not reply to emails (Karl Broman)
- everything via code -> avoid embarrassment, save time, avoid mistakes
- The most important tool is the mindset, when starting, that the end product will be reproducible (Keith Baggerly)
- assume that everything that you, you will need to redo at some point in the future: be paranoid and prepared

# best practices
link to wilson 2014: https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745
1. Write programs for people, not computers
2. Let the computer do the work (functions, scripts)
3. Make incremental changes (use version control)
4. Don’t repeat yourself (or others): no copy-paste!
5. Plan for mistakes (add assersions to programs, code defensively)
6. Optimize software only after it works correctly
7. Document design and purpose, not mechanics
8. Collaborate (github pull requests/issues)


# organization of projects (stolen from karl broman)
- put everything in a common directory. If using RStudio, for example, create a new project which will contain all the files corresponding to this project. You can link this project to a gthub repository (see below)
- separate raw from processed data
  - it is tempting to hand-edit the files: don't!
- separate code from data
- don't use absolute paths
- use readme/md files to explain structure of folder and files within folder/subfolders; treat as a "Dear diary". markdown cheatsheet: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
- use Rmd files for data analyses and reports: https://bookdown.org/yihui/rmarkdown/
- slow down and document

# write clear code (stolen from karl broman)
https://geekandpoke.typepad.com/geekandpoke/2008/02/the-art-of-prog.html
- first code that works, then efficiency
- readable for humans; code format: indentation, white space, meaningful names
- modular, reusable (no copy-paste of lines: functions)
- write general code (not specific to data/situation at hand)
- no global variables ever
- comment big picture, major sections, input/output, not minor details of functions; plan to spend 1/4 time commenting (karl broman)
- meaningful error messages; tests/checks for inputs; document assumptions on input (rows vs columns)
- code defensively (handle cases that "can't happen")
- slow down, breathe, don't be in a hurry!


# git

## why version control git/github?
- image of the final doc: http://phdcomics.com/comics/archive_print.php?comicid=1531
- image https://xkcd.com/1597/ https://imgs.xkcd.com/comics/git.png
- history of changes, time travel, peace of mind about breaking stuff:
Using a Git commit is like using anchors and other protection when climbing. If you’re crossing a dangerous rock face you want to make sure you’ve used protection to catch you if you fall. Commits play a similar role: if you make a mistake, you can’t fall past the previous commit. Coding without commits is like free-climbing: you can travel much faster in the short-term, but in the long-term the chances of catastrophic failure are high! Like rock climbing protection, you want to be judicious in your use of commits. Committing too frequently will slow your progress; use more commits when you’re in uncertain or dangerous territory. Commits are also helpful to others, because they show your journey, not just the destination. (R Packages, Hadley Wickham (Wickham (2015)))
- collaborating with others
- image of example repo, history, commit
- more reading: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1007142


## installation
- register for github account https://happygitwithr.com/github-acct.html think about username!
- install/update R and Rstudio: https://happygitwithr.com/install-r-rstudio.html
- install git: https://happygitwithr.com/install-git.html
- git config: https://happygitwithr.com/hello-git.html

## git basics
the order can change, but this is perhaps the easiest order.
1. Create a github repository
2. git clone the github repository into a local folder in your computer
3. Make it an RStudio project (optional, mostly for R projects)
4. Make local changes, git add, git commit, git push

### Example
1. Create a github repository
click the green “New” button.
Repository name: myProject (or whatever you wish)
Public
YES Initialize this repository with a README

2. git clone
```
pwd ## make sure you are in the right place
git clone https://github.com/YOU/myProject.git
```
3. Make it an RStudio project: File > New Project > Version Control > Git and copy https://github.com/YOU/myProject.git

4. Make local changes:
```
cd myProject
open README.md
```
Change the file, then
```
git add .
git commit -m "updated readme"
git push
```

## git commands
```
git status  ## check status of repo
git log     ## log of commits
git log --oneline
git diff    ## compare versions
git pull    ## pull commits from remote (github)
git pull --ff-only  ##pull commits avoiding merge issues
```
### branches
main branch is `master`. New branches are perfect for development of side work or to allow people working in parallel.

create new branch:
```
git branch new-branch
```

change to the new branch:
```
git checkout new-branch
```
here you can make local changes, and they will be made only in that branch.
In my `.bash_profile` file I have to color my prompt (add image).

you should commit (or stash) your work in a branch before switching to a different branch:
```
git commit --all -m "WIP"
git checkout master
```
then you can reset back to the previous commit. this does not affect any of the files:
```
git checkout new-branch
git reset HEAD^
```
you can also choose to reset to a specific commit by typing `git log` first and choosing the specific SHA.

after you've done work on a branch, you can merge to `master`
```
git checkout master
git merge new-branch
```

merging issues: do not panic! breathe and keep in mind that your work is safe and secure by the power of git. `git status` helps you identify the problem. from jenny bryan's website:
```
git status
# On branch master
# You have unmerged paths.
#   (fix conflicts and run "git commit")
# 
# Unmerged paths:
#   (use "git add <file>..." to mark resolution)
# 
#     both modified:      index.html
# 
# no changes added to commit (use "git add" and/or "git commit -a")
```
So this shows only index.html is unmerged and needs to be resolved. We can then open the file to see what lines are in conflict.
```
<<<<<<< HEAD:index.html
<div id="footer">contact : email.support@github.com</div>
=======
<div id="footer">
 please contact us at support@github.com
</div>
>>>>>>> issue-5:index.html
```
In this conflict, the lines between `<<<<<< HEAD:index.html` and `======` are the content from the branch you are currently on. The lines between `=======` and `>>>>>>> issue-5:index.html` are from the feature branch we are merging.

To resolve the conflict, edit this section until it reflects the state you want in the merged result. Pick one version or the other or create a hybrid. Also remove the conflict markers `<<<<<<`, `======` and `>>>>>>`.
```
<div id="footer">
please contact us at email.support@github.com
</div>
```
Now run `git add index.html` and `git commit` to finalize the merge.
keep in mind that you can always abort a merge with `git merge --abort`.

do you think you are prepared to tackle any branch problem? try this example: https://uw-madison-datascience.github.io/git-novice-custom/08-conflict/

### forks
image from jenny bryan.

On GitHub, go to the repo of interest to fork: OWNER/REPO, where OWNER is the user or organization who owns the repository named REPO.
In the upper right hand corner, click Fork.
This creates a copy of REPO in your GitHub account: YOU/REPO.
go over the steps of git basics with this repo.

strongly recommended: work on a branch for changes you do on a forked repo.

image from jenny bryan.

in your repo, you can get:
```
$ git remote -v
origin  https://github.com/YOU/REPO.git (fetch)
origin  https://github.com/YOU/REPO.git (push)
```
you can add the original repo OWNER/REPO` as a remote in your repo:
```
git remote add upstream https://github.com/OWNER/REPO.git
```
then
```
$ git remote -v
origin    https://github.com/YOU/REPO.git (fetch)
origin    https://github.com/YOU/REPO.git (push)
upstream  https://github.com/OWNER/REPO.git (fetch)
upstream  https://github.com/OWNER/REPO.git (push)
```

now you can pull changes from upstream:
```
git pull upstream master --ff-only
```
(see pull issues below)

now, you've done work in your fork, and are ready to create a pull request in github, see here: https://happygitwithr.com/pr-extend.html

### troubleshooting

#### amending commits
basically you want to re-write specific commits. you do some work, and then commit the changes as work-in-progress: `git commit -m "WIP"`. The history looks like `A -- B -- C -- WIP*`. You do not push, because you want to keep working.
You make more changes, and want to re-write the previous commit (WIP): `git commit --amend --no-edit`. The history is the same `A -- B -- C -- WIP*`, but now the changes in WIP correspond to the two previous commits.
Continue working like this, until you are satisfied with the work:
```
git commit --amend -m "awesome changes"
git push
```
Your history – and that on GitHub – look like this:
```
A -- B -- C -- D
```

#### resetting back to previous commits
if you are working on WIP, but you keep getting errors, and problems
```
A -- B -- C -- WIP*
```
you might want to go back to the good state of files, before your changes:
```
git reset --hard
```
which is implicitly the same as
```
git reset --hard HEAD
```
which says: "reset my files to their state at the most recent commit".

#### push/pull issues
```
$ git push
To https://github.com/YOU/REPO.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/YOU/REPO.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
In the abstract, this is the state on GitHub:
```
A -- B -- C (on GitHub)
```
And this is your local state:
```
A -- B -- D (what you have)
```
The easiests thing is to do `git pull` and then work out the merging issues (like with branches):
```
$ git pull
Auto-merging foo.R
CONFLICT (content): Merge conflict in foo.R
Automatic merge failed; fix conflicts and then commit the result.
```
You jyst to go `foo.R` and pick which version you want to keep of the merging conflict, then `git add` and `git commit`.
We’ve achieved this:
```
      Remote: A--B--C

Local before: A--B--D
Local after: A--B--D--(merge commit)
                \_C_/
```

`rebase` is a more elegant way to handle these cases.
```
$ git pull --rebase
First, rewinding head to replay your work on top of it...
Applying: Take max
```
We’ve achieved this:
```
      Remote: A--B--C

Local before: A--B--D
Local after: A--B--C--D
```
The bad news: As with plain vanilla git pull, it is still possible to get merge conflicts with git pull --rebase. If you have multiple local commits, you can even find yourself resolving conflicts over and over, as these commits are sequentially replayed. Hence this is a better fit for more experienced Git users and in situations where conflicts are unlikely (those tend to be correlated, actually).

At this point, if you try to do git pull --rebase and get bogged down in merge conflicts, I recommend git rebase --abort to back out. For now, just pursue a more straightforward strategy.

## practicing with git
see the exercises in jenny bryan website: https://happygitwithr.com/bingo.html, https://happygitwithr.com/burn.html, https://happygitwithr.com/reset.html

# testing code (stolen from karl broman)
types of tests:
Check inputs
– Stop if the inputs aren't as expected.
Unit tests
– For each small function: does it give the right results in
specific cases?
Integration tests
– Check that larger multi-function tasks are working.
Regression tests
– Compare output to saved results, to check that things that
worked continue working


`assertthat` package
```
#' import assertthat
winsorize <-
function(x, q=0.006)
{
if(all(is.na(x)) || is.null(x)) return(x)
assert_that(is.numeric(x))
assert_that(is.number(q), q>=0, q<=1)
lohi <- quantile(x, c(q, 1-q), na.rm=TRUE)
if(diff(lohi) < 0) lohi <- rev(lohi)
x[!is.na(x) & x < lohi[1]] <- lohi[1]
x[!is.na(x) & x > lohi[2]] <- lohi[2]
x
}
```

`testthat` package
```
test_that("winsorize works for small vectors", {
x <- c(2, 3, 7, 9, 6, NA, 5, 8, NA, 0, 4, 1, 10)
result1 <- c(2, 3, 7, 9, 6, NA, 5, 8, NA, 1, 4, 1, 9)
result2 <- c(2, 3, 7, 8, 6, NA, 5, 8, NA, 2, 4, 2, 8)
expect_identical(winsorize(x, 0.1), result1)
expect_identical(winsorize(x, 0.2), result2)
})
```
store tests in `tests/testthat.R`:
```
library(testthat)
test_check("mypkg")
```
turn bugs into tests, don't make same mistake twice
automate tests with Codecov within github: https://codecov.io/


# relax
- enjoy the process, make mistakes (git will catch you), learn as you go
- code with purpose, be present
