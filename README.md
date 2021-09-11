![image](https://user-images.githubusercontent.com/86415241/132958690-fddccdda-3a77-4b8d-a19a-0606b913c3c9.png)

# Life Expectancy of People 

The dataset comes from the Global Health Observatory (GHO) data repository under World Health Organization (WHO) keeps track of the health status as well as many other related factors for all countries. The data-sets are made available to public for the purpose of health data analysis. The data-set related to life expectancy, health factors for 193 countries have been collected from the same WHO data repository website and its corresponding economic data was collected from United Nation website. Among all categories of health-related factors only those critical factors were chosen which are more representative. It has been observed that in the past 15 years, there has been a huge development in health sector resulting in improvement of human mortality rates especially in the developing nations in comparison to the past 30 years. Therefore, in this case study we have considered data from year 2000-2015 for 193 countries for further analysis. The individual data files have been merged together into a single data-set.



## Objective

 ![image](https://user-images.githubusercontent.com/86415241/132958707-427d513c-6cb9-4ec3-9040-9315da34f376.png)
  
##  Approach

- Understand the variables in the data set, study about the Industry and perceive the business objective

- Created hypothesis and validated
- Identifing the statistical model to use (compare pros / cons of different models before accepting a model to follow) based on the kind of variables
- Clean the data set. That is, imputing missing values with the necessary values, detection of outliers and treatment of extreme outliers in the variables with the required method
- Using Principal Component analysis 
- Run Regression model
- Check which variables are significant by looking at p values, conclude them accordingly. Observe variable relationships of predictor variables and target variables
- Does different tests like multicollinearity test, Homoscedasticity test, Normality test, serial correlation, MAPE (mean and median error percentage) and model accuracy.
- Mentioned goodness of fit statistics (R-square, adjusted R-squares).



  
## Why we Used PCA and their assumptions ?
- In our data set there are more feature.  So PCA is used to overcome features redundancy in a data set.
- These features are low dimensional in nature.
- These components aim to capture as much information as possible with high explained variance.
- PCA is applied on a data set with numeric variables.
- PCA is a tool which helps to produce better visualizations of high dimensional data.
- PCA is sensitive to the scale of the features.
- PCA assumes a linear relationship between features

## Univariate Analysis

![image](https://user-images.githubusercontent.com/86415241/132958735-b789e518-6eff-4503-997c-b5d51f69597a.png)

![image](https://user-images.githubusercontent.com/86415241/132958737-e1c71155-46c2-41bc-ba2f-edfba9b40edf.png)

![image](https://user-images.githubusercontent.com/86415241/132958747-d6692dc9-efee-4467-a419-73b7dd11079c.png)


## Bivariate Analysis

![image](https://user-images.githubusercontent.com/86415241/132958768-02c46a90-8567-40e9-8158-94b0a2a2aa60.png)

![image](https://user-images.githubusercontent.com/86415241/132958773-7d178d85-b7c2-493b-ab37-87eab64056d7.png)

![image](https://user-images.githubusercontent.com/86415241/132958789-13e17a94-37c9-4d5c-8056-cf9ba5e2aa68.png)


## Regression Model

![image](https://user-images.githubusercontent.com/86415241/132958813-a810d442-2b98-4c26-9972-26a8c3b26c36.png)


## Prediction Result

![image](https://user-images.githubusercontent.com/86415241/132958830-45809302-e729-48ca-8d60-e8d0cda7de17.png)




  
## Lessons Learned
I learned how to apply PCA and build a machine learning regression model during working on this project.





  
