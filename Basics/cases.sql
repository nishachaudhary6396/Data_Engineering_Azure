Select * from Products;

alter table Products
add column price_tag text;

update Products
Set price_tag= 
CASE when (product_price >1000) then 'Expensive'
when product_price  between 500 and 1000 then 'Moderate'
ELSE 'Cheap'
END ;


Select product_name ,
case when is_available then 'IN Stock'
else 'Out of Stock'
end as availability_status 
from Products;

select product_name , stock_quantity,
case when (stock_quantity>100) then 'High Stock'
when stock_quantity between 30 and 100 then 'Medium Stock'
else 'Low Stock'
END as Stock_status from Products;