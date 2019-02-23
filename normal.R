# Test the normality of numeric columns
normal <- function(df) {
  for (x in colnames(data.frame(df))) {
    l <- length(df[[x]])
    ifelse(class(df[[x]]) != "numeric", df[[x]],
           ifelse((sum((df[[x]]-mean(df[[x]]))^3)/l)/
                    (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2) >= 1,
                  print(paste0(x," is highly positively skewed, with a skewness of ",
                               (sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                 (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2))),
                  ifelse((sum((df[[x]]-mean(df[[x]]))^3)/l)/
                           (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2) <= -1,
                         print(paste0(x," is highly negatively skewed, with a skewness of ",
                                      (sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                        (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2))),
                         ifelse((sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                  (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2) > -1 &
                                  (sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                  (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2) <= -.5,
                                print(paste0(x," is moderately negatively skewed, with a skewness of ",
                                             (sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                               (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2))),
                                ifelse((sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                         (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2) < 1 &
                                         (sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                         (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2) >= .5,
                                       print(paste0(x," is moderately positively skewed, with a skewness of ",
                                                    (sum((df[[x]]-mean(df[[x]]))^3)/l)/
                                                      (sum((df[[x]]-mean(df[[x]]))^2)/l)^(3/2))),
                                       print(paste0(x, " is not skewed."))
                                )
                         )
                  )
           )
    )
  }
}