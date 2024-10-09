# Big Mart Sales Prediction

This project aims to build a machine learning model to forecast sales for various products across different Big Mart outlets. The retail industry often faces challenges in predicting sales due to the vast array of products and the diverse characteristics of stores. Accurate sales predictions can help businesses manage inventory, optimize supply chain processes, and improve customer satisfaction by ensuring product availability.

This project utilizes a dataset provided by Kaggle, which includes information about products, such as item weight, visibility, type, and maximum retail price (MRP), as well as details about the outlets, like their size, location, and establishment year. The primary goal is to predict the `[Item_Outlet_Sales]`, which is the sales of the products at the respective outlets.

## Table of Contents
- [Project Overview](#project-overview)
- [Dependencies](#dependencies)
- [Data Collection and Processing](#data-collection-and-processing)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Pre-Processing](#data-pre-processing)
- [Model Training and Evaluation](#model-training-and-evaluation)
- [Conclusion](#conclusion)

## Project Overview
The goal of this project is to build a machine learning model to predict the sales of products in various Big Mart outlets. The dataset used in this project is provided by kaggle website. The prediction model is built using the XGBoost Regressor algorithm.

## Dependencies
- numpy
- pandas
- matplotlib
- seaborn
- scikit-learn
- xgboost
  
## Data Collection and Processing
The dataset is loaded into a Pandas DataFrame, and initial analysis is performed to understand the structure and features of the data.

![Capture](https://github.com/user-attachments/assets/ce8424ef-bc1c-4a43-b10f-fd4e71c57293)

## Exploratory Data Analysis
We explore the dataset by checking for missing values, understanding the distribution of numerical features, and visualizing categorical features. using pandas and seaborn libraries
#### Checking missing values
![cleaning](https://github.com/user-attachments/assets/672b029c-1d13-457e-a316-274dc7043870) 

#### Understanding Numerical features
![num vis](https://github.com/user-attachments/assets/4619febb-0bce-4935-b787-9ce2ef9156c3) 

#### Understanding Numerical features
![Cat vis](https://github.com/user-attachments/assets/c2763740-01c6-4a85-aa16-302366bd53ba) 

## Data Pre-Processing
Handling missing values and encoding categorical variables are crucial steps before training the model. Missing values in the Item_Weight column are filled with the mean, and those in the Outlet_Size column are filled with the mode. Label encoding is used to convert categorical variables into numerical ones.
#### mean
![mean](https://github.com/user-attachments/assets/413ce454-c3fb-4752-91f4-d6f497913d4f) 

#### mode
![median](https://github.com/user-attachments/assets/4bad7c37-94b6-4ce1-b1a1-3a239c0fc874)

#### Label encoding
![lable](https://github.com/user-attachments/assets/62d08e93-8aa8-4c14-8b27-2bc8bb47bb4f)

## Model Training and Evaluation
The dataset is split into training and testing sets. An XGBoost Regressor model is trained on the training data and evaluated on both training and testing data.

#### Training and Testing sets
![training and testing](https://github.com/user-attachments/assets/c074309e-e148-4a0e-b725-1aa4a7b51ed6)

#### R squared value for training data
![r squ train](https://github.com/user-attachments/assets/674e5b8f-be67-4137-8953-056447d73770)

#### R squared value for testing data
![r test](https://github.com/user-attachments/assets/f61c57c0-8ace-4d69-afca-aee415cd149f)

## Conclusion
The XGBoost Regressor model provides a reasonable prediction of the sales in various outlets. The R-squared value on the training data is approximately 0.64, while on the testing data it is approximately 0.59, indicating a good fit for the model with some room for improvement.
