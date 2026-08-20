# 📈 Power BI - Business Establishments Analysis & Date Modeling

## 🎯 Project Overview
This project focuses on data modeling and architecture within Power BI, establishing dynamic date dimensions and evaluating historical business trends.

---

## 📐 Data Architecture & Model View

### DAX Implementation for Custom Dimension
```dax
Year = 
DISTINCT ( 
    SELECTCOLUMNS ( 
        CALENDAR ( DATE ( 1961, 1, 1 ), TODAY() ), 
        "Year", YEAR([Date]) 
    ) 
)
