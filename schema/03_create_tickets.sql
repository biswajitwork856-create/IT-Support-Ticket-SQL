-- tickets table creation

CREATE TABLE tickets (
  ticket_id   INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  agent_id    INT REFERENCES agents(agent_id),
  category    VARCHAR(50),
  priority    VARCHAR(20),
  status      VARCHAR(20),
  created_at  DATETIME,
  resolved_at DATETIME,
  sla_breached BIT
);

-- values insert into tickets table

INSERT INTO tickets VALUES

(1,  1, 1, 'Login Issue',      'High',   'Resolved', '2024-01-05 09:00', '2024-01-05 11:30', 0),
(2,  2, 2, 'Data Sync Error',  'Critical','Resolved', '2024-01-06 10:00', '2024-01-06 14:00', 1),
(3,  3, 1, 'Access Denied',   'Medium', 'Open',     '2024-01-07 08:30', NULL, 0),
(4,  4, 3, 'Report Bug',      'Low',    'Resolved', '2024-01-08 13:00', '2024-01-09 10:00', 0),
(5,  1, 4, 'KYC Failure',     'Critical','In Progress','2024-01-09 09:15',NULL, 1),
(6,  5, 2, 'Login Issue',     'High',   'Resolved', '2024-01-10 11:00', '2024-01-10 13:00', 0),
(7,  6, 5, 'Token Error',     'High',   'Resolved', '2024-01-11 08:00', '2024-01-11 09:30', 0),
(8,  2, 3, 'Data Sync Error', 'Critical','Open',     '2024-01-12 14:00', NULL, 1),
(9,  3, 6, 'Access Denied',  'Medium', 'Resolved', '2024-01-13 10:00', '2024-01-13 15:00', 0),
(10, 4, 1, 'Report Bug',     'Low',    'Resolved', '2024-01-14 09:00', '2024-01-15 11:00', 0),
(11, 5, 4, 'Login Issue',    'High',   'Open',     '2024-01-15 16:00', NULL, 0),
(12, 6, 2, 'KYC Failure',    'Critical','Resolved', '2024-01-16 08:30', '2024-01-16 12:00', 1),
(13, 1, 5, 'Token Error',    'High',   'Resolved', '2024-01-17 10:00', '2024-01-17 11:00', 0),
(14, 2, 6, 'Access Denied', 'Medium', 'In Progress','2024-01-18 09:00',NULL, 0),
(15, 3, 3, 'Data Sync Error','Critical','Resolved', '2024-01-19 13:00', '2024-01-19 17:00', 1),
(16, 4, 4, 'Mapping issue', 'low', 'Resolved', '2026-06-27 10:00', '2026-06-27 11:15', 0);
