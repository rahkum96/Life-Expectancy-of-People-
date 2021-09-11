############################################################################
################### Linear Regression #####################################

#Objective: In this case study you're provided average life expectancy of 
#people of 193 Countries. You have to predict next year value using 
#linear regression.

# Import the dataset 
life<- read.csv("C:\\Users\\Rohit Kumar (Prince)\\OneDrive\\Desktop\\Ivy_Data_science\\R-\\HW\\Life_Expenctancy_Dataset\\Life Expectancy Data.csv",na.strings = c(""," ","NA","NULL"))
#Lets look at the first 6 rows of the dataset
head(life)
# Dimenssion 
dim(life)
#2938--rows   #23--columns
#lets look at the structure of dataset
str(life)
# Summary of dataset
summary(life)
# The intresting fact about the summary is the minimum life expenctancy
# is 36 year and max is 89 years


# now lets check which variable we have to move to factor
lapply(life,function(x)length(unique(x)))

# Since country column has 192 unique value, which is categorical and 
#it will not help us in prediction so, we remove this column
life$Country=NULL

str(life)

life$Status<- as.factor(life$Status)
life$Year<- as.factor(life$Year)


########################################################################
############## Univariate Analysis #####################################
#Univariate Analysis;
#for continuous variables we will plot it by histogram graph
#for categorical variables  we will plot it by bar graph

## we will install the packages 
library(RColorBrewer)
library(ggplot2)
hist_col<- c("Life_Expectancy","Adult_Mortality","Infant_Deaths","Alcohol",
             "Percentage_Expenditure","Hepatitis_B","Measles","BMI","Under.five_Deaths",
             "Polio","Total_Expenditure","Diphtheria","HIV.AIDS","GDP","Per_Capita_GDP",
             "Population","Thinness_1.19_Years","Income_Composition_of_Resources","Schooling")


#splitting the plot window into 2 parts
par(mfrow=c(2,3))

for(i in hist_col){
  hist(life[,c(i)],main = paste("Histogram of:",i),
       col = brewer.pal(8,"Paired"))
}

# Exploring categorical variables
bar_cols<- c("Year","Status")
# splitting the plot
par(mfrows=c(2,3))
for (i in bar_cols){
  barplot(table(life[,c(i)]),main = paste("Barplot of:",i),
          col = brewer.pal(8,"Paired"))
}
graphics.off() 
par("mar") 
par(mar=c(1,1,1,1))

###############################################################################
################ Bivariate analysis ########################################

#continous to continous ----> scatter plot
#continous to categorical ----> Box Plot

cont_cols<- c("Life_Expectancy","Adult_Mortality","Infant_Deaths","Alcohol",
             "Percentage_Expenditure")
#Scatterplot Matrix
cont_life<- life[c(cont_cols)]
plot(cont_life,col=brewer.pal(3,"Set1"))

cont_life1<- life[c("Hepatitis_B","Measles","BMI","Under.five_Deaths","Polio",
                    "Total_Expenditure","Diphtheria","HIV.AIDS")]

plot(cont_life1,col=brewer.pal(3,"Set1"))

cont_life2<- life[c("GDP","Per_Capita_GDP","Population","Thinness_1.19_Years",
                    "Income_Composition_of_Resources","Schooling")]

plot(cont_life2,col=brewer.pal(3,"Set1"))
names(life)

#continous to categorical ----> Box Plot
boxplot(life$Life_Expectancy~life$Year,col=topo.colors(3))
boxplot(life$Life_Expectancy~life$Status,col=topo.colors(3))


####################################################################
#Here we are going to use pca, because we have more features in dataset
#And it will It extracts low dimensional set of features by taking a projection
#of irrelevant dimensions from a high dimensional data set with a motive to capture as much information as possible.

#It is always performed on a symmetric correlation or covariance matrix. 
#This means the matrix should be numeric and have standardized data.
#by using PCA we have to find Eigen value and Eigen Matrix

