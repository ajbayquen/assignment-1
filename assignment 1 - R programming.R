#Question 1
fac12 <- function(x)
{ 
  if (x <= 1) 
  { 
    return(1) 
  } else
    return(x*fac12(x-1)) 
}

#Question 2
vec1<-seq(20,50,5)

#Question 3
qroots <- function(a,b,c)
{ 
  if (a==0)
  { print("This is a linear function. The root is:")
    return(-c/b)  } 
  if (b^2 < 4*a*c)
  {  print ("There are no real roots for this function.")
    return (c(NA,NA)) 
  }
  print ("The 2 roots for this quadratic function are:")
  return(c(((-b + sqrt(b^2 - 4*a*c))/(2*a)),
         ((-b - sqrt(b^2 - 4*a*c))/(2*a)))) 
}   
 