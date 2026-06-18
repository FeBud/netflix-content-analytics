# 🎬 Netflix Content Analytics — Data Analyst Portfolio Project

![Netflix](https://img.shields.io/badge/Netflix-E50914?style=for-the-badge&logo=netflix&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Canva](https://img.shields.io/badge/Canva-00C4CC?style=for-the-badge&logo=canva&logoColor=white)

> End-to-end data analysis project on Netflix's content catalog — covering data quality checks, SQL-based EDA, interactive dashboard, and a full analytics report.

---

## 📊 Dashboard Preview

![Netflix Dashboard]([Screenshot_2026-06-11_153332.png](https://github.com/FeBud/netflix-content-analytics/blob/f23211d5ab9f0cc51ad343eeeb75d64255953cba/Screenshot%20Dashboard.png))

---

## 📁 Project Structure

```
netflix-content-analytics/
│
├── 📄 netflix_titles.csv               # Raw dataset (8,807 titles)
│
├── 🗄️ SQL/
│   ├── 01_data_quality_check.sql       # Missing values, duplicates, range checks
│   ├── 02_data_cleaning.sql            # Date conversion, whitespace trimming
│   ├── 03_create_views.sql             # Reusable views for multi-value columns
│   └── 04_eda.sql                      # Exploratory queries (genres, countries, trends)
│
├── 📊 Dashboard_Netflix.pbix           # Power BI interactive dashboard
│
├── 📑 Netflix_Content_Analytics_Report.pdf   # Full analytics report (9 pages)
│
├── 🖼️ Screenshot_Dashboard.png         # Dashboard preview
│
└── 📖 README.md
```

---

## 🎯 Project Objectives

- Perform a structured **data quality check** on the Netflix titles dataset
- Clean and standardize data using **SQL (PostgreSQL)**
- Create **reusable views** for multi-value columns (country, genre, director)
- Conduct **Exploratory Data Analysis (EDA)** to uncover content trends and patterns
- Build an **interactive Power BI dashboard** for business stakeholders
- Document findings in a **professional 9-page PDF report**

---

## 📌 Dataset

| Attribute | Detail |
|-----------|--------|
| Source | [Kaggle — Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) |
| Total Records | 8,807 titles |
| Columns | 12 (show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description) |
| Release Year Range | 1925 – 2021 |
| Date Added Range | 2008 – 2021 |

---

## 🔍 Key Findings

| # | Finding |
|---|---------|
| 1 | 🎬 **Movies dominate** the catalog at 69.62% vs 30.38% TV Shows |
| 2 | 🇺🇸 **United States leads** with 3,690 titles — 2x more than India (1,046) |
| 3 | 📈 **2018 was the peak year** — 1,147 total titles released |
| 4 | 🔞 **TV-MA is the top rating** (2,271 titles), reflecting an adult-focused strategy |
| 5 | 🌍 **International Movies** is the #1 genre, highlighting Netflix's global push |
| 6 | 📺 **TV Show growth accelerated post-2015**, nearly matching Movies by 2021 |

---

## 🗄️ SQL Workflow — 4 Phases

### Phase 1 — Data Quality Check (`01_data_quality_check.sql`)
```sql
-- Check missing values with percentage
SELECT
    COUNT(*) FILTER (WHERE director IS NULL) AS missing_director,
    ROUND(COUNT(*) FILTER (WHERE director IS NULL) * 100.0 / COUNT(*), 1) AS pct_director,
    COUNT(*) FILTER (WHERE country IS NULL) AS missing_country,
    ROUND(COUNT(*) FILTER (WHERE country IS NULL) * 100.0 / COUNT(*), 1) AS pct_country
FROM netflix;
```

### Phase 2 — Data Cleaning (`02_data_cleaning.sql`)
```sql
-- Convert text date to proper DATE format
ALTER TABLE netflix ADD COLUMN date_added_clean DATE;

UPDATE netflix
SET date_added_clean = TO_DATE(date_added, 'Month DD, YYYY')
WHERE date_added IS NOT NULL;
```

### Phase 3 — Create Views (`03_create_views.sql`)
```sql
-- Reusable view for multi-value country column
CREATE OR REPLACE VIEW vw_country_content AS
SELECT
    show_id,
    TRIM(UNNEST(STRING_TO_ARRAY(country, ','))) AS country_name
FROM netflix
WHERE country IS NOT NULL;
```

### Phase 4 — EDA (`04_eda.sql`)
```sql
-- Top 10 genres using reusable view
SELECT
    genre,
    COUNT(*) AS total_content
FROM vw_genres
GROUP BY genre
ORDER BY total_content DESC
LIMIT 10;
```

---

## 📈 Analysis Highlights

### Missing Values Summary
| Column | Missing Values | Missing % | Action Taken |
|--------|---------------|-----------|--------------|
| Director | 2,634 | 29.9% | Retained as NULL |
| Country | 831 | 9.4% | Filtered in analysis |
| Rating | 4 | 0.0% | Trimmed whitespace |
| Date Added | 10 | 0.1% | Excluded from time analysis |

### Top 10 Countries
| Rank | Country | Titles |
|------|---------|--------|
| 1 | 🇺🇸 United States | 3,690 |
| 2 | 🇮🇳 India | 1,046 |
| 3 | 🇬🇧 United Kingdom | 806 |
| 4 | 🇨🇦 Canada | 445 |
| 5 | 🇫🇷 France | 393 |
| 6 | 🇯🇵 Japan | 318 |
| 7 | 🇪🇸 Spain | 232 |
| 8 | 🇰🇷 South Korea | 231 |
| 9 | 🇩🇪 Germany | 226 |
| 10 | 🇲🇽 Mexico | 169 |

### Release Trend (2010–2021)
| Year | Movies | TV Shows | Total |
|------|--------|----------|-------|
| 2010 | 154 | 40 | 194 |
| 2015 | 398 | 162 | 560 |
| 2017 | 767 | 265 | 1,032 |
| 2018 | 767 | 380 | **1,147** ← Peak |
| 2019 | 633 | 397 | 1,030 |
| 2021 | 277 | 315 | 592 |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **PostgreSQL** | Data storage, cleaning & EDA |
| **Power BI** | Interactive dashboard & visualization |
| **Canva** | Report design (9-page PDF) |
| **GitHub** | Version control & portfolio hosting |

---

## 📑 Report

A full **9-page PDF analytics report** is included covering:
- Executive Summary & Key Findings
- Data Quality Assessment
- Visual EDA (7 charts)
- SQL Methodology (4 phases)
- Business Conclusions & Recommendations

📥 [Download Report](Netflix_Content_Analytics_Report.pdf)

---

## 🚀 How to Run

### Prerequisites
- PostgreSQL 13+
- Power BI Desktop

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/FeBud/netflix-content-analytics.git
   cd netflix-content-analytics
   ```

2. **Load the dataset into PostgreSQL**
   ```sql
   CREATE TABLE netflix (
       show_id      VARCHAR,
       type         VARCHAR,
       title        VARCHAR,
       director     VARCHAR,
       cast         TEXT,
       country      VARCHAR,
       date_added   VARCHAR,
       release_year INT,
       rating       VARCHAR,
       duration     VARCHAR,
       listed_in    VARCHAR,
       description  TEXT
   );

   COPY netflix FROM '/path/to/netflix_titles.csv'
   DELIMITER ',' CSV HEADER;
   ```

3. **Run SQL scripts in order**
   ```bash
   psql -d your_database -f SQL/01_data_quality_check.sql
   psql -d your_database -f SQL/02_data_cleaning.sql
   psql -d your_database -f SQL/03_create_views.sql
   psql -d your_database -f SQL/04_eda.sql
   ```

4. **Open the dashboard**
   Open `Dashboard_Netflix.pbix` in Power BI Desktop

---

## 📬 Contact

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ferdi-budiarsa)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/FeBud)

---

<p align="center">
  Made with ❤️ as a Data Analyst Portfolio Project — Ferdi Budiarsa
</p>
