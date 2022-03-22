CREATE TABLE Sales_people (
  Snum INT ,
  Sname VARCHAR(40),
  city varchar(20),
  comm decimal(2,2),
  primary key(Snum),
  unique(Sname)
  
);
create table customers(
  Cnum int,
  Cname varchar(20),
  city varchar(20) not null default '',
  Snum int,
  primary key(Cnum),
  foreign key(Snum) references sales_people(Snum)
  );
  
create table orders(
 Onum int,
 Amt decimal(7,2),
 Odate date,
 Cnum int,
 Snum int,
 primary key(Onum),
 foreign key(Cnum) references customers(Cnum),
 foreign key (Snum) references Sales_people(Snum)
 );
 
  insert into sales_people values(1001, 'Peel', 'London' , .12);
  insert into sales_people values(1002 , 'Serres' ,'Sanjose', .13);
  insert into sales_people values(1004, 'Motika', 'London' ,.11);
  insert into sales_people values(1007, 'Rifkin', 'Barcelona', .15);
  insert into sales_people values(1003 ,'Axelrod' ,'Newyork' ,.10);
  
 insert into customers values (2001 , 'Hoffman', 'London', 1001);
 insert into customers values (2002  ,'Giovanni' ,'Rome', 1003); 
 insert into customers values (2003  ,'Liu', 'Sanjose', 1002);
 insert into customers values (2004 , 'Grass', 'Berlin', 1002);
 insert into customers values (2006, 'Clemens', 'London', 1001);
 insert into customers values (2008, 'Cisneros', 'Sanjose', 1007);
 insert into customers values (2007 ,'Pereira',' Rome', 1004);
 
 insert into orders values(3001, 18.69, '1990-10-3', 2008, 1007);
 insert into orders values(3003 ,767.19, '1990-10-3', 2001 ,1001);
 insert into orders values(3002 ,1900.10 ,'1990-10-3', 2007 ,1004);
 insert into orders values(3005  ,5160.45 ,'1990-10-3' ,2003 ,1002);
 insert into orders values(3006  ,1098.16 ,'1990-10-3' ,2008 ,1007);
 insert into orders values(3009 ,1713.23 ,'1990-10-4',2002 ,1003);
 insert into orders values(3007  ,75.75 ,'1990-10-4' ,2004 ,1002);
 insert into orders values(3008  ,4273.00 ,'1990-10-5',2006 ,1001);
 insert into orders values(3010  ,1309.95 ,'1990-10-6' ,2004 ,1002);
 insert into orders values(3011  ,9891.88, '1990-10-6', 2006 ,1001);
 
 #Count the number of Salesperson whose name begin with ‘a’/’A
 
 select count(Sname) 
 from sales_people
count where Sname like 'a%' ;

#Display all the Salesperson whose all orders worth is more than Rs. 2000


select Sname 
from sales_people
where Snum in (select Snum
from orders
where amt>2000

);

#Count the number of Salesperson belonging to Newyork.
select count(Sname)
from sales_people
where city like 'newyork';

#Display the number of Salespeople belonging to London and belonging to Paris.
select count(sname)
from sales_people
where city like 'paris' or city like 'london';

#Display the number of orders taken by each Salesperson and their date of orders.
SELECT 
    Snum, Odate, COUNT(*)
FROM
    orders
GROUP BY Snum , Odate;
