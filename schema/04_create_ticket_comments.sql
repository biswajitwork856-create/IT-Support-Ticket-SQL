-- create ticket_comments table
CREATE TABLE ticket_comments (
  comment_id   INT PRIMARY KEY,
  ticket_id    INT REFERENCES tickets(ticket_id),
  comment_by   VARCHAR(100),
  comment_text TEXT,
  commented_at DATETIME
);

-- values insert into ticket_comments tables

INSERT INTO ticket_comments VALUES
(1,  1, 'Rahul Sharma', 'Issue received, checking logs',         '2024-01-05 09:15'),
(2,  1, 'Rahul Sharma', 'Password reset done, resolved',          '2024-01-05 11:30'),
(3,  2, 'Priya Mehta',  'Escalated to L2 for data sync',          '2024-01-06 11:00'),
(4,  2, 'Amit Roy',     'DB sync issue fixed after patch',        '2024-01-06 14:00'),
(5,  5, 'Sneha Gupta',  'KYC API timeout - investigating',        '2024-01-09 10:00'),
(6,  8, 'Amit Roy',     'Critical sync failure, team notified',   '2024-01-12 14:30'),
(7,  12,'Priya Mehta',  'KYC resolved after config update',      '2024-01-16 12:00'),
(8,  14,'Neha Joshi',   'Access rights being reviewed by admin', '2024-01-18 10:00');
