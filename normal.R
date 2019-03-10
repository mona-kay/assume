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
                  print(paste0(x," is highly positively skewed, with a skewness of ",
                               skew)),
                  ifelse(skew <= -1,
                         print(paste0(x," is highly negatively skewed, with a skewness of ",
                                      skew)),
                         ifelse(skew > -1 & skew <= -.5,
                                print(paste0(x," is moderately negatively skewed, with a skewness of ",
                                             skew)),
                                ifelse(skew < 1 & skew >= .5,
                                       print(paste0(x," is moderately positively skewed, with a skewness of ",
                                                    skew)),
                                       print(paste0(x, " is not skewed."))
                                  )
                           )
                    )
             )
      )
    }
}
