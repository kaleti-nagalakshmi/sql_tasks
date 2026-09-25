use Airline_Booking;
create table flight(
booking_id int primary key,
passenger_name varchar(100) not null,
source_city varchar(50) not null,
destination_city varchar(50) not null,
airline varchar(50) not null,
flight_class varchar(20) not null,
Tablesticket_price decimal(10,2)not null,
passenger_age int not null,
flight_duration_hours decimal(5,1) not null,
baggage_kg decimal(5,1) not null,
booking_status varchar(20),
payment_method varchar(30),
seat_number varchar(10) not null
);
select * from flight;
-- Q1. How many bookings are present in the flights table?
select count(*)from flight;
select sum(ticket_price) as total_revenue from flight;

select avg(ticket_price) as total_revenue ,
min(ticket_price) as cheapest_ticket, max(ticket_price) as expensive_ticket 
from flight;

select count(*) as number_of_bookings,sum(ticket_price) as total_revenue, avg(ticket_price)
 as avg_ticket_price from flight
 where flight_class = "Business";

--  Part 2 — GROUP BY
select count(*),airline  from flight 
group by airline ;

select airline ,sum(ticket_price) as total_revenue from flight 
group by airline ;

select airline,avg(ticket_price) as avg_ticket_price from flight
group by airline ;

select airline ,count(*) as number_of_bookings ,
sum(ticket_price) as Total_revenue,
avg(ticket_price) as Average_ticket_price,
min(ticket_price) as cheapest_ticket,
max(ticket_price) as expensive_ticket
from flight
group by airline;


select  source_city,count(*) as number_of_bookings ,sum(ticket_price) as total_revenue
from flight 
group by source_city ;


select flight_class,avg(ticket_price) as avg_ticket_price
from flight
group by flight_class;

--  Part 3 — WHERE + GROUP BY + HAVING
select airline,count(ticket_price) as num_of_flight from flight
where ticket_price > 5000 
group by airline
having count(*) > 5;

select airline, sum(ticket_price) as total_revenue
from flight
where ticket_price > 7000
group by airline
having total_revenue > 80000;


select  avg(ticket_price) as avg_ticket_price 
from flight
where flight_class = "business"
group by source_city
having avg_ticket_price > 10000;

select  airline ,booking_status ,count(*) as num_of_bookings
from flight
where ticket_price > 5000 and booking_status = "confirmed"
group by airline
having count(*)>5;

select airline, avg(ticket_price) as avg_ticket_price 
from flight
where  passenger_age between 20 and 35 
group by airline
having avg_ticket_price > 12000;


 -- Part 4 — HAVING + ORDER BY
select airline, count(*) as num_of_bookings from flight
group by airline 
having num_of_bookings > 10
order by num_of_bookings desc;

select airline ,sum(ticket_price) as total_revenue from flight
group by airline 
having total_revenue > 100000
order by total_revenue desc;


select source_city ,count(*) as num_of_bookings from flight
group by source_city 
having num_of_bookings > 10
order by num_of_bookings desc;

-- Part 5 — Aggregation + ORDER BY + LIMIT
select airline,sum(ticket_price)as total_revenue from flight
group by airline  
order by total_revenue desc
limit 1;

select airline,sum(ticket_price)as total_revenue from flight
group by airline  
order by total_revenue desc
limit 3  ;

select airline,avg(ticket_price)as avg_ticket_price from flight
group by airline  
order by avg_ticket_price desc
limit 3  ;


select source_city,count(*)as number_of_bookings from flight
group by source_city
order by number_of_bookings desc
limit 3  ;

select case 
 when passenger_age between 18 and 25 then "Young"
when passenger_age between 26 and 35 then "adult"
else "senior"
end as age_category,passenger_age,passenger_name ,count(*)from flight
group by age_category,assenger_age,passenger_name;


select  
case 
when ticket_price < 7000 then "Budget"
when ticket_price between 7000 and 15000 then "Standard"
when ticket_price> 15000 then "premium"
end as category_ticket_price , passenger_name,ticket_price,count(*)
from flight
group by category_ticket_price, passenger_name,ticket_price;


select case 
when flight_duration_hours <3 then "Short"
when flight_duration_hours between 3 and 5 then "Medium"
when flight_duration_hours >5 then "Long"
end as duration_category,passenger_name,count(*) as flight_duration from flights
group by duration_category,passenger_name;


select  
case 
when ticket_price < 7000 then "Budget"
when ticket_price between 7000 and 15000 then "Standard"
when ticket_price> 15000 then "premium"
end as category_ticket_price,count(*)
from flight
group by category_ticket_price ;


select  
case 
when ticket_price < 7000 then "Budget"
when ticket_price between 7000 and 15000 then "Standard"
when ticket_price> 15000 then "premium"
end as category_ticket_price,count(*),sum(ticket_price)as total_revenue
from flight
group by category_ticket_price ;


select source_city,count(*)as number_of_bookings from flight
group by source_city
order by number_of_bookings desc
limit 3  ;

select case 
 when passenger_age between 18 and 25 then "Young"
when passenger_age between 26 and 35 then "adult"
else "senior"
end as age_category,count(*)from flight
group by age_category;

select airline,sum(ticket_price) as total_revenue,count(*) as num_of_bookings,
avg(ticket_price)as avg_ticket_price
from flight
where booking_status = "confirmed" and ticket_price between 5000 and 20000
group by airline
having  num_of_bookings > 5 and avg_ticket_price > 10000
order by total_revenue desc ;


select airline,count(*) as num_of_bookings,avg(ticket_price) as avg_ticket_price ,
sum(ticket_price)as total_revenue from flight 
where passenger_age > 20
group by airline
having  num_of_bookings > 10 and avg_ticket_price > 10000 and total_revenue > 100000
order by total_revenue desc
limit 3;






