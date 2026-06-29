-- 11. Show Custoomers name along with tickets.
SELECT 
    ticket_id,
    agent_id,
    customers.customer_name,
    category,
    status,
    sla_breached
FROM
    tickets
        INNER JOIN
    customers ON tickets.customer_id = customers.customer_id;
 
 -- 12. fetch agent names along with customers and ticket details.
SELECT 
    ticket_id,
    agent_name,
    customer_name,
    Category,
    priority,
    status,
    sla_breached
FROM
    tickets
        INNER JOIN
    customers ON tickets.customer_id = customers.customer_id
        INNER JOIN
    agents ON tickets.agent_id = agents.agent_id;
 
 -- 13. fetch the agent wise performance tickets.
 
SELECT 
    agent_name,
    team,
    COUNT(ticket_id) AS total_tickets,
    SUM(sla_breached) AS breached_tickets,
    SUM(CASE
        WHEN status = 'resolved' THEN 1
        ELSE 0
    END) AS Resolved_tickets,
    SUM(CASE
        WHEN status != 'resolved' THEN 1
        ELSE 0
    END) AS pending_tickets
FROM
    tickets
        INNER JOIN
    agents ON tickets.agent_id = agents.agent_id
GROUP BY agent_name , team;
 
 -- alternative
 
SELECT 
    a.agent_name,
    a.team,
    COUNT(t.ticket_id) AS total_tickets,
    SUM(t.sla_breached) AS sla_breaches,
    SUM(CASE
        WHEN t.status = 'Resolved' THEN 1
        ELSE 0
    END) AS resolved_count
FROM
    agents a
        INNER JOIN
    tickets t ON a.agent_id = t.agent_id
GROUP BY a.agent_name , a.team
ORDER BY total_tickets DESC;

-- 14. Find the customer name wise tickets which have still pending.
SELECT 
    customer_name, ticket_id, Category, priority, status
FROM
    customers
        LEFT JOIN
    tickets ON customers.customer_id = tickets.customer_id
WHERE
    resolved_at IS NULL;

-- 15. Show tickets with the ticket comments.
SELECT 
    t.ticket_id,
    t.category,
    t.priority,
    t.status,
    c.comment_by,
    c.comment_text,
    c.commented_at
FROM
    tickets t
        INNER JOIN
    ticket_comments c ON t.ticket_id = c.ticket_id;
