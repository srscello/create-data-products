EarthQuest Tool
========================================================
author: Steven Strand
date: 3/19/2015

EarthQuest Tool
========================================================
* View Time Series DataSets in R Base
* Interactively view correlations


Data Sets in R of Interest
========================================================

* LakeHuron
  * Annual measurements of the level, in feet, of Lake Huron 1875–1972
* Sunspot.year
  * Yearly numbers of sunspots from 1700 to 1988 (rounded to one digit).

LakeHuron
========================================================

```r
plot(LakeHuron)
```

![plot of chunk unnamed-chunk-1](index3-figure/unnamed-chunk-1-1.png)

Sunspot.year
========================================================

```r
plot(sunspot.year)
```

![plot of chunk unnamed-chunk-2](index3-figure/unnamed-chunk-2-1.png)

Connecting the Datasets
========================================================

* Use an interactive tool to explore data on the same time scale
* Explore interactions between datasets
* Find out whether data are correlated, find a model & the significance level