Select product_name, product_price from Products;

Select * from Products where category ='Electronics';

Select category from Products Group by category;


Select category,count(*) from Products
Group by category
Having count (*)>1;

Select * from Products order by Product_price DESC ;

Select * from Products limit 3;

Select product_name as Item_name ,product_price as item_price from Products;


Select Distinct category from Products ;

Select * from Products;