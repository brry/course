### slides

Here are the slides I use for R courses in several versions:

* [handout](https://github.com/brry/course/raw/master/RcourseBerry.pdf) (one pdf page per slide)
* [presentation](https://github.com/brry/course/raw/master/RcourseBerry%20pres.pdf)
(animated with LaTeX \\onslide et al.)
* [source code](https://github.com/brry/course/raw/master/RcourseBerry.Rnw) (.Rnw, I suggest rightclick - save as)

You can [download all datasets](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/brry/course/tree/master/data) or the [complete repository](https://github.com/brry/course/archive/master.zip) at once.


### install
install R and Rstudio:

* R: https://cloud.r-project.org (Linux Ubuntu instructions below)
* Rstudio: https://www.rstudio.com/products/rstudio/download/#Desk
* updating R on Windows is simple: https://github.com/talgalili/installr/blob/master/README.md
* R installation on Ubuntu (from [Kris Eberwein](https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus) and [Dean Attali](https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04)): open a terminal (CTRL+ALT+T) and paste (CTRL+SHIFT+V) the following lines:

```
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev
```
Replace `xenial` with e.g. `trusty` if you have another Ubuntu version:  
17.04 zesty, 16.10 yakkety, 16.04 xenial, 14.04 trusty, 12.04 precise

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
