# 🎫 IT Support Ticket Analysis — SQL Project

> A real-world SQL project built on a simulated IT support ticketing database.  
> Covers 25 queries across 5 levels — from basic SELECT to CTEs and Window Functions.

---

## 📌 Project Overview

This project demonstrates end-to-end SQL skills using a support ticket management system — inspired by real production support workflows in the FMCG/SaaS domain.

The database simulates a company's internal helpdesk system with agents, customers, tickets, and comments — and answers real business questions a Support Engineer or Data Analyst would face daily.

---

## 🗂️ Database Schema

```
agents            customers
─────────         ─────────────
agent_id    PK    customer_id  PK
agent_name        customer_name
team              region
shift             plan_type
joined_date       email

tickets                        ticket_comments
───────────────────────        ───────────────
ticket_id       PK             comment_id    PK
customer_id     FK             ticket_id     FK
agent_id        FK             comment_by
category                       comment_text
priority                       commented_at
status
created_at
resolved_at
sla_breached
```

---

## 📊 Levels Covered

### ✅ Level 1 — SELECT, WHERE, ORDER BY
| # | Query | Concept |
|---|-------|---------|
| 1 | Fetch all open tickets | WHERE, ORDER BY |
| 2 | Critical unresolved tickets | WHERE + AND |
| 3 | SLA breached tickets | BIT column filter |
| 4 | Today's tickets | CURDATE(), CAST |
| 5 | Top 5 oldest unresolved tickets | TOP + WHERE |

---

### ✅ Level 2 — GROUP BY & Aggregations
| # | Query | Concept |
|---|-------|---------|
| 1 | Tickets handled per agent | COUNT + GROUP BY |
| 2 | Tickets by category | Recurring issue detection |
| 3 | Average resolution time (hours) | AVG + TIMESTAMPDIFF |
| 4 | SLA breach count by priority | SUM on BIT column |
| 5 | Agents with more than 2 resolved tickets | HAVING |

---

### ✅ Level 3 — JOINs
| # | Query | Concept |
|---|-------|---------|
| 1 | Tickets with customer names | INNER JOIN |
| 2 | Full ticket report — customer + agent | 3-Table JOIN |
| 3 | Agent performance report | JOIN + GROUP BY + CASE WHEN |
| 4 | Customers with open tickets | LEFT JOIN |
| 5 | Critical ticket audit trail | JOIN with ticket_comments |

---

### ✅ Level 4 — Window Functions
| # | Query | Concept |
|---|-------|---------|
| 1 | Ticket sequence per agent | ROW_NUMBER + PARTITION BY |
| 2 | Best agent per team | RANK + PARTITION BY |
| 3 | Top 1 agent per team | ROW_NUMBER + Subquery |

---

### ✅ Level 5 — CTEs (Common Table Expressions)
| # | Query | Concept |
|---|-------|---------|
| 1 | SLA breach percentage by priority | Multiple CTEs + LEFT JOIN |
| 2 | Full agent performance dashboard | CTE + JOIN + Window Function |

---

## 💡 Key SQL Concepts Demonstrated

- `WHERE` vs `HAVING` — filtering before and after GROUP BY
- `INNER JOIN` vs `LEFT JOIN` — when to use which
- `CASE WHEN` — SQL's if-else for conditional aggregation
- `ROW_NUMBER()` vs `RANK()` — handling ties differently
- `CTE` vs `Subquery` — readability and reusability
- `TIMESTAMPDIFF`, `CURDATE()`, `ISNULL()`, `CAST` — MSSQL functions
- `SUM` on BIT columns — smart breach counting trick

---

## 🛠️ Tech Stack

| Tool | Usage |
|------|-------|
| **MSSQL Server** | Database engine |
| **SSMS** | Query execution |
| **SQL** | Data analysis & reporting |

---

## 🚀 How to Run

1. Open **SQL WORKBENCH**
2. Create a new database:
   ```sql
   CREATE DATABASE support_db;
   USE support_db;
   ```
3. Run scripts in this order:
   ```
   01_create_agents.sql
   02_create_customers.sql
   03_create_tickets.sql
   04_create_ticket_comments.sql
   ```
4. Then run any query file from the `/queries` folder

---

## 📁 Project Structure

```
IT-Support-Ticket-SQL/
│
├── README.md
├── schema/
│   ├── 01_create_agents.sql
│   ├── 02_create_customers.sql
│   ├── 03_create_tickets.sql
│   └── 04_create_ticket_comments.sql
│
└── queries/
    ├── level1_select_where.sql
    ├── level2_groupby_aggregations.sql
    ├── level3_joins.sql
    ├── level4_window_functions.sql
    └── level5_ctes.sql
```

---

## 👨‍💻 About

Built by **Biswajit Paul**  
📧 biswajitwork856@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/biswajit-paul-9248b0157)

> Currently working as a **Product Support Engineer** at Ivy Mobility Pvt. Ltd.  
> Experienced in MSSQL-based production support, incident management, and SaaS application troubleshooting in the FMCG domain.

---

## 📈 Resume Highlight

> *"Designed and executed 20+ SQL queries for IT support ticket analysis — covering JOINs, aggregations, window functions (RANK, ROW_NUMBER, LAG), and multi-CTE performance dashboards using MSSQL."*

⭐ **Star this repo if it helped you!**
