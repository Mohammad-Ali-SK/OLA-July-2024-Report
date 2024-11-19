-- 1. Retrieve all successful bookings:
-- 2. Find the average ride distance for each vehicle type:
-- 3. Get the total number of cancelled rides by customers:
-- 4. List the top 5 customers who booked the highest number of rides:

select "Customer_ID" as cust_id, count("Booking_ID") as booking_id from bookings
group by cust_id
order by booking_id desc limit 5

select * from bookings

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

select count("Canceled_Rides_by_Driver") as cancelled_by_drivers from bookings
where "Canceled_Rides_by_Driver" = 'Personal & Car related issue'

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

select max("Driver_Ratings"),min("Driver_Ratings") from bookings where "Vehicle_Type" = 'Prime Sedan'

-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
select * from bookings where "Payment_Method" = 'UPI';



-- 8. Find the average customer rating per vehicle type:

select "Vehicle_Type", round(avg("Customer_Rating")::numeric,2) as cust_rating from bookings
group by "Vehicle_Type"





-- 9. Calculate the total booking value of rides completed successfully:
 
select sum("Booking_Value") from successful_booking



-- 10. List all incomplete rides along with the reason:

create view all_incomplete_rides as
select "Booking_ID","Incomplete_Rides_Reason" from bookings where "Incomplete_Rides" = 'Yes'
group by "Booking_ID","Incomplete_Rides_Reason";














