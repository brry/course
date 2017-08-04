
# Guide to creating a package (promise/warning: involves cats)
# Berry Boessenkool, August 2017, berry-b@gmx.de
# https://github.com/brry/course#slides


# Step 0: get needed packages ----

install.packages(c("devtools","roxygen2","berryFunctions"))


# Step 1: create package structure ----

getwd() # setwd("../otherFolder") if you want to create your package elsewhere
devtools::create("catPack")
# now open the catPack.Proj file with Rstudio


# Step 2: check whether package is working ----

devtools::check()
# Open DESCRIPTION file (easy via Files pane in Rstudio, default bottom right)
# Change to   License: GPL (>=2)
# Change to   Version: 0.0.1
# Add         Date: 2017-08-04
devtools::check() # should now be empty
# Package structure is now set up, let's add a function


# Step 3: add functions ----
cat('
meow <- function(
  animal,
  good=TRUE
  )
  {
  message("Fact of the day: ", animal, "s are ", if(good) "awesome" else "ugly", "!")
  }
', file="R/meow.R")

# now open the file in the R folder


# Step 4: document your functions ----

# put the cursor inside the function or argument list and click
# Code - Insert Roxygen skeleton (CTRL + ALT + SHIFT +R)
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
# check out the Rd file - roxygen is the best thing since sliced bread!

# You can also call
devtools::check() # this will run document() first


# Step 5: install the package locally ----
devtools::install()
library("catPack")
?meow
meow("Elephant")

# That's basically it!
# The following things will make your life better.


### Use version control (git + github) ----

# more on this in the course slides (see top of this script)
# If you've done it once before, you'll start with it from the beginning


### Develop an efficient workflow ----

# For developing and testing code use
load_all(".") # CTRL + SHIFT + L
# which is faster than install, but temporary.
# Also, doc links are not clickable and generating docs may fail altogether.

# CTRL + SHIFT + F10 to restart R
# Recommended Rstudio settings: Tools - Global Options - General
#   OFF: Restore .Rdata into workspace at startup
#   Save workspace to .RData on exit: NEVER

check() # very often

# write unit tests (see Hadley's book referenced below)


### Improve documentation routines ----

# It is extremely good for readability to keep the argument description close to argument list!
# to create a complete roxygen structure, I prefer to use
berryFunctions::createFun("roar")
devtools::load_all(".")
?roar
devtools::check()
# In the future, the R package documentation system may be changed!
# https://www.r-consortium.org/blog/2016/08/22/the-r-consortium-funds-three-projects-in-july
# There are several projects, I find this a promising one:
# http://r-posts.com/adding-sinew-to-roxygen2-skeletons/


### Always load devtools ----

# Two options: globally or for package project

# Rprofile.site globally, see help and my (German) page about it
?Rprofile.site # https://rclickhandbuch.wordpress.com/install-r/rprofile/

# locally:
cat("library(devtools)\n", file=".Rprofile")
# CTRL + SHIFT + F10 to restart R
document() # quicker to type without devtools::


### Read books and tutorials ----

# Hadley Wickham (2015): "R packages" is a must-read!!!
# http://r-pkgs.had.co.nz/

# some more good intros are linked here
# https://github.com/brry/misc#package-development-with-rstudio-and-github

