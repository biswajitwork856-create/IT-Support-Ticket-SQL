
-- 19. find out the SLA Breached rate in percentage.

WITH total_tickets AS (
  SELECT   priority, COUNT(*) AS total
  FROM     tickets
  GROUP BY priority
),
breached_tickets AS (
  SELECT   priority, COUNT(*) AS breached
  FROM     tickets
  WHERE    sla_breached = 1
  GROUP BY priority
)
SELECT
  t.priority,
  t.total,
  case when ISNULL(b.breached) = 1 then 0 else b.breached end AS breached,
  ROUND(
    CAST(case when ISNULL(b.breached) = 1 then 0 else b.breached end AS FLOAT)
    / t.total * 100, 1
  ) AS breach_pct
FROM      total_tickets   t
LEFT JOIN breached_tickets b
       ON t.priority = b.priority
ORDER BY  breach_pct DESC;


-- 20. Create a full agent performance Dashboard.

WITH agent_ticket_stats AS (
  SELECT
    a.agent_id,
    a.agent_name,
    a.team,
    COUNT(t.ticket_id)                      AS total_tickets,
    SUM(CASE WHEN t.status = 'Resolved'
          THEN 1 ELSE 0 END)               AS resolved,
    SUM(t.sla_breached)                    AS breaches
  FROM       agents  a
  INNER JOIN tickets t ON a.agent_id = t.agent_id
  GROUP BY   a.agent_id, a.agent_name, a.team
),
agent_resolution_time AS (
  SELECT
    agent_id,
    ROUND(AVG(
      CAST(TIMESTAMPDIFF(MINUTE, created_at, resolved_at)
      AS FLOAT)) / 60, 1)                  AS avg_resolve_hrs
  FROM  tickets
  WHERE resolved_at IS NOT NULL
  GROUP BY agent_id
)
SELECT
  s.agent_name,
  s.team,
  s.total_tickets,
  s.resolved,
  s.breaches,
  r.avg_resolve_hrs,
  RANK() OVER (
    PARTITION BY s.team
    ORDER BY     s.resolved DESC
  ) AS team_rank
FROM      agent_ticket_stats   s
LEFT JOIN agent_resolution_time r
       ON s.agent_id = r.agent_id
ORDER BY  s.team, team_rank;