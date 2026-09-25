create  database  Airline_Booking;
use Airline_Booking;
create table flights(
booking_id int primary key,
passenger_name varchar(100) not null,
source_city varchar(50) not null,
destination_city varchar(50) not null,
airline varchar(50) not null,
flight_class varchar(20) not null,
ticket_price decimal(10,2)not null,
passenger_age int not null,
flight_duration_hours decimal(5,1) not null,
baggage_kg decimal(5,1) not null,
booking_status varchar(20),
payment_method varchar(30),
seat_number varchar(10) not null
);
select * from flights;
-- 1.Display the passenger name, source city, destination city and ticket price for all bookings.
select passenger_name,source_city,destination_city,ticket_price from flights;
-- 2.Find all bookings where the passenger is travelling from Hyderabad to Mumbai.
select * from flights where source_city = "Hyderabad" and destination_city = "Mumbai";
-- 3.Find bookings where the source city is Hyderabad, Bengaluru or Chennai.
select * from flights where source_city in("Hyderabad","chennai","Bengaluru");
-- 4.Find bookings where the destination city is Delhi, Mumbai or Kolkata and the ticket price is greater than ₹10,000.
select * from flights where destination_city in("Delhi","Mumbai","Kolkata") and ticket_price > 10000;
-- 5.Find passengers whose names start with the letter A.
select passenger_name  from flights where passenger_name like  "A%";
-- 6.Find bookings where the ticket price is between ₹5,000 and ₹15,000.
select * from flights where ticket_price between 5000 and 15000 ;
-- 7.Find passengers whose age is greater than 25 and whose flight class is Business.
select passenger_name from flights where passenger_age >25 and flight_class like "Business";
-- 8.Find bookings where the baggage weight is greater than 15 kg OR the ticket price is greater than ₹20,000.
select * from flights where baggage_kg >15 or ticket_price > 20000;
-- 9.Display all the different source cities available in the dataset.
select distinct source_city from flights;
-- 10 Display all the different source cities available in the dataset.
select distinct airline from flights;
-- 11.Find passengers whose names contain "an" and whose ticket price is less than ₹10,000.
select passenger_name from flights where passenger_name like "%an%" and ticket_price <10000 ;
-- 12.Find bookings where the flight duration is between 2 and 5 hours and the ticket price is less than ₹12,000.
select * from flights where flight_duration_hours between 2 and 5 and ticket_price <12000 ;
-- 13.Find bookings that are not from Hyderabad, Bengaluru or Chennai.
select * from flights where source_city not in ("hyderabad","Bengaluru","Chennai");
-- 14.Find bookings where the payment method is UPI or Credit Card, and the booking status is Confirmed.
select * from flights where payment_method in("UPI","Credit Card") and booking_status like "Confirmed";
-- 15.Display the passenger name and the ticket price after applying a 10% discount.
select passenger_name ,ticket_price *0.9 from flights ;
-- 16.Display the passenger name and the total luggage allowed amount, assuming the airline provides an additional 5 kg allowance over the recorded baggage.
select passenger_name ,baggage_kg +5 as  total_luggage_allowed  from flights ;
-- 17.Find bookings where the ticket price after a 10% discount is less than ₹8,000.
select *,ticket_price*0.9 from flights where ticket_price < 8000;
-- 18. Find passengers who are between 20 and 30 years old, travelling in Economy class, and whose ticket price is less than ₹10,000.
select passenger_name from flights where (passenger_age between 20 and 30) and flight_class like "Economy" and ticket_price < 10000 ;
-- 19. Find bookings where the source city is Hyderabad OR Bengaluru, and the flight duration is greater than 3 hours.
select * from flights where source_city in ("Hyderabad","Bengaluru")and  flight_duration_hours > 3 ;
-- 20. Find bookings where the destination city is not Delhi or Mumbai, and the ticket price is greater than ₹7,000.
select * from flights where source_city not in ("Delhi ","Mumbai")and  ticket_price > 7000  ;
-- 21 Display all bookings sorted by ticket price from highest to lowest.
select * from flights order by ticket_price desc ;
-- 22. Display all bookings sorted by passenger age from youngest to oldest.
select * from flights order by  passenger_age;
-- 23. Display bookings sorted by source city alphabetically, and within each city, sort by ticket price from highest to lowest.
select * from flights order by source_city asc,ticket_price desc;
-- 24.Display the 5 most expensive bookings.
select * from flights order by ticket_price desc limit 5;
-- 25. select * from flights order by source_city asc,ticket_price desc
select * from flights order by ticket_price asc limit 5;
-- 26. Find the 5 longest flights.
select * from flights order by flight_duration_hours desc limit 5;
-- 27. Find bookings from Hyderabad, sort them by ticket price from highest to lowest, and display only the top 5
select * from flights where source_city like "Hyderabad"order by ticket_price desc limit 5 ;
-- 28 Find bookings where the ticket price is between ₹5,000 and ₹20,000, sort them by ticket price from highest to lowest, skip the first 5 and display the next 5
select * from flights where ticket_price between 5000 and 20000 order by ticket_price desc limit 5 offset 5 ;
-- 29. Find the different destination cities for bookings made by passengers whose names start with A.
select distinct destination_city  from flights where passenger_name like "A%";
-- 30.  Final Challenge
-- Find bookings where:
-- Source city is Hyderabad, Bengaluru or Chennai
-- Destination city is Mumbai, Delhi or Kolkata
-- Ticket price is between ₹5,000 and ₹20,000
-- Passenger age is greater than 25
-- Booking status is Confirmed
-- Sort the results by ticket price from highest to lowest and display only the top 5.
select * from flights where (Source_city in ("Hyderabad","Bengaluru", "Chennai"))
and (Destination_city in("Mumbai", "Delhi" ,"Kolkata")) and (ticket_price between 5000 and 20000) 
and (passenger_age > 25) and booking_status like "Confirmed" 
order by ticket_price desc limit 5 ;

;















