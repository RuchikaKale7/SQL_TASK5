CREATE table CAR_Details1(
	Make_ID INT PRIMARY KEY,
	Make VARCHAR(50),
	Model VARCHAR(50),
	Year INT,
	Engine_Size decimal(5,2),
	Fuel_Type VARCHAR(50),
	Price decimal(10,2),
	year_since_launch int
)
SELECT * FROM CAR_Details1

COPY CAR_Details1(Make_ID,Make,Model,Year,Engine_Size,Fuel_Type,Price,year_since_launch)
FROM 'D:\GITHUB\DA\SQL_TASK4\TASK4_Output.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM CAR_Details1

-----10 queries of group by, aggregate, having, where combination each query should have 3 combination.----
--=Query 1: Calculates the average price of cars by make and year for petrol cars with an average price above 20000.

select avg(price),make,year
from CAR_Details1
where fuel_type = 'Petrol'
group by make,year
having avg(price)>20000;

---Query 2: Counts the total number of cars by make and fuel type where the engine size is greater than 2.0 and the count is more than 10.

select make, fuel_type, count(*)AS total_cars
from CAR_Details1
where engine_size>2.0
group by make,fuel_type
having count(*)>10;

---Query 3: Computes the average engine size by year and fuel type for cars priced above 15000 with an average engine size above 2.5.

select year, fuel_type,avg(engine_size)as avg_engine_size
from CAR_Details1
where price>15000
group by year,fuel_type
having avg(engine_size)>2.5;

---Query 4: Finds the maximum price of cars by make and model where the years since launch are 10 or less and the maximum price is above 30000.

select make, model, max(price) as max_price
from CAR_Details1
where year_since_launch <=10
group by make,model
having max(price)>30000;

---Query 5: Counts cars by make and years since launch for diesel cars where the count is more than 5.

select make, year_since_launch, count(*)as car_count
from CAR_Details1
where fuel_type='diesel'
group by make,year_since_launch
having count(*)>5;

---Query 6: Sums the prices of cars by make and fuel type where the engine size is 1.5 or less and the total price exceeds 100000.

select make, fuel_type, sum(price) as total_price
from CAR_Details1
where engine_size <=1.5
group by make,fuel_type
having sum(price)>100000;

---Query 7: Calculates the average price by year and engine size for Toyota cars with an average price below 25000.

select year,engine_size, avg(price) as average_price
from CAR_Details1
where make='Toyota'
group by year, engine_size
having avg(price)<25000;

---Query 8: Finds the minimum engine size by make and fuel type for cars priced between 10000 and 20000 with a minimum engine size below 1.8.

select make, fuel_type ,min(engine_size)as min_engine_size
from CAR_Details1
where price between 10000 and 20000
group by make,fuel_type
having min(engine_size)<1.8;

---Query 9: Counts the number of models by year and make for electric cars where the count is more than 2.

select year, make, count(model)as model_count
from CAR_Details1
where fuel_type='Electric'
group by year,make
having count(model)>2;

---Query 10: Calculates the average years since launch by fuel type and make for cars priced above 20000 with an average years since launch below 5.

select fuel_type,make,avg(year_since_launch)as average_year_since_launch
from CAR_Details1
where price>20000
group by fuel_type,make
having avg(year_since_launch)<5;

---Query 11: Calculates the average engine size of cars priced above 30,000 grouped by make and model, and only includes groups with 
---an average engine size greater than 2.5 liters.

select make,model, avg(engine_size)as avg_engine_size
from CAR_Details1
where price > 30000
group by make,model
having avg(engine_size) > 2.5;