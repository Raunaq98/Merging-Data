directory<- getwd()
destfile1<- paste(directory,"/reviews.csv",sep="")
destfile2<- paste(directory,"/solutions.csv",sep="")

URL1 <- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
URL2<-  "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"

download.file(URL1,destfile1,method = "curl")
download.file(URL2,destfile2, method = "curl" )

reviews <- read.csv(paste0(directory,"/reviews.csv"),as.is = TRUE,header = TRUE)
solutions <- read.csv(paste0(directory,"/solutions.csv"),as.is = TRUE,header = TRUE)


head(reviews)
#   id solution_id reviewer_id      start       stop time_left accept
#1  1           3          27 1304095698 1304095758      1754      1
#2  2           4          22 1304095188 1304095206      2306      1
#3  3           5          28 1304095276 1304095320      2192      1
#4  4           1          26 1304095267 1304095423      2089      1
#5  5          10          29 1304095456 1304095469      2043      1
#6  6           2          29 1304095471 1304095513      1999      1

head(solutions)
#  id problem_id subject_id      start       stop time_left answer
#1  1        156         29 1304095119 1304095169      2343      B
#2  2        269         25 1304095119 1304095183      2329      C
#3  3         34         22 1304095127 1304095146      2366      C
#4  4         19         23 1304095127 1304095150      2362      D
#5  5        605         26 1304095127 1304095167      2345      A
#6  6        384         27 1304095131 1304095270      2242      C

names(reviews)
# [1] "id"          "solution_id" "reviewer_id" "start"       "stop"        "time_left"   "accept"     

names(solutions)
# [1] "id"         "problem_id" "subject_id" "start"      "stop"       "time_left"  "answer"    


#we can merge the two datasets by linking "solution_id" from reviews dataset
# and "id" from solutions dataset.

merged_data <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(merged_data)

#  solution_id id  reviewer_id    start.x     stop.x    time_left.x accept problem_id subject_id    start.y     stop.y  time_left.y  answer
#1      1       4          26  1304095267   1304095423      2089      1        156         29     1304095119 1304095169        2343    B
#2      2       6          29  1304095471   1304095513      1999      1        269         25     1304095119 1304095183        2329    C
#3      3       1          27  1304095698   1304095758      1754      1         34         22     1304095127 1304095146        2366    C
#4      4       2          22  1304095188   1304095206      2306      1         19         23     1304095127 1304095150        2362    D
#5      5       3          28  1304095276   1304095320      2192      1        605         26     1304095127 1304095167        2345    A
#36     6      16          22  1304095303   1304095471      2041      1        384         27     1304095131 1304095270        2242    C