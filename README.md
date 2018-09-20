# Convolution Package 
This package performs a convolution analysis that could be used to estimate people's delay at work. The first assumption is that the firm gains 1 euro for each minute of delay. 

It performs the analysis using two different approaches:
- Functional programming 
- For loop

The two approaches reach basically the same results with the only difference of the method utilised. 
The distribution used is a poisson distribution, as we cannot have a delay that is less than 0 (this could be obtained if we use a normal distribution).

After having calculated the poisson distribution and set the parameters, the function analyses the severity of the delay according to the rate of delay (25 minutes, 30 minutes, etc). The parameter lambda inputs the number of times a person is late. N is the number the analysis is repeated while p is the confidence in the results. Changing the p will modify the VAR (value at risk) and the unexpected scarcity in turn (mean - VAR). 

The mean of delay is subtracted to the Value at Risk which is a measure that quantifies the level of risk of a firm. In this case, the fact of hiring a person that in the past year has committed a given number of delays. This also quantifies eventual losses for the firms. 
If the var severity is 1000, the company is risking that amount of money, while the unexpected severity measures the amount of money that a person has to pay the firm in case of delay. 
The job of the firm will be to analyse the balance between these two factors and, if deciding to hire that person, take into account the salary. 

