
                                            # View this script at bit.ly/packdev

# Guide to creating a package (promise/warning: involves cats)
# Berry Boessenkool, 2017-2022, https://brry.github.io

# Pro-Tip: Turn on Rstudio document outline with CTRL + SHIFT + O 


# 0: prepare ----

# Get the packages needed for this tutorial:
if(!requireNamespace("pacman", quietly=TRUE)) install.packages("pacman")
pacman::p_load(devtools, roxygen2, berryFunctions, praise)

# If wanted, start with a github repo for version control:
browseURL("https://github.com/new")  
# or manually click on "+" in top-right select "New repository"
# - choose a name that reflects this is to learn writing R packages
# - initialize with readme
browseURL("https://bookdown.org/brry/course/git.html#use-git")



# 1: create ----

# If you cloned from github and rstudio set the wd to package dir, first run:
# setwd("..") 
# Create the package structure:
usethis::create_package("myCatPack")
# Open the myCatPack.Rproj file with Rstudio (normally happens automatically).
# For easiest usage, re-open this file (packdev.R) in that project.



# 2: check ----

# Check whether everything in the package is correct:
devtools::check()
# Open DESCRIPTION file (easy via "Files" pane in Rstudio, default bottom right)
# Change to   Version: 0.0.1
# Change to   License: GPL (>=2)     or whatever you choose
# Add         Date: 2017-08-04       if you like
# in real life, change the other information too, but we're good for now ;-)
devtools::check() # should now be empty



# 3: write ----

# Add a function to the package.
# Use the neatly named cat function (concatenate and type) to create a file:
cat(' 
meow <- function(
 animal,
 good=TRUE
 )
 {
 message("Fact of the day: ", animal, "s are ", 
         if(good) "awesome" else "ugly", "!")
 }
', file="R/meow.R")

# Open the file in the R folder, using the Rstudio "Files" pane or with
file.show("R/meow.R")



# 4: document ----

# In that file, put the cursor inside the function or argument list and click
# Code - Insert Roxygen skeleton (CTRL + ALT + SHIFT + R)
# Edit the newly created top of the file. It could look like the following:

#' Message animal status
#' @param animal Character string with animal name.
#' @param good   Logical: do you think this is a good animal? DEFAULT: TRUE
#' @return No return value, but message to the console.
#' @export
#' @examples
#' meow("cat")
#' meow("mosquito", good=FALSE)

devtools::document() # through roxygen2, writes NAMESPACE and man/meow.Rd
# Check out the Rd file - roxygen is the best thing since sliced bread!

# You can also call
devtools::check() # this will run document() first



# 5: install  ----

# Install the package on your computer for later usage in any project:
devtools::install()
library("myCatPack")
?meow
meow("Elephant")


# That's basically it! 
# You can now develop an R package :)
# The following things build on this and will make your life better.


# Bonus ==== ----


# 6. depend ----

# Depend on other packages properly.
# In the meow function, after `message`, add
praise::praise("You are doing a ${adjective} job ${creating} your first ${rpackage}!")
# and in the documentation section (recommended somewhere around @export), add
#' @importFrom praise praise

# In the DESCRIPTION file, add       Imports: praise
# Now run:
devtools::check()
# The NAMESPACE file is updated accordingly by roxygen2.



# 7. docs 2.0 ----

# Improve documentation routines for code readability.
# It is good to keep the argument description close to argument list.
# To create a complete roxygen structure, I prefer to use
berryFunctions::createFun("roar", open=FALSE)
devtools::document()
devtools::install()
# To avoid the error .../library/myCatPack/R/myCatPack.rdb' is corrupt,
# restart R with STRG + SHIFT + F10 (or Click Session - Restart R), then run:
library(myCatPack)
?roar
devtools::check()
# In the future, the R package documentation system may be changed!
# https://www.r-consortium.org/blog/2016/08/22/the-r-consortium-funds-three-projects-in-july
# There are several projects, I find this a promising one:
# http://r-posts.com/adding-sinew-to-roxygen2-skeletons/



# 8. work ----

# Work efficiently. Here are a few tips and tricks.

# For developing and testing code use
devtools::load_all(".") # CTRL + SHIFT + L
# which is faster than install() + library(), but temporary.
# Also, doc links are not clickable and generating docs may fail altogether.

# Restart R regularly with CTRL + SHIFT + F10.
# Recommended Rstudio settings: Tools - Global Options - General
#   OFF: Restore .Rdata into workspace at startup
#   Save workspace to .RData on exit: NEVER

devtools::check() # check very often when developing a package

# To sort folders first in the Rstudio File panel, click twice on the field left of "Name".

# Always load devtools. Either locally for this package (R project):
cat("\nlibrary(devtools)\n", file=".Rprofile", append=TRUE)
# or globally for all Rstudio projects and instances, see
?Rprofile.site 
# Only the local .Rprofile is executed if it is available (no longer the global).
document() # this is now quicker to type without devtools:: prepended

remove.packages("myCatPack") # to undo devtools::install()



# 9. test ----

# Code changes in your package shouldn't break things. unit tests help with that.
usethis::use_testthat()
usethis::use_test("meow")
cat('
test_that("meow tells the right message", {
 expect_message(meow("Panda"), "Fact of the day: Pandas are awesome!")
 expect_message(meow("Rat", FALSE), "Fact of the day: Rats are ugly!")
 })
', file="tests/testthat/test-meow.R", append=TRUE)
devtools::test()
 


# 10. read ----

# Read books and tutorials, Hadley Wickham (2015): "R packages" is a must-read!!!
browseURL("http://r-pkgs.had.co.nz/")
# some more intros are linked here:
browseURL("https://github.com/brry/misc#package-development-with-rstudio-and-github")

# Have fun developing R packages!
