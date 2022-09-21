# MechaCar_Statistical_Analysis
## Project Overview
AutosRUs is prototyping the new product line MechaCar.  Production troubles are hindering the manufacturing progress.  This analysis is to provide insights to potential problems, as well as address future studies to compare MechaCar to other competing manufacturers.

## Linear Regression to Predict MPG
An analysis of 50 prototypes, their MPG ratings, and other statistical measures produces an overall R-squared value of 0.71 and a significantly small p-value.
![D1_MPG_Linear_Regression](https://user-images.githubusercontent.com/106561880/191399042-ce7aa5bf-616e-46e3-bdfd-46b52ce3bade.png)

As seen from the results, there are 3 coefficients that provide a non-random amount of variance to the mpg values in the dataset: the **(Intercept)**, **vehicle_length**, and **ground_clearance**.  The probability of each is exceptionally small, as notated by the negative numbers in the scientific notation (see column Pr(>|t|)).  

It would be extremely difficult to plot the regression, but as seen from the values the slope is not zero.  This can be inferred from the residual and coefficient values.  The minimum residual is -19.47; the maximum is 18.58.  The coefficient values for all metrics are varied.

While the r-squared value and p-value are significant, the relatively small data sample of 50 prototypes may not be enough to effectively predict mpg based on these metrics.  Due to overfitting, there are 3 other metrics that have higher probabilities of being due to random chance: **vehicle_weight**, **spoiler_angle**, and **AWD**.  It may be possible, that with a larger dataset, vehicle_weight may become a significant predictor of mpg, depending on how the Probability value behaves.

## Summary Statistics on Suspension Coils
Another problem area in production is consistency with Suspension Coils across multiple production lots.

A general look below of the summary PSI values at all 3 lots shows there may be issues.  Overall, the variance is within the acceptable range of 100 PSI.  However, there are 3 lots, which may cloud the overall data.  In order to get a better visualization, the data was grouped by each lot.

![D2_Total_Summary](https://user-images.githubusercontent.com/106561880/191399177-89fc865b-c6e8-4da4-9383-623c4980be69.png)

As can be seen through the updated summary below, Lot 1 is performing very well.  The mean and the median match, and the variance is below 1 PSI.  Lot 2 is performing well within standards, but not as well as Lot 1.  Their variance is at 7.47 PSI.  Unfortunately, it appears Lot 3 has some major production issues.  The variance is over 170 PSI.

![D2_Lot_Summary](https://user-images.githubusercontent.com/106561880/191399210-ecf7bd94-b3c8-46e8-9ad6-6c582e898855.png)

## T-Tests on Suspension Coils
The results of the above analysis brought on the need for additional testing.  The population mean PSI stands at 1500.  T-Tests were performed on the lots collectively, then individually, to compare them to the population mean of 1500.

- T-Test of all lots fails to reject that true mean is equal to 1500.

![D3_All_Lot_Test](https://user-images.githubusercontent.com/106561880/191399231-c2c9dac5-a145-46c4-b124-55f2d7781766.png)

- The mean of Lot 1 is 1500.  P-value is 1, so it very strongly fails to reject that true mean is equal to 1500.

![D3_Lot1_Test](https://user-images.githubusercontent.com/106561880/191399252-ad8a8788-08f2-4dc5-877c-a2a50e8af2c4.png)

- The p-value of Lot 2 is 0.61 which is above the significance value, so it also fails to reject that true mean is equal to 1500.

![D3_Lot2_Test](https://user-images.githubusercontent.com/106561880/191399267-a71033a5-84f0-44d0-8a32-8fbaba590d4c.png)

- The p-value of Lot 3 is 0.04 which is under the significance value, so it rejects that true mean is equal to 1500.  Since the true mean has been determined to be 1500, then this is further evidence of production errors at Lot 3.

![D3_Lot3_Test](https://user-images.githubusercontent.com/106561880/191399278-f8b521fa-1b46-4d9c-ba20-7a3195883863.png)

## Study Design: MechaCar vs Competition
Finally, this is a proposal for future study about metrics that compare MechaCar to competitor's models.  The task is to test metrics that would interest consumers and how MechaCar can outdo the competition in those metrics to win over customers.

Many tests can be run, but one of the most important metrics can be price and total cost of ownership.  There are many factors that may contribute to total cost of ownership, but one of the easier ones to predict, especially with a new product line, will be projected maintenance costs.  We can create a new metric which will be the sum of MSRP and 7 years of maintenance costs for each vehicle, and then compare that to competing models.

We will need to compile raw data for MechaCar vehicles using these metrics: MSRP and projected annual maintenance cost.  We will also need to obtain the same research data on competitors' vehicles.  Both will be compiled to a new data frame where annual maintenance cost is multiplied by 7 and then added to the MSRP to get a total 7-year cost.

The **null hypothesis** would be that there is no difference or a higher cost of ownership with the MechaCar model.

The **alternative hypothesis** would be that there is a lower cost of ownership with the MechaCar model.

A **two-sample t-test** would be performed for each comparative model.  This would be appropriate because we are measuring 2 different sets of numerical data (cost of MechaCar vs. cost of competitor vehicle).
