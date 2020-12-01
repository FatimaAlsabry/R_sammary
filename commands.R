options(max.print=1000000)  #to solve "reached 'max' / getOption("max.print")"
#vectors
c <- 1:6
-(5:20) # negative numbers
seq(1, 20)            
seq(0, 10, by=0.5)            
my_seq<-1:30; length(my_seq)
1:length(my_seq) 
dim(c) <- c(3, 2)

x <- c(a = 1, b = 2, c = 3, d=22.3)
x <- 1:3; names(x) <- c("a", "b","c")
x <- setNames(1:3, c("a", "b", "c"))
names(x) <- NULL
attributes(x)
order(x) #output is the indecies sort
x[order(x)]

#vector example
x <- c(2.1, 4.2, 3.3, 5.4 , NA)
x[c(3, 1)]
x[order(x)]
x[order(x,decreasing = TRUE)]
x[order(x, na.last = TRUE)]
x[c(2.1, 2.9)] ## floor to index 2
x[-c(3, 1)]
x[c(-1, 2)]   #> Error
x[x > 3]
x[c(TRUE, TRUE, FALSE, FALSE)]
x[c(TRUE, FALSE)]
(y <- setNames(x, letters[1:4]))
y[c("d", "c", "a")]


#factors
x <- factor(c("a", "b", "b", "a"))
levels(x)
x <- factor(c("a", "b", "b", "a"),levels = c("a","b","c"))
levels(x)
x[2] <- "c" ##error because it is not a level
sex_char <- c("m", "m", "m")
sex_factor <- factor(sex_char, levels = c("m", "f"))
table(sex_factor)

#loops
rep(0, times = 40)
rep(c(0, 1, 2), times = 10)
rep(c(0, 1, 2), each = 10)

#data frames

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df[df$x == 2, ]
df[df$x >= 2, ]
df[c("x", "z")]
df[, c("x", "z")]
df$z <- NULL
is.data.frame(df)
df[sample(nrow(df), 3), ]
df[sample(nrow(df), 10, rep = T), ]

df <- data.frame(
        x = 1:3,
        y = c("a", "b", "c"),
        stringsAsFactors = FALSE)  #data.frame converts strings into factors.
#Use stringAsFactors = FALSE to suppress this behavior 


grades <- sample(3, 5, rep = T)
info <- data.frame(
        grade = 1:3,
        desc = c("Poor", "Good", "Excellent"),
        fail = c(T, F, F)
)
id <- match(grades, info$grade)
info[id, ]

#lists
x <- list(abc = 1)
x$a
x[["a"]]


#functions
add <- function(x, y) x + y
sapply(1:10, add, 3) #=== sapply(1:10, "+", 3)

x <- list(1:3, 4:9, 10:12)
sapply(x, "[", 2) #===  sapply(x, function(x) x[2])

#csv
data<-read.csv("hw1_data.csv",TRUE,",")
good<-complete.cases(data$Ozone)
length(which(good!=FALSE))
length(which(good==FALSE)) # ====== length(data$Ozone[is.na(data$Ozone)])
which(good!=FALSE) #which returns the index values not the original values 
mean(which(good!=FALSE))
data$Ozone[data$Ozone>40 & !is.na(data$Ozone)]
data[1:2,]
data[152:153,]
names(data)
tail(data)
data$Ozone[47]
mean(data$Ozone[good])

#cleaning and clearing
mtcars[mtcars$cyl == 4 & mtcars$gear == 4, ]
subset(mtcars, cyl == 4 & gear == 4)
subset(mtcars, cyl == 4)
sub = subset(data, Month == 5 & !is.na(Ozone), select = Ozone)
apply(sub, 2, max) #return the max value for each column

(x1 <- 1:10 %% 2 == 0) # () will print the result of x1 directly
(x2 <- which(x1))

range(x) #max and min numbers
unique(c(3, 4, 5, 5, 5, 6, 6)) 


#dplyr
library(dplyr)
select(data, Ozone,Wind,Solar.R)
select(data, 1:4)
select(data, -Ozone)
filter(data, Ozone>=100, Month==8)
filter(data, !is.na(Ozone))
arrange(data, Ozone)  #order Ozone from small to big
arrange(data, desc(Ozone))
mutate(data, new_col = Ozone+Solar.R+2)
mutate(data, new_col1 = Ozone / 2, new_col2 = new_col1 *0.01)
summarize(data,new_name = mean(Temp))
by_col<-group_by(data,Month)
summarize(by_col, mean(Temp))

#tidyr
library(tidyr)



#math
sqrt(1:9) #sqrt can be vector or variable
my_na<-is.na(my_data)
sum(my_na) #sum only the true values


#files
getwd() #determine the current location
ls() #list all local variables
list.files() 
old.dir <- getwd() 
dir.create("testdir") 
setwd("testdir")
file.create("mytest.R")
file.exists("mytest.R")
file.info("mytest.R") # information about the file 
info("mytest.R")$mode #to grab specific items.
file.rename("mytest.R","mytest2.R")
file.remove('mytest.R')
file.copy("mytest2.R","mytest3.R")
file.path("mytest3.R") #it can be file or directory
setwd(old.dir)



#logical
isTRUE(x) 
any()  #return TRUE if one or more of the elements in the logical vector is TRUE. 
all() #return TRUE if every element in the logical vector is TRUE.

#functions
if (is.null(a)) stop("a is null")

paste("Hello", "world!", sep = "_")
paste(1:3, c("X", "Y", "Z"), sep = "")
identical(vect,vect2)
ints <- sample(10) #create a vector of random integers from 1:10 
#complete.cases() #returns vector of logical rows of na values


"%p%" <- function(left, right){ # Remember to add arguments!  
        paste(left, right)
}
'I' %p% 'love' %p% 'R!'

#UCBadmission 
student<-data.frame(name=c("ali","ahmed","arwa"),marks=c(50,77,90),ip_id=1:3)
student %>%
        select(ip_id, name, marks) %>%
        mutate(size_mb = marks / 100) %>%
        filter(size_mb <= 0.8) %>%
        arrange(size_mb) 



#Dates
d1<-Sys.Date() #number of days since 190-1-1
t1 <- Sys.time() #it is POSIXct
t2<-as.POSIXlt(Sys.time())
t2$min
weekdays(d1)
months(t1)
quarters(t2)
t3<-"October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
Sys.time() > t1
Sys.time() - t1
difftime(Sys.time(), t1, units = 'days')

#plotting
vect<-c(10,5,20,15,2,1,4,12)
hist(vect)
plot(vect)
hist(grades,
     height = 15,
     main="bars test",
     sub="sub name",
     horiz=T, #draw horizontal
     ylab="Y axis",
     xlab="X axis",
     col="#cd0200",
     xlim=c(0,12), # X axis limit
     border = NA 
)


#colors
colors() #colors list
barplot(vect)
barplot(vect,col="red3")
barplot(vect,col=rgb(.100, 0, .50))  # values 0 to 1
barplot(vect,col=rgb(200,10,50,max=255)) #values 0 to 255
barplot(vect,col="#cd0000")
palette()
barplot(vect,col=rainbow(7)) #rainbow or heat.colors or terrain.colors or topo.colors or cm.colors
barplot(vect,col=1:6)




