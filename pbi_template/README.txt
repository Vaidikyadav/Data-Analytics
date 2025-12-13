Clickstream Power BI Template

Contents and Build Instructions

Files Included

theme.json – Custom Power BI theme
(Import via View → Themes → Browse for themes)

dax_measures.txt – Predefined DAX measures

powerquery_fWebEvents.m – Sample Power Query (M) script for loading fWebEvents.csv

clickstream_dataset.zip (separate download) – Contains all required CSV files

Steps to Build the Power BI Report (PBIX)
1. Load Data

Open Power BI Desktop.

Select Get Data → Folder (or CSV) and choose the folder containing the extracted CSV files.

Load the following tables:

fWebEvents.csv

fOrders.csv

dDate.csv

dUser.csv

dSession.csv

dProduct.csv

dDevice.csv

2. Transform Data (Power Query)

Open Power Query Editor.

Apply the provided M script (powerquery_fWebEvents.m) as a Reference, or manually replicate the transformations.

If copying the script, replace the file path placeholder with your local CSV path.

Select Close & Apply.

3. Create Data Model Relationships

Define the following relationships:

fWebEvents[UserID] → dUser[UserID]

fWebEvents[SessionID] → dSession[SessionID]

fOrders[SessionID] → dSession[SessionID]

fOrders[UserID] → dUser[UserID]

fWebEvents[Date] → dDate[CalendarDate]

4. Apply Theme

Go to Home → Switch Theme → Import Theme

Select theme.json

5. Create Measures

Copy the DAX formulas from dax_measures.txt

Create new measures in Power BI using these definitions

Report Pages to Build
Page 1: Funnel Overview

Visuals

KPI Cards:

Sessions

Orders

Conversion Rate (%)

Average Order Value (AOV)

Cart Abandonment Rate

Funnel or Sankey visual (user journey)

Table: Last page visited before abandonment

Slicers

Date

Device Type

Traffic Source

Browser

Page 2: Traffic & Campaign Analysis

Visuals

Donut Chart: Traffic Source distribution

Column Chart: Conversion Rate by Campaign

Line Chart: Sessions over time

Bar Chart: Cost per Acquisition (CPA) by Source
