use groceries;

#checking the data
select * from grocery;

#Update date format from string to date
update grocery
set dates = replace(dates, '-' , '/');
update grocery
set dates = str_to_date(dates, '%d/%m/%Y');

#total unique item sold
select count(distinct itemDescription) as unique_item from grocery;
select distinct itemDescription, count(itemDescription) as item_sold from grocery
group by itemDescription
order by count(itemdescription) desc;

#Total customer and customer purchase
select count(distinct Member_number) as unique_customer from grocery;
select Member_number as unique_customer, count(Member_number) as number_of_purchase from grocery
group by member_number
order by count(member_number) desc;

#item sold per day in specific year
#in 2014
select date(dates) as date_of_year, count(itemDescription) from grocery
where dates <= '2015'
group by date(dates)
order by date(dates) asc;

#in 2015
select date(dates) as date_of_year, count(itemDescription) from grocery
where dates > '2014-12-31'
group by date(dates)
order by date(dates) asc;

#item sold per month
select month(dates) as month_of_year, count(itemDescription) from grocery
where dates <= '2015'
group by month(dates)
order by month(dates) asc;

select month(dates) as month_of_year, count(itemDescription) from grocery
where dates > '2014-12-31'
group by month(dates)
order by month(dates) asc;

