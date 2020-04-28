Jump to [slides](#slides), [install](#install), [settings](#settings), [packages](#packages), [sumatra](#sumatra), [resources](#resources)

Find info about the fall 2018 course at Potsdam university [here](https://github.com/brry/course/blob/master/uni.md).

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
  * R on **Windows**: <https://cloud.r-project.org/bin/windows/base/release.htm> (update through [installr](https://github.com/talgalili/installr/blob/master/README.md))
  * R on **Mac**: follow e.g. these instructions: https://www.r-bloggers.com/installing-r-on-os-x
  * R on **Linux Ubuntu**: See instructions below  
* **Rstudio on all platforms**: https://www.rstudio.com/products/rstudio/download/#Desk


**Installing R on Linux Ubuntu** so that `sudo apt upgrade` updates to the latest R version if outdated 
(idea from [Kris Eberwein](https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus) and [Dean Attali](https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04)):  
Open a terminal (CTRL+ALT+T) and paste (CTRL+SHIFT+V) the following lines.  
Replace `xenial` with e.g. `trusty` if you have another Ubuntu version (check in shell with `lsb_release -a`  ):  
18.10 cosmic-cran35, 18.04 bionic-cran35, 16.04 xenial, 14.04 trusty

<pre>
sudo echo "deb https://cloud.r-project.org/bin/linux/ubuntu <b>xenial</b>/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev
</pre>
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


### git

- Create a github account at <https://github.com/join>
- Download and install git, see <https://git-scm.com/downloads>
- Connect git to Rstudio: (up to `git config user.name` (with images at <https://www.r-bloggers.com/rstudio-and-github>)
  - RStudio -> Tools -> Version Control: select Git.
  - RStudio -> Tools -> Global Options -> Git/SVN: Ensure the path to the Git executable is correct.
  - `Create RSA Key`, close window
  - `View public key`: copy the displayed public key
  - go to <https://github.com/settings/keys> and click `New SSH key`, paste the public key
  - RStudio -> Tools -> Shell: type the following:
```
git version # just to see git works fine
git config --global user.email "YourEmail@domain.com"
git config --global user.name "YourUserNameHere"
```

  

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

