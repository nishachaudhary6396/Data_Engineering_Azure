select count(product_id) from Products;

select sum(product_price) from Products where category='Electronics';

select round(avg(product_price),2) from Products;

select min(product_price) from Products;

select max(product_price) from Products;