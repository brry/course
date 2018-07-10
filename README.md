Jump to [slides](#slides), [install](#install), [settings](#settings), [packages](#packages), [sumatra](#sumatra), [resources](#resources), [uni](#uni)

### slides

Here are the slides I use for R courses in several versions:

* [handout](https://github.com/brry/course/raw/master/RcourseBerry.pdf) (one pdf page per slide)
* [presentation](https://github.com/brry/course/raw/master/RcourseBerry%20pres.pdf)
(animated with LaTeX \\onslide et al.)
* [source code](https://github.com/brry/course/raw/master/RcourseBerry.Rnw) (.Rnw, I suggest rightclick - save as)

You can [download all datasets](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/brry/course/tree/master/data) or the [complete repository](https://github.com/brry/course/archive/master.zip) at once.  
The presentation template is available through
`berryFunctions::`[`createPres`](https://www.rdocumentation.org/packages/berryFunctions/topics/createPres?).


### install
First install R itself and then Rstudio:

* R itself
  * R on **Windows**: *windows -> base -> download* at https://cloud.r-project.org (update through [installr](https://github.com/talgalili/installr/blob/master/README.md))
  * R on **Mac**: follow e.g. these instructions: https://www.r-bloggers.com/installing-r-on-os-x
  * R on **Linux Ubuntu**: See instructions below  
* **Rstudio on all platforms**: https://www.rstudio.com/products/rstudio/download/#Desk


**Installing R on Linux Ubuntu** so that `sudo apt upgrade` updates to the latest R version if outdated 
(idea from [Kris Eberwein](https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus) and [Dean Attali](https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04)):  
Open a terminal (CTRL+ALT+T) and paste (CTRL+SHIFT+V) the following lines.  
Replace `xenial` with e.g. `trusty` if you have another Ubuntu version (check in shell with `lsb_release -a`  ):  
18.04 bionic-cran35, 17.10 artful, 16.04 xenial, 14.04 trusty

```
sudo echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev
```
In case you run into GPG problems like the example below, try replacing both gpg lines with the single line 
([idea source](https://superuser.com/questions/620765/sudo-apt-key-adv-keyserver-keyserver-ubuntu-com-recv-7f0ceb10-command-return)):
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E084DAB9
```

*gpg: requesting key E084DAB9 from hkp server keyserver.ubuntu.com
?: keyserver.ubuntu.com: No route to host
gpgkeys: HTTP fetch error 7: couldn't connect: No route to host
gpg: no valid OpenPGP data found.
gpg: Total number processed: 0
gpg: keyserver communications error: keyserver unreachable
gpg: keyserver communications error: public key not found
gpg: keyserver receive failed: public key not found*


### settings

Suggested Rstudio settings (for reproducibility and compatibility):

- Tools - Global Options - General
    - **ON**: Restore previously open source documents at startup  
    - **OFF**: Restore .Rdata into workspace at startup  
    - Save workspace to .RData on exit: **NEVER**  
Instead use `save(object, file="object.Rdata")` after long computations.  
You can load them later with `load("object.Rdata")`.
- Tools - Global Options - Code - Display
    - **ON**: Show margin (Margin column:80)  *People hate horizontal scrolling!*
    - **ON**: Highlight R function calls
- Tools - Global Options - Code - Saving
    - Line ending conversion: **Windows (CR/LF)**
    - Default Text Encoding: **UTF-8**
- Tools - Global Options - Code - Completion - Completion Delay
    - Show completions after characters entered: **2**
    - Show completions after keyboard idle (ms): **0**
- Tools - Global Options - Sweave
    - Weave Rnw files using: **knitr**
- Tools - Modify Keyboard Shortcuts
    - remove `CTRL+Y` from the command "paste last yank" (if you want it to mean "redo" as in other programs)
    - Set Working Directory to Current Document's Directory: `CTRL + H`


### packages

Installing add-on R packages usually is easy from within R (and works without admin rights):
```R
install.packages("ggplot2")
```
On Linux, some packages with external dependencies (like rJava) can be more difficult.
In such cases, you probably just want to open a terminal (CTRL+ALT+T) and paste (CTRL+SHIFT+V) `sudo apt-get install r-cran-rjava` (all lower-cased). 
Here's the [official information](https://cran.r-project.org/bin/linux/ubuntu/README.html#supported-packages) on this topic.

Installing the `sf` package for spatial data is a bit tricky on Linux because it needs a recent version of gdal. 
If `install.packages("sf")` does not work, please try the following:
```
sudo apt-get install libudunits2-dev
sudo add-apt-repository ppa:ubuntugis/ppa && sudo apt-get update
sudo apt-get install gdal-bin
sudo apt install libgdal-dev libproj-dev
```


### sumatra

I like to use sumatra PDF viewer as the default viewer. 
It doesn't lock files from editing, hence currently opened files can be changed (by R, e.g.).
It comes in `Rstudio/bin/sumatra` and I like to change some [settings](https://www.sumatrapdfreader.org/settings.html):  
open `Rstudio/bin/sumatra/sumatrapdfrestrict.ini` and set `SavePreferences = 1`  
open and close a pdf, so that `Rstudio/bin/sumatra/SumatraPDF-settings.txt` will be created  
now change the following entries:

* `DefaultZoom = fit page` (probably already the default)
* `ShowToc = 0`
* `DefaultDisplayMode = single page`


### resources

* [R-weekly](https://rweekly.org/) - weekly newsletter about all things R
* [Rbloggers](https://www.r-bloggers.com/) - blog aggregator about R
* [Shiny](https://shiny.rstudio.com/) - web application framework for R/Rstudio
* [Rmarkdown](http://rmarkdown.rstudio.com/) - document/notebook generation framework for R/Rstudio
* [Github guides](https://guides.github.com/) - Introduction to github


### online tutorials
* http://stat545.com/topics.html (excellent tutorial)
* https://www.edx.org/course/introduction-r-programming-microsoft-dat204x-0 (Datacamp, with login, but free)
* http://tryr.codeschool.com/levels/1/challenges/1 (codeschool, interactive, login to save progress)


### uni

This section provides information on the course "introduction to programming with R" at Potsdam University, fall 2017. 

#### content

This course provides an introduction to the free and flexible R software. 
Participants will mainly work with hands-on exercises using geoecological data sets for sample analyses. 
R is a well-established programming environment used in areas as statistics, 
data analysis and visualization as well as machine learning. 
Companies like Microsoft, Amazon and Google use R for market analysis, 
researchers worldwide enjoy the benefits of structured and reproducible scientific work.

#### organization

The course takes place in 7 three-hour sessions during the first half of the semester.
There are two options, both on campus Golm:

* tuesdays, 12:15-15:15, house 25, room D0.02, main language English
* wednesdays, 12:15-15:15, house 1, PC Pool (guest account provided), mainly German

Each participant of the tuesday course must already have a 
[PC-pool account](https://www.chem.uni-potsdam.de/groups/pools/Studierende/studierende.html) 
or bring a laptop with [WiFi](http://www.zeik.uni-potsdam.de/wlan.html), 
recent R and Rstudio (see section [install](#install) above). 
It will be necessary to complete homework exercises taking about 1-4 hours per week. 

#### registration 
Please register per [email](mailto:berry-b@gmx.de) or via the 
[moodle course](https://moodle2.uni-potsdam.de/course/view.php?id=14800).
Students in the Geoecology module "numeric and simulation" will be enrolled first, 
remaining seats assigned by registration date. 
If you already know the basics from the first sessions, you can join later 
(please let us know via email from which session on).

#### planned session curriculum
- 2017-10-17: one-session-intro: how and why use R, read files, select data and display it graphically
- 2017-10-24: consolidate the contents of the first session, manage NAs, merge data
- *2017-10-31: Reformation day - official holiday, time to relax*
- 2017-11-07: export publication-ready graphics, use if-else conditionals
- 2017-11-14: program loops (for loops, apply functions)
- 2017-11-21: write and debug functions

Tue 11-28, House 25, Pool D0.02

- visualize data - Exploratory Data Analysis (EDA)
- test a sample distribution for normality
- use the beta distribution  OR  understand Simpsons Paradox (with regression)

Wed 11-29, House 1, PC pool

- aggregate time series (including changing charstrings to date/time objects)
- read and plot netcdf files (the standard of large spatio-temporal data)

Wed 12-06, House 1, PC pool

- realize that R is WAAAY cooler than ArcGIS: read shapefile, plot + edit interactively, export as html (sf, mapview, mapedit)
- work reproducibly - project management with Rstudio
- use Rstudio effectively (keyboard shortcuts, rskey, document outline, ...)

Wed 12-13, House 1, PC pool

- use lapply like a pro
- apply functions to arrays (freaking elegant coding)
- debug functions
- develop an R package
- ... your topic here ...

Details in section [slides](#slides)

See also: [overview of moodle courses in geoecology](https://moodle2.uni-potsdam.de/course/index.php?categoryid=1079) 