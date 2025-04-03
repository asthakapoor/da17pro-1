select * from orders

select DISTINCT cust_id from orders where restaurantid ='1'
select DISTINCT chief from orders where restaurantid ='1'
select DISTINCT waiter from orders where dish ='1'
select DISTINCT tableno from orders where cust_id ='1'
select DISTINCT cusine from orders where waiter ='1'
select DISTINCT waiter from orders where tableno ='1'
select DISTINCT qty from orders where cusine ='Indian'
select DISTINCT chief from orders where dish ='tacos'


