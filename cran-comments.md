### R CMD check results 

This package is a new submission.

During CRAN checks, some issues were found.

```

Please always make sure to reset to user's options(), working directory or par() after you changed it in examples and vignettes and demos. -> inst/doc/dataManip.R
e.g.:
oldpar <- par(mar=c(4,4,0.5,0.5))
...
par(oldpar)
-> You need to set oldpar <- par(mar=c(4,4,0.5,0.5)) before you use par() the first time. So, now you have par(mar=c(4,4,0.5,0.5)) the firest time in line 45, this should already be oldpar <- par(mar=c(4,4,0.5,0.5))

Please add small executable examples in your Rd-files to illustrate the use of the exported function but also enable automatic testing.

Please fix and resubmit.

Best,
Victoria Wimmer 
```

All of these issues have been addressed, and we thank Benjamin Altmann and Victoria Wimmer for helpful comments.




```
Status: OK
```

None. 



### Downstream dependencies

There are no downstream dependencies
