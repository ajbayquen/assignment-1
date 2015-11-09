# Problem 1

a <- (1:6)
arr1 <- array(c(a+1,a+2,a+3,a+4,a+5,a+6), dim=c(6,6))

P.a <- 0
k <- 0
n <- 9
for (i in (1:6)) {
  for (j in (1:6)) {
      if (arr1[i,j] >= n) {
         k <- k + 1
         P.a <- k/36 
      }
  }
}
P.a

P.b <- 0
k <- 0
n <- 7
for (i in (1:6)) {
  for (j in (1:6)) {
    if (arr1[i,j] == n) {
      k <- k + 1
      P.b <- k/36
    }
  }
}
P.b


# Problem 2
# 4 black pieces, 2 striped pieces, 6 dotted pieces
# 48 possible orders
4*2*6
# 12 total pieces
4+2+6
#P(dotted) selected successively with replacement
(6/12)*(6/12)
#P(dotblack) selected black then dotted with replacement
(4/12)*(6/12)
#P(blackstripped) selected black then stripped with replacement
(4/12)*(2/12)

#Problem 3
#random deck of card
#P(ace or king)
(4/52)+(4/52)-0
#(red card or black card)
(26/52)+(26/52)-0

#Problem 4
#Most likely number of wins
#compute for the mean N*pi = 36
.45*80
#compute for the mean and variance
b.mean <- .45*80
b.mean
b.variance <- 80*.45*(1-.55)
b.variance 

#Problem 5
#Coin flipped 9 times
#probability of getting 6 heads
dbinom(6,9,0.5)


#Problem 6
#Susan and Jessica playing a card game
#Susan wins 60% of the time; 
#Probability that Jessica won more games than Susan
1 - pbinom(5,9,0.6)


#Problem 7
#Flip coin 3 times (N)
#head on only one of the flips
dbinom(1,3,0.5)
#head on at least 1 flip
pbinom(0,3,0.5,lower.tail = FALSE)


#Problem 8
#Bayes Theorem
#P(D|T)=((P(T|D)*P(D))/(P(T|D)*P(D)+P(T|D')*P(D')))
# D = you have the disease, T = you tested positive for the disease
#P(D|T) = probability that you have the disease given that you test positive
#       = posterior probability 
#P(T|D') = probability that you test positive positive and you don't have the 
#        = disease (false positive)
#P(T|D) = probability that you test positive given that you have the disease
#       = prior probability
#P(D) = probability of the disease in the population
#P(D') = probability of not having the disease in the population
P.TD <- 0.95
P.TDN <- 0.06
P.D <- 0.03
P.DN <- 0.97
P.DT <- (P.TD*P.D)/(P.TD*P.D+P.TDN*P.DN)
P.DT


#Problem 9
#jar contains 10 blue, 5 red, 4 green and 1 yellow marbles
# 20 total marbles
10+5+4+1
#P(green and red) = P(green) * P(red given green)
P.green <-  4/20
P.red.gv.green <- 5/19
P.green.a.red <- P.green * P.red.gv.green
P.green.a.red

#P(red and green) = P(red) * P(green given red)
P.red <- 5/20
P.green.gv.red <- 4/19
P.red.a.green <- P.red * P.green.gv.red
P.red.a.green

P.red.green <- P.green.a.red + P.red.a.green + 0
P.red.green

#P(blue and yellow) = P(blue) * P(yellow given blue)
P.blue <-  10/20
P.yellow.gv.blue <- 1/19
P.blue.a.yellow <- P.blue * P.yellow.gv.blue
P.blue.a.yellow

#P(yellow and blue) = P(yellow) * P(blue given yellow)
P.yellow <- 1/20
P.blue.gv.yellow <- 10/19
P.yellow.a.blue <- P.yellow * P.blue.gv.yellow
P.yellow.a.blue

P.blue.yellow <- P.blue.a.yellow + P.yellow.a.blue + 0
P.blue.yellow


#Problem 10
#probability of rolling a 6 after getting a 6 in the last five rolls
#Gambler's fallacy
P.a10 <- 1/6
P.a10

#Problem 11
#die game - win when you roll a 2 or a 5
#probability of winning = 2/6
#size =60

# probability of winning between 5 and 10 times inclusive
pbinom(10,60,2/6) - pbinom(5,60,2/6) + dbinom(5,60,2/6)

# probability that you win at least 15 times
pbinom(15,60,2/6,lower.tail = FALSE)

#probabilty that you win at least 40 times
pbinom(40,60,2/6,lower.tail = FALSE)

#most likely number of wins (mean)
60*(2/6)

#probabilty that you win 20 times(mean)
dbinom(20,60,2/6)


#12 Getting a hit in a baseball game

#Tommy gets a hit 30% of the time in a game
#Joey gets a hit 25% of the time in a game
#Probability that Tommy or Joey will get a hit but not both
P.Tom <- 0.30
P.Joe <- 0.25
P.Tom.or.Joe <- P.Tom + P.Joe - P.Tom * P.Joe
P.Tom.or.Joe

#Probability that neither Tommy or Joe will get a hit
P.not.Tom.Joe <- (1 - P.Tom) * (1 - P.Joe)
P.not.Tom.Joe

#Probability that both Tommy or Joe will get a hit
P.Tom.and.Joe <- P.Tom * P.Joe
P.Tom.and.Joe

#Problem 13
#unfair coin coming up heads 65% of the time
#Probability it will come up heads 25 times or fewer in 50 tries

pbinom(25,50,0.65)

#Problem 14
#drawing 2 cards from a deck (no replacement)
#both of them are face cards
#conditional probality P(F) = 12/52, P(F|F) = 11/51
P.F.F <- (12/52)*(11/51)
P.F.F

#conditional probabilty P(H) = 13/52, P(H|H) = 12/51
P.H.H <- (13/52)*(12/51)
P.H.H


#Problem 15
#Gambler's Fallacy
#coin flip will always have a probabity of 0.5
P.a15 <- FALSE

    