# c-lambda*I =0, (c--> covariance, Lambda--> we have find?,I--> Identity matrix)
# Then we have to find Eigen vector
# Cv=lambda*v, (v---> Eigen Vector, c---> covariance, Lambda= we got from previous equation)

#checking the missing values 
colSums(is.na(life)) # Yes there is missing values 
#Checking % missing values
colSums(is.na(life))/nrow(life) # all missing values less than threshold values

life$Life_Expectancy[is.na(life$Life_Expectancy)]<-median(life$Life_Expectancy,na.rm = T)
life$Adult_Mortality[is.na(life$Adult_Mortality)]<-median(life$Adult_Mortality,na.rm = T)
life$Alcohol[is.na(life$Alcohol)]<- median(life$Alcohol,na.rm = T)
life$Hepatitis_B[is.na(life$Hepatitis_B)]<- median(life$Hepatitis_B,na.rm = T)
life$BMI[is.na(life$BMI)]<- median(life$BMI,na.rm = T)
life$Polio[is.na(life$Polio)]<- median(life$Polio,na.rm = T)
life$Total_Expenditure[is.na(life$Total_Expenditure)]<- median(life$Total_Expenditure,na.rm = T)
life$Diphtheria[is.na(life$Diphtheria)]<- median(life$Diphtheria,na.rm = T)
life$GDP[is.na(life$GDP)]<- median(life$GDP,na.rm = T)
life$Per_Capita_GDP[is.na(life$Per_Capita_GDP)]<- median(life$Per_Capita_GDP,na.rm = T)
life$Population[is.na(life$Population)]<- median(life$Population,na.rm = T)
life$Thinness_1.19_Years[is.na(life$Thinness_1.19_Years)]<- median(life$Thinness_1.19_Years,na.rm = T)
life$Thinness_5.9_Years[is.na(life$Thinness_5.9_Years)]<- median(life$Thinness_5.9_Years,na.rm = T)
life$Income_Composition_of_Resources[is.na(life$Income_Composition_of_Resources)]<- median(life$Income_Composition_of_Resources,na.rm = T)
life$Schooling[is.na(life$Schooling)]<- median(life$Schooling,na.rm = T)
###################################################################
#### Correlation
library(corrplot)
cont_life<- life[c("Life_Expectancy","Adult_Mortality","Infant_Deaths","Alcohol",
                   "Percentage_Expenditure","Hepatitis_B","Measles","BMI","Under.five_Deaths",
                   "Polio","Total_Expenditure","Diphtheria","HIV.AIDS","GDP","Per_Capita_GDP",
                   "Population","Thinness_1.19_Years","Income_Composition_of_Resources","Schooling")]

#we will find the correlation between these column
res <- cor(cont_life, method="pearson")
corrplot::corrplot(res, method= "pie",number.cex=0.75,order = "hclust", tl.pos = 'y')
corrplot(res, type = 'lower', order = 'hclust', tl.col = 'black', 
         cl.ratio = 0.1, tl.srt = 45)




#Note: Assumption:
#1. PCA assumes there is no missing values in data, either we have impute with
# mean/meadin or we have to remove the missing data

#2. PCA is not robust to outliers, so we have to treats the outliers, because 
# we have to calculate the covariance matrix,and for calculating covariance matrix
# we need to calculate the mean of each features.

#3.PCA is sensitive to the scale of the features. Imagine we have two features -
#one takes values between 0 and 1000, while the other takes values 
#between 0 and 1. PCA will be extremely biased towards the first feature being 
#the first principle.
#Feature standardization. 
#We standardize each feature to have a mean of 0 and a variance of 1

#4. PCA assumes a linear relationship between features. 
#The algorithm is not well suited to capturing non-linear relationships. 
#That's why it's advised to turn non-linear features or relationships between 
#features into linear, using the standard methods such as log transforms.

