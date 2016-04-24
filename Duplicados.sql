create table GeoLiteCity (country character(2),
    region character(2),city varchar(60),
    latitude decimal(7,3),longitude decimal(7,3));

 insert into GeoLiteCity (country,region,city,latitude,longitude) 
   (select country,region,city,avg(latitude),avg(longitude) 
    from gepiplitecity group by country,region,city);
    delete from GeoLiteCity where country='HN' and city = 'Managua'