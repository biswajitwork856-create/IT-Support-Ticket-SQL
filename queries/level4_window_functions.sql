-- 16. Give numbering of every agents ticket by priotirize the older one first.
select a.agent_id,a.agent_name,
t.ticket_id,t.category,t.priority,t.status,t.created_at,
 row_number() over( PARTITION BY agent_id ORDER BY created_at asc) as Row_Num from 
 tickets t inner join agents a on t.agent_id = a.agent_id;
 
 -- 17. Find out the best performing agent in the team.

 select  
 agent_name,
 team,
 count(ticket_id) as total_tickets,
 sum(sla_breached) as breached_tickets,
 sum(CASE when status = 'resolved' Then 1 else 0 end) as Resolved_tickets,
 sum(CASE when status != 'resolved' Then 1 else 0 end) as pending_tickets,
 dense_rank() over( partition by team order by sum(CASE when status = 'resolved' Then 1 else 0 end) / count(ticket_id) desc) as agent_rank
 from tickets inner join agents on 
 tickets.agent_id = agents.agent_id
 group by agent_name,team;
 
 -- 18 find the top performer from each team based on ticket resolveing
 
 select  
 agent_name,
 team, total_tickets,resolved_tickets, agent_rank
 from(
 select a.agent_name,
 a.team,
 count(t.ticket_id) as total_tickets,
 sum(CASE when t.status = 'resolved' Then 1 else 0 end) as Resolved_tickets,
 row_number() over( partition by a.team order by sum(CASE when t.status = 'resolved' Then 1 else 0 end) / count(t.ticket_id) desc) as agent_rank
 from tickets t inner join agents a on 
 t.agent_id = a.agent_id
 group by a.agent_name,a.team
 ) ranking
 where agent_rank = 1;
 
 # alternative --->
 
 SELECT agent_name, team, total_tickets, rn
FROM (
  SELECT
    a.agent_name,
    a.team,
    COUNT(t.ticket_id) AS total_tickets,
    ROW_NUMBER() OVER (
      PARTITION BY a.team
      ORDER BY     COUNT(t.ticket_id) DESC
    ) AS rn
  FROM       agents  a
  INNER JOIN tickets t ON a.agent_id = t.agent_id
  GROUP BY   a.agent_name, a.team
) ranked
WHERE rn = 1;