#5. Since PCA works on numeric variables, let's see if we have any variable other than numeric.
#Since year is not going to help in predcting so we will remove it
life$Year=NULL
str(life)
# we have two categorical features ("Year " and "Status")

#load library
library(dummies)

#create a dummy data frame
life_1 <- dummy.data.frame(life, names = c("Status"))
#lets check the structure
str(life_1)

# we will split the data 
library(caTools)
set.seed(123)
split<- sample.split(life_1$Life_Expectancy,SplitRatio = 0.80)
split
table(split) #training=2341, test=597

training<- subset(life_1,split==T)
nrow(training) # training size
test<- subset(life_1,split==F)
nrow(test)  # test size
colnames(life_1)


#We are applying PCA concept. 

# We install packages "caret" for pre-processing
library(caret)
#Building the pca model 
#Transform the data to the principal components. The transform keeps components 
#above the variance threshold (default=0.95). 
#or the number of components can be specified (pcaComp). 
#The result is attributes that are uncorrelated, useful for algorithms like linear and generalized linear regression.

pca<- preProcess(x=training[-3],method = c("center","scale", "pca"),pcaComp = 2)
summary(pca)
biplot(pca, scale = 0)
#1.here we remove dependent variables and and we want to see pc1 and pc2
#2.Combining the scale and center transforms will standardize the data. 
#Attributes will have a mean value of 0 and a standard deviation of 1.
#3.non-linear relationships features to make it linear we do log transformation.

#predicting the model on training data
training1<- predict(pca,training)
summary(training1)
#lets look at first 5 rows of training1
head(training1,5)
# so can write training1
training1<-training1[c(2,3,1)]



# Now predicting the model on test data
test1<- predict(pca,test)
summary(test1)
head(test1,5)
#so new test data 
test1<- test1[c(2,3,1)]
names(test1)
#"PC1", "PC2" ,"Life_Expectancy"


plot(training1[,1],training1[,2],xlab="PC1",ylab="PC2")

res1= cor(training1)
heatmap(res1)
res1 <- cor(life_1$Life_Expectancy, method="pearson")
corrplot::corrplot(res1, method= "color", order = "hclust", tl.pos = 'y')

###############################################################################
############# Now build the regression model #################################
# we will build the linear regression model:
lr_model<- lm(Life_Expectancy~.,data = training1)
summary(lr_model)
#Multiple R-squared:  0.6332,	Adjusted R-squared:  0.6329
#p-value: < 2.2e-16

#Now we will predict the model:
pred<- predict(lr_model,newdata = test1)
head(pred,5)

# Lets compare the predicted data and original data
pred_cbind<- cbind(test$Life_Expectancy,pred)
head(pred_cbind)

#checking the model accuracy
model_error= 100*(abs(test$Life_Expectancy-pred)/test$Life_Expectancy)
##we can see for each prediction what is the error I am committing
##for average accuracy: we take the average of all the errors and subtract it from 100

print(paste('### Mean Accuracy of regression model is: ', 100 - mean(model_error)))
print(paste('### Median Accuracy of regression model is: ', 100 - median(model_error)))

# Mean Accuracy of regression model is:  92.8165501692204
# Median Accuracy of regression model is:  94.1660378564322

#Note:
#1.PCA is used to overcome features redundancy in a data set.
#2.These features are low dimensional in nature.
#3.These features a.k.a components are a resultant of normalized linear combination of original predictor variables.
#4.These components aim to capture as much information as possible with high explained variance.
#5.The first component has the highest variance followed by second, third and so on.
#6.The components must be uncorrelated (remember orthogonal direction ? ). See above.
#7.The preProcess class can be used for many operations on predictors, including centering and scaling.
#8.PCA works best on data set having 3 or higher dimensions. Because, with higher dimensions, it becomes increasingly difficult to make interpretations from the resultant cloud of data.
#9.PCA is applied on a data set with numeric variables.
#10.PCA is a tool which helps to produce better visualizations of high dimensional data.
