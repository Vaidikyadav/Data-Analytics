
Clickstream Power BI Template - Contents & Instructions
------------------------------------------------------

Files included:
- theme.json             -> Power BI theme you can import (View -> Themes -> Browse for themes)
- dax_measures.txt       -> All core DAX measures (copy & paste into your model)
- powerquery_fWebEvents.m-> Example Power Query M script for loading fWebEvents.csv
- clickstream_dataset.zip -> (separate download) contains all CSVs

How to build the PBIX quickly:
1. Open Power BI Desktop.
2. Get Data -> Folder (or CSV) and point to the folder containing the CSVs from clickstream_dataset.zip.
   - Load: fWebEvents.csv, fOrders.csv, dDate.csv, dUser.csv, dSession.csv, dProduct.csv, dDevice.csv
3. In Power Query, apply the provided M script as a Reference or manually transform using the examples in powerquery_fWebEvents.m.
   - Replace the file path placeholder with your CSV path if copying the script.
4. Close & Apply.
5. Model: create relationships:
   - fWebEvents[UserID] -> dUser[UserID]
   - fWebEvents[SessionID] -> dSession[SessionID]
   - fOrders[SessionID] -> dSession[SessionID]
   - fOrders[UserID] -> dUser[UserID]
   - fWebEvents[Date] -> dDate[CalendarDate]
6. Home -> Switch Theme -> Import theme.json.
7. Create Measures: Copy measures from dax_measures.txt into new measures in Power BI.
8. Build Pages:
   - Page 1: Funnel Overview
     * KPI cards (Sessions, Orders, Conversion Rate %, AOV, Cart Abandonment)
     * Funnel visual / Sankey
     * Slicers: Date, DeviceType, TrafficSource, Browser
     * Table showing last page visited before abandonment
   - Page 2: Traffic & Campaign Analysis
     * Donut - Traffic Source
     * Column - Conversion Rate by Campaign
     * Line - Sessions over time
     * Bar - CPA by Source
   - Page 3: Drop-off Drill-through
     * Table with SessionID, UserID, LastPageVisited, EventTimestamp
     * Configure drill-through on EventName or Funnel Stage
9. Optional:
   - Add bookmarks for navigation
   - Use tooltips to show % drop-off between funnel stages
   - Publish to Power BI Service and schedule refresh

If you'd like, I can:
- Generate a zip that includes these template files (theme, DAX, PQ M) — already prepared.
- Produce mockup PNG images for each report page.

