Select * from Products;

select * from Products where category ='Electronics';

select * from Products where category !='Electronics';

select * from Products where product_price>1000;

select * from Products where product_price<1000 and category ='Electronics';

select * from Products where product_price between 400 and 1000;

select * from Products where category ='Electronics' or category ='Fitness';

select * from Products where category in ('Electronics','Fitness');

Select * from Products where sku_code like '%123%';

Select * from Products where sku_code like '_B%';

Select * from Products where not category ='Electronics';
