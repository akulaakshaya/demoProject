# demoProject

create table slam_cart (
c_id integer references slam_customers(cust_id),
    p_id integer references productsData(id)
)

create table slam_wishList (
c_id integer references slam_customers(cust_id),
    p_id integer references productsData(id)
)

