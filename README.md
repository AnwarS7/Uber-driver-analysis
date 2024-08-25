# Uber-driver-analysis
![uber-everywhere](https://user-images.githubusercontent.com/103464869/198420955-1a830889-7ecd-48d2-8d88-0bf6b65340e6.png)

# Uber Case Study

This repo contains a full analysis of the trips, routes, and pricing data of Uber. Uber is a transportation company with an app that allows passengers to hail a ride and drivers to charge fares and get paid. More specifically, Uber is a ridesharing company that hires independent contractors as drivers.


The insights from this project were presented inside MicroStrategy Workstation. For quick access, a summary of insights & screen shoots is available in this [**Slide Deck**](https://docs.google.com/presentation/d/1bEHOxBG0vFUtOBV097XxyQPbmetrcAemB6gyrk0LbUU/edit?usp=sharing) 

## 1. Objectives
One of main objectives of this project was to answer questions like: 
1. How does uber uses near real-time data to determine fare prices? **(Uber's Dynamic Pricing)**
2. Does factors like weather affect _surge factor_ used by uber to determing trip fares? 
3. What best practices & routes can drivers adhere to for optimal earnings?

Furthermore, explore the potential of analysing real-time data from drivers in a specific area to provide **Drivers** with live recommendations to allow better use of their time, and increase _per hour_ earnings. 

## 2. Data Sources

The data analysed in this project are public data from [Uber](https://www.kaggle.com/datasets/mayankvashisht/uber-cab-fare-price-analysis?resource=download), [Uber Review](https://www.kaggle.com/datasets/jschne61701/uber-rides-costumer-reviews-dataset/code?select=Uber+Review+Data.xlsx), facts and supporting information from [Statista](https://www.statista.com/study/54895/uber-technologies/) retrieved for free with ESC Clermont Student Credintials, and [NYC Open Data](https://data.cityofnewyork.us/Transportation/Traffic-Volume-Counts-2014-2020-/ertz-hr4r) all accessable for free through respective links. 

### **Sample Data** 


1. **Fare Prices**

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>distance</th>
      <th>cab_type</th>
      <th>time_stamp</th>
      <th>destination</th>
      <th>source</th>
      <th>price</th>
      <th>surge_multiplier</th>
      <th>id</th>
      <th>product_id</th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.44</td>
      <td>Lyft</td>
      <td>1.544950e+12</td>
      <td>North Station</td>
      <td>Haymarket Square</td>
      <td>5.0</td>
      <td>1.0</td>
      <td>424553bb-7174-41ea-aeb4-fe06d4f4b9d7</td>
      <td>lyft_line</td>
      <td>Shared</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.44</td>
      <td>Lyft</td>
      <td>1.543280e+12</td>
      <td>North Station</td>
      <td>Haymarket Square</td>
      <td>11.0</td>
      <td>1.0</td>
      <td>4bd23055-6827-41c6-b23b-3c491f24e74d</td>
      <td>lyft_premier</td>
      <td>Lux</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.44</td>
      <td>Lyft</td>
      <td>1.543370e+12</td>
      <td>North Station</td>
      <td>Haymarket Square</td>
      <td>7.0</td>
      <td>1.0</td>
      <td>981a3613-77af-4620-a42a-0c0866077d1e</td>
      <td>lyft</td>
      <td>Lyft</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.44</td>
      <td>Lyft</td>
      <td>1.543550e+12</td>
      <td>North Station</td>
      <td>Haymarket Square</td>
      <td>26.0</td>
      <td>1.0</td>
      <td>c2d88af2-d278-4bfd-a8d0-29ca77cc5512</td>
      <td>lyft_luxsuv</td>
      <td>Lux Black XL</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.44</td>
      <td>Lyft</td>
      <td>1.543460e+12</td>
      <td>North Station</td>
      <td>Haymarket Square</td>
      <td>9.0</td>
      <td>1.0</td>
      <td>e0126e1f-8ca9-4f2e-82b3-50505a09db9a</td>
      <td>lyft_plus</td>
      <td>Lyft XL</td>
    </tr>
  </tbody>
</table>
</div>

2. **Customer Reviews**

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Stars</th>
      <th>Comment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>10/29/2019</td>
      <td>1</td>
      <td>I had an accident with an Uber driver in Mexic...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>10/28/2019</td>
      <td>1</td>
      <td>I have had my account completely hacked to whe...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>10/27/2019</td>
      <td>1</td>
      <td>I requested an 8 mile ride in Boston on a Satu...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>10/27/2019</td>
      <td>1</td>
      <td>I've been driving off and on with the company ...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>10/25/2019</td>
      <td>1</td>
      <td>Uber is overcharging for Toll fees. When In Fl...</td>
    </tr>
    <tr>
      <th>5</th>
      <td>10/24/2019</td>
      <td>1</td>
      <td>I had an airport flight today. Uber would not ...</td>
    </tr>
    <tr>
      <th>6</th>
      <td>10/24/2019</td>
      <td>1</td>
      <td>I worked for Uber and Lyft for 2.5 years and a...</td>
    </tr>
    <tr>
      <th>7</th>
      <td>10/23/2019</td>
      <td>1</td>
      <td>In July of this year I had sushi delivered to ...</td>
    </tr>
    <tr>
      <th>8</th>
      <td>10/23/2019</td>
      <td>1</td>
      <td>My driver, Rohan was nice, but when I tried to...</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10/21/2019</td>
      <td>1</td>
      <td>I had seven fraudulent Uber transactions over ...</td>
    </tr>
  </tbody>
</table>
</div>

3. **NYC Traffic Data**

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Segment ID</th>
      <th>Roadway Name</th>
      <th>From</th>
      <th>To</th>
      <th>Direction</th>
      <th>Date</th>
      <th>12:00-1:00 AM</th>
      <th>1:00-2:00AM</th>
      <th>2:00-3:00AM</th>
      <th>...</th>
      <th>2:00-3:00PM</th>
      <th>3:00-4:00PM</th>
      <th>4:00-5:00PM</th>
      <th>5:00-6:00PM</th>
      <th>6:00-7:00PM</th>
      <th>7:00-8:00PM</th>
      <th>8:00-9:00PM</th>
      <th>9:00-10:00PM</th>
      <th>10:00-11:00PM</th>
      <th>11:00-12:00AM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>70376</td>
      <td>3 Avenue</td>
      <td>East 154 Street</td>
      <td>East 155 Street</td>
      <td>NB</td>
      <td>9/13/2014</td>
      <td>204</td>
      <td>177</td>
      <td>133</td>
      <td>...</td>
      <td>520</td>
      <td>611</td>
      <td>573</td>
      <td>546</td>
      <td>582</td>
      <td>528</td>
      <td>432</td>
      <td>328</td>
      <td>282</td>
      <td>240</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>70376</td>
      <td>3 Avenue</td>
      <td>East 155 Street</td>
      <td>East 154 Street</td>
      <td>SB</td>
      <td>9/13/2014</td>
      <td>140</td>
      <td>51</td>
      <td>128</td>
      <td>...</td>
      <td>379</td>
      <td>376</td>
      <td>329</td>
      <td>362</td>
      <td>418</td>
      <td>335</td>
      <td>282</td>
      <td>247</td>
      <td>237</td>
      <td>191</td>
    </tr>
    <tr>
      <th>2</th>
      <td>56</td>
      <td>176365</td>
      <td>Bedford Park Boulevard</td>
      <td>Grand Concourse</td>
      <td>Valentine Avenue</td>
      <td>EB</td>
      <td>9/13/2014</td>
      <td>94</td>
      <td>73</td>
      <td>65</td>
      <td>...</td>
      <td>280</td>
      <td>272</td>
      <td>264</td>
      <td>236</td>
      <td>213</td>
      <td>190</td>
      <td>199</td>
      <td>183</td>
      <td>147</td>
      <td>103</td>
    </tr>
    <tr>
      <th>3</th>
      <td>56</td>
      <td>176365</td>
      <td>Bedford Park Boulevard</td>
      <td>Grand Concourse</td>
      <td>Valentine Avenue</td>
      <td>WB</td>
      <td>9/13/2014</td>
      <td>88</td>
      <td>82</td>
      <td>75</td>
      <td>...</td>
      <td>237</td>
      <td>276</td>
      <td>223</td>
      <td>240</td>
      <td>217</td>
      <td>198</td>
      <td>186</td>
      <td>162</td>
      <td>157</td>
      <td>103</td>
    </tr>
    <tr>
      <th>4</th>
      <td>62</td>
      <td>147673</td>
      <td>Broadway</td>
      <td>West 242 Street</td>
      <td>240 Street</td>
      <td>SB</td>
      <td>9/13/2014</td>
      <td>255</td>
      <td>209</td>
      <td>149</td>
      <td>...</td>
      <td>732</td>
      <td>809</td>
      <td>707</td>
      <td>675</td>
      <td>641</td>
      <td>556</td>
      <td>546</td>
      <td>465</td>
      <td>425</td>
      <td>324</td>
    </tr>
  </tbody>
</table>

## 3. Analysis 

### 1. Principle Component Analysis (PCA) of Weather Data 


![PCA](https://user-images.githubusercontent.com/103464869/198494344-f195b80d-3d7b-4cad-8677-4376de6dd700.jpg)

>The results of of PCA analysis shows displays the negligible effect of weather and weather forecast on Uber's dynamic pricing.
### 2. Interactive Dashboard for Picking the Best Route

Through the dashboard, drives could pick the best routes to their destination based on the _Time_, _Hour_, and _Day of the Week_

![Route](https://user-images.githubusercontent.com/103464869/198495615-be1ed109-093c-4751-bf05-65b67313aa45.jpg)

### 3. Time Series Prediction of Future Fares Based on Past Data

![Time Series Analysis   Prediction](https://user-images.githubusercontent.com/103464869/198495742-96bc6d4c-bbba-4df2-9f2c-e73a2c32536e.jpg)

> Results of the time-series analysis presented an **Accuracy of 72%**. In order to achieve better accuracy, we decided to train a Random Forest model predict fare prices based on Cab Type, Distance,..etc. 

### 4. Time Stamp Recommendation

Based on the predicted fare prices for each time stamp for each month (July 2015 is the first predict month based on the Histroical data available) ,it is possible to maximise the income of uber driver by recommending the most optimal time stamp , eg : an uber driver could make on a specific month 17,12 $ for a working hour instad of the Average hourly income evaluated at 13,34  
 
![Capture](https://user-images.githubusercontent.com/103480107/202560602-cac8793a-3e5e-449f-87cf-0cf629d824e3.PNG)

The Estimated gain on average is 8% income increase by working during the recommended timestamp, and this gain could reach up to 20% if the work schedule is fully provided based on the reccomendations.

![image](https://user-images.githubusercontent.com/103480107/202560752-0337bc52-7479-4732-a71f-067d7168a6a7.png)


### 5. Random Forest Prediction of Fares & Surge Factor

![Random Forest](https://user-images.githubusercontent.com/103464869/198496870-3cb1f3b8-38ea-44e8-adae-87539f7a23d1.PNG)
_**The model was deployed using Dataiku, the used code is exported accordingly_

### 6. Global Sentiment Analysis of Customers Reviews

![Sentiment Analysis](https://user-images.githubusercontent.com/103464869/198497400-b587e74e-115f-4da5-97b0-b2277d975f11.jpg)

> Information on Polarity and Subjectivity were later used to introduce best practices and recommendations for drivers. These insights and recommendations are available on the Slide Deck of the project. 
### 7. Data Collection using VBA form

The main objective of the project was to provide useful recommendations and prediction for Uber drivers to dynamically support their decision making and allow them to achieve higher earning. 

The next VBA form was created to collect data from active drives in certain regions. This data is later used to train our Random Forest model to predict surge factor for different times of the day with better accurancy, and then shared back with uber drivers operaing in the same area. 

![Excel_VBA](https://user-images.githubusercontent.com/103464869/198498185-fc34d8e6-9ea9-4aee-836a-0ec6ce31a289.PNG)

### 8. Recommendations with VBA Based on Collected Data

![Prediction](https://user-images.githubusercontent.com/103464869/198498811-8bfb4305-7dc4-4dbe-a5ef-417593bf8315.jpg)

>This system was intended to allow new uber driver to enter their target income and move through a serios of forms to enter all their preferences. The application will later use the collected preferences to suggest the different options of operations to achieve the targeted income with the most convenience to the driver. 
### Recommendations by VBA Results

![Excel_VBA2](https://user-images.githubusercontent.com/103464869/198499063-db592fa7-0b9c-453e-9087-f87137fbb901.PNG)

## BONUS 
> For new cap drivers, and to ease their penetration to the market, and helping them build better uber profile with better reviews. The used cars dataset from NYC DOT were displayed in an **interactive dashboard** to help new entrants pick the most convenient cars when it comes to _fuel consumption_, _leg space_, _price_, and _make_ 
![BONUS](https://user-images.githubusercontent.com/103464869/198500171-5961af10-8cc8-4dde-b244-73eefad90a80.jpg)


# 4. Usability 

  - Clone the [repo](https://github.com/amine-abdollah/-becoming_an_uber_driver) using this command in your terminal `git clone 
  
