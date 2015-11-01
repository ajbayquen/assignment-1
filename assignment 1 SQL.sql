
-- Question 1
select distinct dest from flights
where distance = (select max(distance) from flights);

-- Question 2
select distinct engines from planes order by engines;

select tailnum, year, type, manufacturer, model, engines, seats from planes x
where x. seats = (select max(y.seats) from planes y 
                  where y.engines = x.engines )
order by engines;  

-- Question 3
select count(distinct flight) from flights;

-- Question 4
select carrier, count(distinct flight) from flights
group by carrier; 

-- Question 5
select carrier, count(distinct flight) from flights
group by carrier
order by 2 desc; 

-- Question 6
select carrier, count(distinct flight) from flights
group by carrier
order by 2 desc
limit 5; 

-- Question 7
select carrier, count(distinct flight) from flights
where distance >= 1000
group by carrier
order by 2 desc
limit 5; 

-- Question 8
-- What was the average tempature for the different origin points for February, 2013
 select origin, avg(temp) from weather
where year = 2013 and month= 2
group by origin;






