select * from restaurants

select * from orders

select * from staff

select * from customer

create or replace function get_cusine_with_dish(cust_id int, chief int, waiter int, tableno int, dish text, qty int, restaurantid int) 
    returns text as $$
        declare
        cusine text;
    begin
	
cusine = case 
        when dish = 'Biryani' then 'Indian'
        when dish = 'Nachos' then 'Mexican'
        when dish = 'Lasagna' then 'Italian'
        when dish = 'Ice Cream' then 'Dessert'
        when dish = 'Pizza' then 'Italian'
        when dish = 'Dal Makhani' then 'Indian'
        when dish = 'Pasta' then 'Italian'
        when dish = 'Kofta Curry' then 'Indian'
        when dish = 'Chocolate Cake' then 'Dessert'
        when dish = 'Lobster' then 'Seafood'
        when dish = 'Fried Rice' then 'Chinese'
        when dish = 'Paneer Tikka' then 'Indian'
        when dish = 'Manchurian' then 'Chinese'
        when dish = 'Green Curry' then 'Thai'
        when dish = 'Tacos' then 'Mexican'
        when dish = 'Butter Chicken' then 'Indian'
        when dish = 'BBQ Ribs' then 'Barbecue'
        when dish = 'Grilled Salmon' then 'Seafood'
        when dish = 'Grilled Chicken' then 'Barbecue'
        when dish = 'Spring Rolls' then 'Chinese'
        else 'Unkwon/Wrong Order'
   		end;

	insert into orders (cust_id, chief, waiter, tableno, dish, cusine, qty, restaurantid)
    		values (cust_id, chief, waiter, tableno, dish, cusine, qty, restaurantid);
   			return cusine;
	end;
	$$ language plpgsql;

select get_cusine_with_dish(1,2,3,4,'Pani Puri',6,1);

select get_cusine_with_dish(1,2,3,4,'Ice Cream',6,1);

select * from orders;




	