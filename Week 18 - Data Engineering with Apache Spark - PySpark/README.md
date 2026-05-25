# Week 18 - Data Engineering with Apache Spark - PySpark

## Bundesliga Football Analysis Pipeline

### Pipeline Stages
1. **Loading & Prep** — CSV → PySpark DataFrame
2. **Indicators** — HomeTeamWin, AwayTeamWin, GameTie
3. **Filtering** — Bundesliga D1, Seasons 2000–2015
4. **Aggregations** — Home & Away stats separately
5. **Join** — Merge home + away per team/season
6. **Metrics** — GoalsScored, GoalsAgainst, Win%, GoalDifferential, etc.
7. **Ranking** — Window function by season (Win% → Goal Diff)
8. **Export** — Partitioned Parquet + Champions Parquet
9. **Visualization** — 3 charts of champion performance

### Outputs
| File | Description |
|------|-------------|
| `football_stats_partitioned/` | All teams, partitioned by Season (Parquet) |
| `football_top_teams/` | Season champions only (Parquet) |
| `visuals/` | 3 PNG charts |
| `*.ipynb` | Colab notebook with full pipeline |

### Tech Stack
- PySpark
- Google Colab
- Matplotlib / Seaborn
- Parquet (partitioned storage)
