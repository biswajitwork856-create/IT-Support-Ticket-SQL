-- customers table creation

CREATE TABLE customers (
  customer_id   INT PRIMARY KEY,
  customer_name VARCHAR(100),
  region        VARCHAR(50),
  plan_type     VARCHAR(30),
  email         VARCHAR(100)
);

-- Values insert into customers table

INSERT INTO customers VALUES
(1, 'Hindustan Unilever', 'West',  'Enterprise', 'hul@example.com'),
(2, 'ITC Limited',        'North', 'Enterprise', 'itc@example.com'),
(3, 'Dabur India',        'North', 'Standard',  'dabur@example.com'),
(4, 'Marico Ltd',         'West',  'Standard',  'marico@example.com'),
(5, 'Emami Ltd',          'East',  'Basic',     'emami@example.com'),
(6, 'Godrej Consumer',    'South', 'Enterprise', 'godrej@example.com'); 
