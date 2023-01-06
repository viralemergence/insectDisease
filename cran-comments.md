### Version 1.2.2

### R CMD check results 

No errors. This is a minor update to a function documentation that relied on a web resource. It did not fail gracefully. I tried a non-solution before, which was not a good idea, but have now added some `try` statements to identify if the web service is down, and it errors our more gracefully now. Not sure if it's 100% the right way to do it, so I'll keep reading up on how others handle these situations. 

```
Status: OK
```


### Downstream dependencies

There are no downstream dependencies
