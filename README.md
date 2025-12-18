# video-rental-analytics

## Описание проекта

В рамках проекта проводился анализ продаж для сети видеопроката.

### Цель исследования

Проанализировать продажи для сети видеопроката:
- Провести предобработку данных;
- Провести исследовательский анализ данных;
- Сформулировать и проверить статистические гипотезы:
  - *Гипотеза различия среднемесячной выручки для жанров «Action» и «Comedy»*;
  - *Гипотеза различия общей выручки клиентов сегментов High value и Medium value*;

По результатам исследования был подготовлен [дашборд](https://github.com/Shponarskii/video-rental-analytics/blob/main/dashboard/dashboard.png), отражающий ключевые финансовые показатели сети видеопроката и позволяющий отслеживать динамику выручки по месяцам и жанрам фильмов.

### Входные данные

Входные данные представляют собой 4 датасета в формате csv, содержащие агрегированные данные о выручке по жанрам и категориям, активности аренды по времени, а также LTV клиентов, подготовленные на основе транзакций видеопроката. Датасеты получены на основе пользовательских sql-запросов, сформированных по безе данных видеопроката [Pagila](https://github.com/devrimgunduz/pagila). 

## Дашборд

<p align="center">
    <img src="dashboard/dashboard.png" width="900">
</p>

## Используемые инструменты

* PostgreSQL
* Python (библиотеки: pandas, numpy, matplotlib, seaborn, scipy)
* Jupyter Notebook
* Power BI

## Структура проекта

```tree
video-rental-analytics/
│
├── csv/
│   ├── customer_ltv.csv
│   ├── rental_activity_by_weekday_and_hour.csv
│   ├── revenue_by_category.csv
│   └── revenue_by_genre_per_month.csv
│
├── dashboard/
│   ├── dashboard.png
│   └── video_rental_dashboard.pbix
│
├── data/
│   ├── pagila-insert-data.sql
│   └── pagila-schema.sql
│
├── sql/
│   ├── customer_ltv.sql
│   ├── rental_activity_by_weekday_and_hour.sql
│   ├── rental_count_by_month.sql
│   ├── revenue_by_category.sql
│   ├── revenue_by_genre_per_month.sql
│   ├── revenue_by_month.sql
│   ├── revenue_by_month_per_store.sql
│   ├── revenue_by_store.sql
│   ├── top_10_films_by_revenue.sql
│   └── top_customers_by_rental.sql
│
├── .gitignore
├── README.md
└── video_rental_analysis.ipynb
```