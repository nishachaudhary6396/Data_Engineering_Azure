--To Convert the Name of Product in Upper Case
Select upper(product_name) from Products;

--To Convert the Name of Product in Lower Case
Select lower(product_name) from Products;

--To Count the length of sku
select length(sku_code) from Products;

--To Count the length of substring 
select substring('Sister in arms',9,2);

--To Extract the the starting 2 sku values 
select product_name,substring(sku_code,1,2) from Products;

--To get the values from the left
select left('Nisha',2);

--To get the values from the right
select right('Khushi',2);


--To concat the name with the category
select concat(product_name,' ',category) as product_with_category from products;

--To give the with separator so that we can give one time how to seperate the name
select concat_ws(' ',product_name,category) from Products;

--To replace the sku_code first 2 character
select product_name, replace(sku_code,left(sku_code,2),'GG') from Products;