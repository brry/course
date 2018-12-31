This page describes the course "introduction to programming with R" at Potsdam University, fall 2018. 
It is held by Berry Boessenkool, Geoecology graduate and freelance R trainer.

Jump to [content](#content), [organization](#organization), [registration](#registration), [curriculum](#curriculum), [homework](#homework), [admission](#admission)


### content

This course provides an introduction to the free and flexible R software. 
Participants will mainly work with hands-on exercises using geoecological data sets for sample analyses. 


### organization

The course ist split into two consecutive parts.
Part 1 is mandatory for students in "Numerik und Simulation".
Part 2 is specifically for PhD-students in NatRisckChange.
Both parts are open to all participants, though seats are prioritized by these groups.

**Part 1** (1 ECTS) takes place in 4 sessions during the first half of the semester, 
starting October 23 (2nd week of semester). See the schedule below for session-specific content. 
It will be necessary to complete [homework](#homework) exercises taking about 1-4 hours per week.  
There will be two time slots (each with the same content):

* tuesdays, 08:15-11:45, campus Golm, house 25, room D0.02 (moved to ground floor)
* wednesdays, 08:15-11:45, campus Golm, house 1, PC pool room 0.02.


**Part 2** (2 ECTS) will be held as a two-stage block course, each on two consecutive days, for a total of four days.
They are Jan 15+16 (Tue+Wed) and Jan 21+22 (Mon+Tue), 2019.  
A **solid basic R knowledge** (as taught in part 1) is needed for this part!
Please take the admission test [below](#admission) and [send me](mailto:berry-b@gmx.de) the results.
You can also still vote for [topics](https://goo.gl/forms/pnRmow5epSpMs2wI2).


The course language will be German or English, depending on the participants.  
You're welcome to bring your own laptop, but it needs to be with working [WiFi](http://www.zeik.uni-potsdam.de/wlan.html) and 
recent [R and Rstudio](https://github.com/brry/course#install). Power sockets are available.


### registration 
Please register per [email](mailto:berry-b@gmx.de), [PULS](https://puls.uni-potsdam.de/qisserver/rds?state=verpublish&publishContainer=lectureContainer&publishid=69945) 
or [moodle](https://moodle2.uni-potsdam.de/course/view.php?id=17994).
If you already know the basics from the first sessions, you can join later 
(please let me know via email from which session on).


### curriculum
**Part 1**

- 2018-10-23/24: one-session-intro: how and why use R, read files, select data and display it graphically
- 2018-10-30: explore Rstudio, read data, get to know data and object types (**tuesday session only**)
- 2018-11-06/07: use if-else conditionals, program for-loops
- 2018-11-13/14: write functions, program apply-loops

Details of the contents can be found in the course [slides](https://github.com/brry/course#slides)

**Part 2** will be specified with the participants. Potential topics include

- write and debug complicated functions
- manage NAs, merge data
- export publication-ready graphics
- visualize data - Exploratory Data Analysis (EDA)
- statistics, distributions & co
- aggregate time series (including changing charstrings to date/time objects)
- read and plot netcdf files (the standard of large spatio-temporal data)
- R as GIS: read shapefile, plot + edit interactively, export as html (sf, mapview, mapedit)
- use Rstudio effectively (keyboard shortcuts, rskey, project management, document outline, ...)
- reproducible report generation with rmarkdown and knitr
- use lapply like a pro
- apply functions to arrays (elegant coding)
- develop an R package
- version control with Rstudio, git & github
- extreme value statistics
- ... 


### homework

You can send me your part 1 homework solutions if you want comments.
Aditionally, we'll take time at the beginning of each session for homework questions.

**Session 1**

- if not done: install [R and Rstudio](https://github.com/brry/course#install) at home
- print a ref card: [base](https://www.rstudio.com/wp-content/uploads/2016/09/r-cheat-sheet-1.pdf) and
 [advanced](https://www.rstudio.com/wp-content/uploads/2016/02/advancedR.pdf) cheatsheets from
 [Rstudio](https://www.rstudio.com/resources/cheatsheets); 
 RefCards originally by Tom Short from
 [Stein](https://github.com/jonasstein/R-Reference-Card/raw/master/R-refcard.pdf) (recommended),
 [Baggot](https://cran.r-project.org/doc/contrib/Baggott-refcard-v2.pdf),
 [Tanbakuchi](http://www.u.arizona.edu/~kuchi/Courses/MAT167/Files/R-refcard.pdf) or
 [cuni](http://atrey.karlin.mff.cuni.cz/~morf/vyuka/pas/materialy/R-refcard.pdf) 
- Complete all unfinished exercises from the [slides](https://github.com/brry/course#slides) in chapter 1 (One-Session-Intro), especially ex 7

Check your knowledge with the following tasks. Pseudo-Code is fine, als long as the syntax is correct. 
This is for real life, not school, so feel free to use any source of help and inspiration ;-)

- What program do we use to access R and what is typically in the four panels?
- Assign a vector with the names of some friends (character strings!) to an object with a useful name.
- Return all values of that vector except for the second.
- What is the easiest way to open the help documentation of a command?
- In a project handling several files, where, why and how do you use `setwd()`?
- Read the data in the imaginary file `Wolf_Observations.txt` into R.
- What are the two important functions to check whether it was read correctly?
- Code two ways to select a column from a `data.frame`.
- Get all the data in the 6th and 8th row of a df.
- How would you plot the wolf pack size over the distance from the coast?
- With which arguments to `plot()` would you make the graph more informative and appealing?

**Session 2**

- How do you read a file into R where columns are tab-separated and the decimal marker is German?
- How do you send several lines of code to R (with one keyboard shortcut)?
- How do you execute a complete script?
- Explain the object types vector, data.frame, matrix
- What data types do you know?
- Complete all unfinished exercises (nr 9-12)
- Update your RefCard: mark all the items you learned about today
- How can you get `tab[x==7, "ColName"]` in `$` notation?
- From the [Rstudio keyboard shortcuts](https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts), choose a few that seem useful to you and try them out. Prepare to tell your classmates about them next week.

Check your knowledge with the following task. Pseudo-Code is fine.

- Set your working directory to `D:\Thesis`.
- Inside the folder `data` is the textfile `ponds`. Read it into R. The first row contains the column names.
- Overwriting the object, only keep the first 100 rows and the columns B, A and G (in this order).
- Convert column G to character strings.
- Inspect the distribution of the values in column A visually.
- Graph B dependent on A in a scatterplot.

Bonus task with real data

- Download this [data set](https://github.com/brry/course/blob/master/data/Potsdam.txt) (rightclick on `Raw`, then `Save target as`) with monthly weather records for Potsdam, obtained through [rdwd](https://github.com/brry/rdwd#rdwd).
- The metadata is available in the DESCRIPTION and BESCHREIBUNG files at the [DWD Data server](http://bit.ly/dwdmonthlymeta) at <ftp://ftp-cdc.dwd.de/pub/CDC/observations_germany/climate/monthly/kl/historical>
- Visually compare wind speed and rainfall.
- Visualize the distribution of sunshine duration.
- Get the average temperature of months with more than 90 mm rainfall.


**Session 3**

- What is the expected output of `1+7 > 3` ?
- What is the expected output of `1+ (7 > 3)` ?
- If the object `checksum` is larger than or equal to 6, a message should be displayed informing the user about this.
- The message should only be displayed if the value of 'inform' is also TRUE.
- For a vector `v`, pass the values above 1 to `log()`, smaller values should be replaced with 1. Use conditional code execution.
- use the `replace` function instead.
- What is syntaxically wrong with the following code?  
`if(out)  {   output <- rnorm(50) ; return(output)  }    else    plot(x,y) ; title(main="Caption")`
- What real-life usage of conditional code execution can you imagine?

A loop with real data

- Download and read this [data set](https://github.com/brry/course/blob/master/data/stocks.txt) (rightclick on `Raw`, then `Save target as`).
- Plot the Apple stocks over date as a line graph.
- Bonus0: With `as.Date`, first convert the character string (or factor, if the default `read.table(..., stringsAsFactors=TRUE)` was used).
- With a `for` loop, add all other companies in the same plot
- BONUS1: First create a vector with 6 different colors, then use that in the for loop to color the lines
- BONUS2: Add a legend with the same colors
- BONUS3: label the lines directly
- BONUS4: Use a logarithmic axis, enhanced with `berryFunctions::logAxis`
- (The solution is in the slides in chapter `course plan` right before session 4/4)


**Session 4**

- Fill out the feedback form at <https://bit.ly/feedbackR>
- Work through <http://r4ds.had.co.nz/functions.html>



### admission

Part 2 of the course is aimed at intermediate R programmers. 
You will only be able to gain much from the course if you can solve this (hopefully real-worldly) exercise.
**If you have significant trouble with this kind of coding, the workshop pace will be too fast for you!** (In which case you should wait out for the next "Intro to R" course).

**Aim**: Obtain certain columns from many files, merge those into a single data.frame.  
**Data**: Daily weather observations from 100 gauges across Germany of the last year and a half.  
**Needed R skills**: file management, reading and subsetting data, writing simple functions, looping code, basic line plotting

**Step 1**: Note the current time to later report how much time you needed (without BONUS tasks).  
**Step 2**: Download and unzip [`admission.zip`](https://github.com/brry/course/raw/master/data/admission.zip)
into some directory (BONUS: use R code to do both). Read `meta.txt` and `columns.txt`. 
Get a vector of filenames using `dir()` (with `full.names=TRUE`).  Exclude `meta.txt` and `columns.txt`.  
**Step 3**: Write a function that takes a single file name as input and performs the following:  
*(Hint: step by step during development, check the `str()` output of your function reading the first file.
Ensure the final output is a data.frame with a character and a numeric column.)*

- Read the file (correctly).
- Select the columns `MESS_DATUM` and `TMK` (see German explanation in meta file `columns.txt`). 
Assume the column order may not always be the same, hence avoid indexing with integer positions.
- Change the temperature column name ("TMK") to the gauge ID number in the filename (e.g. use `nchar()` and `substr()`).
BONUS: use the gauge name by matching with `meta.txt`.
- As output, `return()` the reduced dataset with the renamed column.

**Step 4**: Create a single list object with the output for all the files.
There should be an error for one single file, see below. 
I strongly recommend to use `lapply()`. BONUS: display a progress bar (e.g. with `pbapply::pblapply()`).  
I intentionally introduced a wrong date column name in one of the files. 
Make sure your reading function throws an informative error for such a case. 
Manually fix the column name in the altered file and run your code again.  
**Step 5**: Merge the list elements into a single data.frame using `Reduce()` and `merge()` like below:
```R
SOME_LIST_WITH_DFS <- list(
 data.frame(date=1:4, AA=11:14),
 data.frame(date=2:6, BB=22:26),
 data.frame(date=3:7, CC=33:37)
)
SOME_LIST_WITH_DFS
Reduce(function(...) merge(..., all=TRUE), SOME_LIST_WITH_DFS)
```
**Step 6**:  Change the `MESS_DATUM` data type to `Date`. Plot the time series for some station. BONUS: With a `for` loop, add lines for all stations.  
**Step 7**: [Report](mailto:berry-b@gmx.de) the time you needed to solve this task 
(estimate without BONUS time). Ask questions if you like. 
Optionally, give me feedback: is this task suited for an admission test? Any improvement ideas?  
**Step 8**: BONUS: After all the coding, let's get to to contentually interesting part.
Which is the hottest of the gauges by average (or max) temperature? What gauge has the smallest temparature range?
Using the `meta.txt` information, perform a geographical analysis of recent temperatures in Germany, e.g. create a map, animate a time series map, interpolate temperatures onto a grid with kriging, ...  

If you want to work with much more weather data, check out [rdwd](https://github.com/brry/rdwd#rdwd), which I also used to create this dataset, see [admission_data.R](https://github.com/brry/course/blob/master/data/admission_data.R).
