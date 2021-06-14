
# Guide to creating a package (promise/warning: involves cats)
# Berry Boessenkool, 2017-2021, berry-b@gmx.de
# https://github.com/brry/course#slides       View this script at bit.ly/packdev


# Pro-Tip: Turn on Rstudio document outline with CTRL + SHIFT + O 


# Step 0: get needed packages ----

install_if_needed <- function(p) if(!requireNamespace(p, quietly=TRUE)) 
                                   install.packages(p)
install_if_needed("devtools")
install_if_needed("roxygen2")
install_if_needed("berryFunctions")
install_if_needed("praise")



# Step 0.5: github repo ----
browseURL("https://github.com/new")  
# or: on "+" in top-right select "New repository"
# - Name that reflects this is to learn writing R packages
# - initialize with readme

browseURL("https://bookdown.org/brry/course/git.html#use-git")
# - On the green field "Code": copy URL
# - Rstudio - file - new project - version control - git: paste url and create



# Step 1: create package structure ----

# setwd("..") # if you cloned from github and rstudio set the wd to package dir
usethis::create_package("myCatPack")
# open the myCatPack.Rproj file with Rstudio (normally happens automatically)
# re-open this file there for easiest usage



# Step 2: check whether package is correct ----

devtools::check()
# Open DESCRIPTION file (easy via "Files" pane in Rstudio, default bottom right)
# Change to   Version: 0.0.1
# Change to   License: GPL (>=2)
# Add         Date: 2017-08-04       if you like
# in real life, change the other information too, but we're good for now ;-)
devtools::check() # should now be empty
# Package structure is now set up, let's add a function



# Step 3: add functions ----

# using the neatly named cat function (concatenate and type) to create a file:
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

# now open the file in the R folder (again, using the Rstudio "Files" pane)



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
library("myCatPack")
?meow
meow("Elephant")


# That's basically it!
# The following optional things will make your life better.



### Depend on other packages properly ----

# In the meow function, after message, add
praise::praise("You are doing a ${adjective} job ${creating} your first ${rpackage}!")
# and in the documentation section (recommended somewhere around @export), add
#' @importFrom praise praise

# In the DESCRIPTION file, add       Imports: praise
# Now run:
devtools::check()
# Now the NAMESPACE file is updated accordingly by roxygen2



### Improve documentation routines ----

# It is good for readability to keep the argument description close to argument list!
# To create a complete roxygen structure, I prefer to use
berryFunctions::createFun("roar", open=FALSE)
devtools::document()
devtools::install()
?roar
devtools::check()
# In the future, the R package documentation system may be changed!
# https://www.r-consortium.org/blog/2016/08/22/the-r-consortium-funds-three-projects-in-july
# There are several projects, I find this a promising one:
# http://r-posts.com/adding-sinew-to-roxygen2-skeletons/



### Develop an efficient workflow ----

# For developing and testing code use
load_all(".") # CTRL + SHIFT + L
# which is faster than install() + library(), but temporary.
# Also, doc links are not clickable and generating docs may fail altogether.

# CTRL + SHIFT + F10 to restart R
# Recommended Rstudio settings: Tools - Global Options - General
#   OFF: Restore .Rdata into workspace at startup
#   Save workspace to .RData on exit: NEVER

check() # very often

# write unit tests (see Hadley's book referenced below)

# For sorting "folders first" in the Rstudio File panel, 
# click twice on the unnamed field left of "Name".



### Always load devtools ----

# Two options: globally or for package project

# Rprofile.site globally, see its help and my (German) page about it
?Rprofile.site # https://rclickhandbuch.wordpress.com/install-r/rprofile/

# locally:
cat("\nlibrary(devtools)\n", file=".Rprofile", append=TRUE)
# on Linux, only the local .Rprofile is executed if available (no longer the global)

# CTRL + SHIFT + F10 to restart R
document() # this is now quicker to type without devtools:: prepended



### Read books and tutorials ----

# Hadley Wickham (2015): "R packages" is a must-read!!!
# http://r-pkgs.had.co.nz/

# some more good intros are linked here
# https://github.com/brry/misc#package-development-with-rstudio-and-github
