#Chapter 7

#problem 1
# mean=35 sd=10, percent of scores -
# a. greater than 34.
z <- (34-35)/10
z
pnorm(z,0,1,lower.tail=FALSE)

# b. smaller than 42
z <- (42-35)/10
z
pnorm(z,0,1)

# c. between 28 and 34
y <- (28-35)/10
z <- (34-35)/10
pnorm(z)-pnorm(y)


#problem 2
# a. mean = 0 and standard deviation = 1
# b. mean = 75 and standard deviation = 8

#problem 3
# normal distribution defined by -
# a. mean
# b. standard deviation

#problem 4
# a. within 1 standard deviation
pnorm(1) -pnorm(-1)
# b. more than 2 standard deviations
pnorm(2) -pnorm(-2)
# c. begtween 1.25 and 2.1 standard deviations
pnorm(2.1)-pnorm(1.25)


#problem 5
#a) 85th percentile
qnorm(0.85,70,8)
#b) 22nd percentile
qnorm(0.22,70,8)


#problem 6
qnorm(0.175,70,12)
qnorm(0.675,70,12)


#problem 7
z.a <- (28-20)/4
z.b <- (18-20)/4
z.c <- (10-20)/4
z.d <- (23-20)/4
z.a
z.b
z.c
z.d

#problem 8
#a
pnorm(65,71,8)
#b
pnorm(50,71,8)
#c
qnorm(.90,71,8)
#d
#There are a lot more speeders than people who drive too slowly skewing the curve 
# to left.


#problem 9
pnorm(127,120,5, lower.tail = FALSE)


#problem 10
#a. first find the mean and standard deviation
#mu <- N * pi, var <- N*pi*(1-pi), sd <-sqrt(var)
mu <- 12 * 0.5
var <- 12*0.5*0.5
sd <- var^0.5
#b. find the z value
z <- (7-mu)/sd
#c. use the PDF for the standard normal distribution to find the probability
dnorm(z)




#Chapter 9

#problem 6 
z.prime.p <- 0.5 * log((1+0.6)/(1-0.6))
z.prime.s <- 0.5 * log((1+0.65)/(1-0.65))
se <- 1/(28-3)^0.5
pnorm(z.prime.s,z.prime.p,se, lower.tail = FALSE)


#problem 7
# a normal curve close to curve given by the mean and standard deviation of the 
# sample distribution of the mean


#problem 8
#mean = 20; sd = 10; var = 10^2 = 100
#variance of the sum 
vs <- sqrt(200)
pnorm(5,0,vs, lower.tail = FALSE)

#problem 9
#It is negatively skewed because r cannot exceed avalue greater than 1.0
#The higher the correlation number, the more will the graph be negatively skewed 


#problem 10
dnorm(0.5)


#problem 11
#N= 12, Mean = 120; SD = 5
pnorm(127,120,5/2, lower.tail = FALSE)

#problem 12
# r=0.3; N=84; 
#probabilty correlation < 0.10
r=0.10
z.prime.s = 0.5 * log((1+r)/(1-r))
r=0.30
z.prime.p = 0.5 * log((1+r)/(1-r))
se = 1/sqrt(84-3)
pnorm(z.prime.s,z.prime.p,se)

#probability correlation > 0.25
r=0.25
z.prime.s = 0.5 * log((1+r)/(1-r))
r=0.30
z.prime.p = 0.5 * log((1+r)/(1-r))
se = 1/sqrt(84-3)
pnorm(z.prime.s,z.prime.p,se,lower.tail = FALSE)


#problem 13
mu.gpa.a <- 3.0
mu.gpa.b <- 2.8
se <- 0.25
N <- 9

mu.diff <- mu.gpa.a - mu.gpa.b
se.diff <- sqrt((2*se^2)/N)
pnorm(0.5,mu.diff,se.diff, lower.tail = FALSE)
pnorm(0,mu.diff,se.diff, lower.tail = FALSE)

#problem 14
# 70% prefer candidate A, N=30
N <- 30
# a. mean of the sampling distribution of p
mu.p <- 0.7
# b. what is the standard error of p
se <- sqrt((mu.p*(1-mu.p))/N)
# c. what is the probability that 80% or more of this sample will prefer
#    candidate A?
pnorm(0.8,mu.p,se)

#problem 15
#r is a not a normal distribution
