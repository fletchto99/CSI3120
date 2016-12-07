# CSI 3120 Assignment 4 Solution
# Student Name: Matt Langlois
# Student Number: 7731813
# Student Email: mlang025@uottawa.ca

# Part 1

#Save to predictedSales for future use
predictedSales <- data.frame(
			month 		= c('Air Conditioners', 'Home Appliances', 'Toys'),
            January 	= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            February 	= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            March 		= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            April 		= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            May 		= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))), 
            June 		= c(rpois(1, lambda = 30), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            July 		= c(rpois(1, lambda = 45), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))), 
            August 		= c(rpois(1, lambda = 50), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            September 	= c(rpois(1, lambda = 30), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            October 	= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = rnorm(1, 30, sd = 3))),
            November 	= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = sample(100:200, 1))),
            December 	= c(rpois(1, lambda = 5), rpois(1, lambda = sample(10:40, 1)), rpois(1, lambda = sample(300:400, 1)))
)

#Print out the prediction
print("Predicted Sales are:")
print(predictedSales)

# Part 2

# Our monthly initial stocks
initialSales <- data.frame(
			month 		= c('Air Conditioners', 'Home Appliances', 'Toys'),
            January 	= c(10, 40, 40),
            February 	= c(10, 40, 40),
            March 		= c(10, 40, 40),
            April 		= c(10, 40, 40),
            May 		= c(10, 40, 40), 
            June 		= c(30, 40, 40),
            July 		= c(50, 40, 40), 
            August 		= c(50, 40, 40),
            September 	= c(30, 40, 40),
            October 	= c(10, 40, 40),
            November 	= c(10, 40, 400),
            December 	= c(10, 40, 400)
)

# Take the initial stock and remove the predictions
expected <-data.frame(
	initialSales[2:13] - predictedSales[2:13]
)

#remove all items where stock is below 0
expected[expected < 0] <- 0

result <- data.frame(
	month 		= c('Air Conditioners', 'Home Appliances', 'Toys'),
	expected
)

print("The expected stock at the end of each month is:")
print(result)

# Part 3

