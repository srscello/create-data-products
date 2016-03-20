---
title       : EarthQuest Tool for Exploring Data in R About Our Planet
subtitle    : 
author      : Steven Strand
job         : Data Science Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

# Data Sets in R of Interest

* LakeHuron
  * Annual measurements of the level, in feet, of Lake Huron 1875–1972
* Sunspot.year
  * Yearly numbers of sunspots from 1700 to 1988 (rounded to one digit).

--- .class #id 

# LakeHuron

```r
plot(LakeHuron)
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)

--- .class #id 

# Sunspot.year

```r
plot(sunspot.year)
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

--- .class #id 

# Connecting the Datasets

* Use an interactive tool to explore data on the same time scale
* Explore interactions between datasets
* Find out whether data are correlated, find a model & the significance level