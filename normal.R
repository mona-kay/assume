# Test the normality of numeric columns
normal <- function(df) {
  for (x in colnames(data.frame(df))) {
    if(class(df[[x]]) == "numeric") {
      l <- length(df[[x]])
      m <- mean(df[[x]], na.rm = TRUE)
      s1 <- sum((df[[x]]-m)^3, na.rm = TRUE)
      s2 <- sum((df[[x]]-m)^2, na.rm = TRUE)
      skew <- (s1/l)/(s2/l)^(3/2)
      skew <- round(skew, digits = 2)
    } else {}
    ifelse(class(df[[x]]) != "numeric", df[[x]],
           ifelse(skew >= 1,
                  print(paste0(x," is highly positively skewed (",
                               skew, "). Recommend a log10(x+1) transformation.")),
                  ifelse(skew <= -1,
                         print(paste0(x," is highly negatively skewed (",
                                      skew, "). Recommend a log10(k-x) transformation.")),
                         ifelse(skew > -1 & skew <= -.5,
                                print(paste0(x," is moderately negatively skewed (",
                                             skew, "). Recommend a sqrt(k-x) transformation.")),
                                ifelse(skew < 1 & skew >= .5,
                                       print(paste0(x," is moderately positively skewed (",
                                                    skew, "). Recommend a sqrt(x) transformation.")),
                                       print(paste0(x, " is not skewed (", skew, ")."))
                                  )
                           )
                    )
             )
      )
    }
}
