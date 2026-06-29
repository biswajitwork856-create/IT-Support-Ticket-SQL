-- Agent Table Creations 
CREATE TABLE agents (
  agent_id    INT PRIMARY KEY,
  agent_name  VARCHAR(100),
  team        VARCHAR(50),
  shift       VARCHAR(20),
  joined_date DATE
);

-- Values insert on Agent Table 
INSERT INTO agents VALUES
(1, 'Rahul Sharma',  'L1 Support', 'Morning', '2022-03-15'),
(2, 'Priya Mehta',   'L1 Support', 'Evening', '2022-06-01'),
(3, 'Amit Roy',      'L2 Support', 'Morning', '2021-11-20'),
(4, 'Sneha Gupta',   'L2 Support', 'Night',   '2023-01-10'),
(5, 'Vikram Das',    'L1 Support', 'Night',   '2023-05-22'),
(6, 'Neha Joshi',    'L2 Support', 'Morning', '2022-09-14'); 
