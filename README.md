# Car-Rental-Management-System

## Purpose : 

The Purpose is to provide a robust and efficient database management system in order to make the car rental process smooth and streamlined. The primary objective is to provide a dependable and efficient system for managing the car rental business by offering a large selection of automobiles at reasonable prices, recording customer service and car maintenance, and utilising technology to make the car rental process as simple and hassle-free as possible.


## Tools : 

Data Model  : MS - SQL
<br>
Visualization : Tableau 
<br>
Others : SQL Server

## Business Problems Addressed :

Through this database management system we planned to address the following business problems:
* The customers can rent a car by selecting the cars depending upon their preferences like time, location, car category, etc. 
* The customers can opt for their preferred insurance and also avail discounts.
* The customers can get a bill according to their usage depending on time, car selected, insurance type, discounts, penalties and taxes.
* The system keeps a track of the payment details including information such as payment status, payment type and transaction details.
* Customer support services are provided to assist the customers with their queries
* The customers can raise complaints to provide their feedback on their car rental experience.
* Car maintenance can be tracked to manage the service and repair history of rental cars.


## Entities

| Entity  | Overview |
| ------------- | ------------- |
| Person  | Personal information of individuals |
| Customers  | Information about customers who have rented a car  |
| Employee  | Information about employees working at the car rental company |
| Location | Addresses for pickup and drop-off locations |
| Cars | Inventory of available rental cars |
| Car Category | Details of types or categories of cars, each with unique features and pricing |
| Car Maintenance | Records of maintenance and repairs for rental cars |
| Car Reservation | Information about specific car reservations,, billing records, insurance coverage, discounts, pickup and drop-off locations, and expected return time |
| Cancelled Reservation | Records of cancelled reservations and reasons for cancellation |
| Insurance | Information about insurance coverage options |
| Discount | Information about available discounts and promotional offers and their validity period |
| Billing | Billing information, including rental costs, discounts, insurance fees, taxes, and penalties |
| Payment | Payment information, including payment type, status, transaction ID, and timestamp |
| Penalty | Reasons for penalties and associated costs |
| Billing Penalty | Management of penalties associated with billing |
| Customer Support | Information about customer inquiries and support requests |
| Complaint | Information about customer complaints|


## Entity Relationship Diagram 

<p align="center">
  <img src="https://github.com/vidhisejpal/Car-Rental-Management-System/blob/main/Final_ERD.png">
</p>

## Visualization 

1. Bar Graph indicating Total Revenue and Cancelled Reservation Based on Car Category
  <p align="center">
    <img src="https://github.com/vidhisejpal/Car-Rental-Management-System/blob/main/Visualization/Car%20Category%20Stats.png">
  </p>
2. Geographical Distribution of Car Reservation Based on Locations
  <p align="center">
    <img src="https://github.com/vidhisejpal/Car-Rental-Management-System/blob/main/Visualization/Car%20Reservation%20Locations.png">
  </p>
3. Bar Graph indicating Popular Insurance Type used by Customers for Car Reservation
   <p align="center">
    <img src="https://github.com/vidhisejpal/Car-Rental-Management-System/blob/main/Visualization/Popular%20Insurance%20Type.png">
   </p>
4. Pie Diagram indicating Penalty Reasons
  <p align="center">
    <img src="https://github.com/vidhisejpal/Car-Rental-Management-System/blob/main/Visualization/Penalty%20Distribution.png">
  </p>
  
5. Bar Graph indication Complaint Reasons by Customers
   <p align="center">
      <img src="https://github.com/vidhisejpal/Car-Rental-Management-System/blob/main/Visualization/Complaint%20Details.png">
    </p>

## Conclusion 

* Our database helps customers to easily rent a car based on their preferences and avail of various insurance options and discounts. 
* This  system also provides an accurate billing system based on usage, including any penalties and taxes. 
* Additionally, the system keeps track of payment details and offers customer support services to address any queries or complaints.
* Furthermore, the system can track car maintenance to manage the service and repair history of rental cars, ensuring a smooth and efficient rental experience for customers.
* Overall, this database management system provides a comprehensive solution for managing car rental services, from rental reservations to billing, payments, and maintenance tracking.
