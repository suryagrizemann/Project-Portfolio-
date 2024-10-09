# EPL Match Winner Prediction for 2024-25 Season

## Project Overview

This project aims to predict the winners of English Premier League (EPL) matches for the 2024-25 season. By leveraging historical data from the 2022-2024 seasons, a prediction model has been developed to forecast match outcomes with a primary focus on determining the match winners. The model utilizes various match-related features such as team performance and statistics, match conditions to provide accurate predictions, helping fans, analysts, and stakeholders make informed decisions about upcoming EPL matches.

## Data Scrapping
The Project required realtime match data from the English Premier League and was extracted using HTML from Fbref. Data scraping was one of  important part of this project.

#### Extracting HTML links


![Link extraction](https://github.com/user-attachments/assets/dc8f4851-ba79-4c7b-9ed2-e7d00595fe64)



#### Website Table 





![pl table](https://github.com/user-attachments/assets/2aff22b4-ae6d-46ea-8dcf-a174c46c2341)

The data collection process was carried out in two key phases to ensure a comprehensive dataset for model training and evaluation:

### 1. Initial Data Scraping

- **Objective:** Start by scraping data for a single EPL team to develop and test the data extraction script.
- **Details:** The initial scraping script was designed to gather match data, team statistics, and performance metrics for one team. This step allowed for validation of the data extraction process and ensured accuracy.


#### Scraped Mancity/Oneteam Data
![mancity stats](https://github.com/user-attachments/assets/19137988-e219-4b13-86d6-9497a23f1de5)


### 2. Iterative Data Collection

- **Objective:** Expand the data collection to cover all 20 EPL teams over two seasons (2022-2024).
- **Details:** After successfully validating the initial script, it was adapted to loop through all 20 teams. This automated approach ensured that data was collected systematically for each team across the specified seasons.
- **Process:**
  - **Loop Implementation:** Automated the scraping process to gather data for each team, iterating through a predefined list of EPL teams.
  - **Data Aggregation:** Combined data from all teams into a single dataset, ensuring consistency and completeness across the two seasons.
 
  
`[Code example]`


![loop example](https://github.com/user-attachments/assets/8fb2977a-4772-47e8-aeac-e13ccb15b92f)

### Handling Site Access Issues
During the scraping process, the script encountered issues with being blocked from the site due to continuous scraping. To mitigate this issue, the following solution was implemented:

- **Issue:** The website's anti-scraping measures resulted in temporary blocks due to the high frequency of requests.
- **Solution:** A time limit was added to the loop to introduce delays between requests. This approach helps to:
  - **Prevent Overloading:** Reduce the risk of being blocked by spreading out requests over time.
  - **Respect Site Policies:** Adhere to the website's terms of service regarding request frequency.

![code example](https://github.com/user-attachments/assets/7b5f85b3-1f5b-4ca9-bb40-0fec1e5f37ec)


check `[PL Data scraping]` for full code

#### Implementation of Time Limit

**Delay Interval:** Added a time delay (60 seconds) between consecutive requests.



  ![time limit](https://github.com/user-attachments/assets/07b2f4d3-f506-4345-9fe9-279efef5493d)


Beautiful Soup and pandas were used to extract and ro formulate the data into pandas frame. The dataset encompasses various performance metrics and statistics from the previous two EPL seasons.

  ![image](https://github.com/user-attachments/assets/4d429e31-b12e-453c-aea6-dda3bb6c69d7)


## Data Processing

1. **Data Cleaning:** The raw data was cleaned and pre-processed with Pandas to ensure consistency and accuracy for modeling.
    
    ![cleaning data](https://github.com/user-attachments/assets/293c131a-d690-43a4-a8c4-0cef20913935)


2. **Creating predictors:** Predictors were created to train the model

    ![predictors](https://github.com/user-attachments/assets/3363bab6-e145-4ea9-8dfc-4ac0d3bf0274)
## Model Building

The prediction model was developed using Scikit-Learn with the following classifiers:
- **Decision Tree Classifier**
- **Random Forest Classifier**
The data set were split into two
    - Training set < 01.01.2024
    - Test set > 01.01.2024

![rfc](https://github.com/user-attachments/assets/be774cdd-9605-4623-a5dd-fe310db91c98)

Initially, the model achieved an accuracy of 60% in predicting match outcomes, with a specific winner prediction accuracy of 47%.
### Match prediction accuracy
![pred](https://github.com/user-attachments/assets/a97fad60-6373-482f-a08d-39aaea7cd4c3)

### Match winner prediction accuracy
![winner prediction](https://github.com/user-attachments/assets/db9ec62e-a6ad-4e39-a10a-954e4a1f34a6)

## Model Improvement

To improve the prediction of specific match winners, the following steps were undertaken:
1. **Error Analysis:** Measurement of model errors to identify areas for improvement.
   
   ![rolling av](https://github.com/user-attachments/assets/a3e31c02-6a54-4a29-bb94-b742e4adc3ed)
 
2. **Data Enhancement:** Further cleaning and addition of new predictor variables.

   ![new predictors](https://github.com/user-attachments/assets/9c1e3ca4-6de3-4c33-9ebf-7ba59788d458)
3. **Model Refinement:** Adjustments to the model to boost performance.

   ![refinement](https://github.com/user-attachments/assets/4ac7c023-e163-489f-8562-ae400ab0a466)

#### After these improvements, the model's accuracy in predicting specific match winners increased to 60%.

## Results

- **Overall Match Outcome Prediction Accuracy:** 60%

  ![pred](https://github.com/user-attachments/assets/83706fa0-fbc6-4909-af2c-d3134aa6bf9d)
- **Specific Match Winner Prediction Accuracy:** 60%

  ![winner accuracy](https://github.com/user-attachments/assets/45a14a22-3150-4cdf-b45f-f2e4643a88ff)
- ## Future Work

- **Explore Additional Machine Learning Algorithms:** Investigate and apply different algorithms to potentially achieve better prediction accuracy.
- **Integrate More Detailed Player and Team Statistics:** Include more variables and data to enhance the model’s ability to predict match outcomes.
- **Incorporate Real-Time Data Updates:** Implement mechanisms to update the data dynamically for more accurate and up-to-date predictions.

## Acknowledgements

- Special thanks to **FBref** for providing the dataset.
- Appreciation to the **Scikit-Learn** community for the invaluable machine learning tools.
