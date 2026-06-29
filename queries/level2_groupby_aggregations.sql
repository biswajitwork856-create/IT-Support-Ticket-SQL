-- 6. Find out each agent handled how many tickets??
select agent_id, count(agent_id) as ticket_count from tickets group by agent_id; 

-- 7. Show Category wise all ticets.
select category, count(ticket_id) as ticket_count from tickets group by category order by ticket_count desc;

-- 8. Find the Average resolution times in hours for the solved tickets.
select truncate(avg(TIMESTAMPDIFF(minute, created_at, resolved_at)/60),2) 
 as Avg_Resolution_Time from tickets
  where resolved_at is not null;
  
  -- 9. Findout the Priority wise SLA breach Count.
  select priority, 
  count(ticket_id) as number_of_tickets, 
  sum(sla_breached) as sla_breached_ticket
   from tickets 
    group by priority  
    order by sla_breached_ticket desc ;
    
-- 10. Find out the agents who have resolved more than two tickets.
select agent_id, count(ticket_id) as ticket_count from tickets 
where status = "resolved"  
group by agent_id having ticket_count>2;
