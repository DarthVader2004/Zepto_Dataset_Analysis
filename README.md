# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

This is a complete, real-world data analyst portfolio project based on an e-commerce inventory dataset scraped from Zepto — one of India's fastest-growing quick-commerce startups. This project simulates real analyst workflows, from raw data exploration to business-focused data analysis.

**Perfect for:**
📊 Data Analyst aspirants building a strong portfolio for interviews and LinkedIn  
📚 Anyone learning SQL with hands-on practice  
💼 Preparing for interviews in retail, e-commerce, or product analytics

## 📌 Project Overview

This project simulates how actual data analysts in the e-commerce industry work behind the scenes, using SQL to:

✅ Set up a messy, real-world e-commerce inventory database  
✅ Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies  
✅ Implement Data Cleaning to handle null values, remove invalid entries, and standardize pricing  
✅ Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, and revenue

## 📁 Dataset Overview

The dataset was sourced from Kaggle and originally scraped from Zepto's official product listings. It mimics what you'd typically encounter in a real-world e-commerce inventory system.

**Key Characteristics:**
- Each row represents a unique SKU (Stock Keeping Unit)
- Duplicate product names exist due to different package sizes, weights, discounts, or categories
- Contains real-world data inconsistencies that require cleaning
- Pricing data originally in paise (Indian currency subunit)

### 🧾 Database Schema

| Column | Data Type | Description |
|--------|-----------|-------------|
| `sku_id` | SERIAL PRIMARY KEY | Unique identifier for each product entry |
| `category` | VARCHAR(120) | Product category (Fruits, Snacks, Beverages, etc.) |
| `name` | VARCHAR(150) | Product name as displayed on the app |
| `mrp` | NUMERIC(8,2) | Maximum Retail Price (converted to ₹) |
| `discountPercent` | NUMERIC(5,2) | Discount percentage applied |
| `discountedSellingPrice` | NUMERIC(8,2) | Final price after discount |
| `availableQuantity` | INTEGER | Units available in inventory |
| `weightInGms` | INTEGER | Product weight in grams |
| `outOfStock` | BOOLEAN | Stock availability flag |
| `quantity` | INTEGER | Number of units per package |

## 🔧 Database Setup

### 1. Table Creation
The database table is designed to handle e-commerce inventory data with appropriate data types for pricing, quantities, and product information.

```sql
CREATE TABLE zepto(
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);
```

### 2. Data Import Process
Data can be imported using pgAdmin's CSV import feature or command-line tools. The original dataset required UTF-8 encoding to handle special characters in product names.

## 🔍 Data Exploration Phase

### Initial Data Assessment
The exploration phase involves understanding the dataset structure, identifying data quality issues, and getting familiar with the business domain.

**Key Findings:**
- Dataset contains multiple product categories across grocery and household items
- Products appear multiple times with different SKUs (different sizes, packages)
- Stock availability varies significantly across categories
- Pricing data needs conversion from paise to rupees

### Data Quality Analysis
Comprehensive checks revealed:
- Missing values in various columns requiring handling
- Invalid pricing entries (zero values) that need removal
- Inconsistent data formats requiring standardization

## 🧹 Data Cleaning Process

### Currency Conversion
One of the major cleaning tasks involved converting pricing from paise to rupees for better readability and analysis:

```sql
UPDATE zepto 
SET mrp = mrp/100.0,
    discountedSellingPrice = discountedSellingPrice/100.0;
```

### Invalid Data Removal
Products with zero pricing were identified and removed as they represent data entry errors:

```sql
DELETE FROM zepto WHERE mrp = 0;
```

## 📊 Business Intelligence Analysis

### Q1: Top Value Products Analysis
**Business Purpose:** Identify products offering maximum savings to customers for promotional campaigns.

**Approach:** Ranked products by discount percentage to find best deals.

### Q2: High-Value Out-of-Stock Analysis
**Business Purpose:** Prioritize restocking for expensive products to minimize revenue loss.

**Approach:** Filtered high-MRP products (>₹300) that are currently out of stock.

### Q3: Revenue Estimation by Category
**Business Purpose:** Calculate potential revenue for inventory planning and category performance assessment.

**Key Insight:** Multiplied selling price by available quantity to estimate maximum possible revenue per category.

### Q4: Premium Product Discount Analysis
**Business Purpose:** Identify luxury items with minimal discounts to understand pricing strategy.

**Approach:** Found products with MRP >₹500 and discount <10% to analyze premium positioning.

### Q5: Category-wise Discount Performance
**Business Purpose:** Understand which categories are most price-competitive and customer-friendly.

**Method:** Calculated average discount percentage across all categories to identify top 5 performers.

### Q6: Price Per Gram Value Analysis
**Business Purpose:** Help customers and analysts identify best value-for-money products by weight.

**Calculation:** Divided selling price by weight to determine cost efficiency per gram.

### Q7: Product Weight Categorization
**Business Purpose:** Segment products for inventory management and logistics planning.

**Categories Defined:**
- Low: <1000g (small packages)
- Medium: 1000-5000g (family sizes)
- Bulk: >5000g (wholesale/bulk items)

### Q8: Inventory Weight Distribution
**Business Purpose:** Understand storage requirements and logistics planning needs by category.

**Analysis:** Calculated total weight of inventory per category by multiplying product weight with available quantity.

## 📈 Key Business Insights Delivered

### Inventory Management
- Identified critical out-of-stock items requiring immediate restocking
- Calculated total inventory weight for logistics planning
- Segmented products by size categories for efficient storage

### Pricing Strategy
- Analyzed discount patterns across categories
- Identified premium products with minimal discounts
- Calculated price-per-gram metrics for value positioning

### Revenue Optimization
- Estimated potential revenue by category
- Identified high-value products for priority focus
- Analyzed discount effectiveness across product lines

### Customer Value Analysis
- Ranked products by discount percentage for promotional campaigns
- Identified best value-for-money products by weight
- Analyzed category-wise pricing competitiveness

## 🚀 Skills Demonstrated

**Technical Skills:**
- Database design and table creation
- Data import and encoding handling
- SQL query optimization and complex aggregations
- Data cleaning and transformation techniques

**Analytical Skills:**
- Business problem identification and solution design
- KPI calculation and metric development
- Data quality assessment and improvement
- Trend analysis and pattern recognition

**Business Intelligence:**
- Translating business questions into SQL queries
- Revenue forecasting and inventory planning
- Pricing strategy analysis
- Customer value proposition assessment

## 📚 Data Sources & Context

**Primary Source:** Kaggle dataset originally scraped from Zepto's live product listings  
**Data Authenticity:** Real-world e-commerce inventory data with actual inconsistencies  
**Business Context:** Quick-commerce startup inventory management  
**Data Volume:** Comprehensive product catalog across multiple categories  
**Time Relevance:** Current market pricing and availability data

## 🎯 Project Value

This project demonstrates real-world data analyst capabilities by:

- **Handling Messy Data:** Working with incomplete, inconsistent real-world datasets
- **Business Context:** Solving actual e-commerce industry problems
- **End-to-End Analysis:** From raw data to actionable business insights
- **Practical Application:** Skills directly applicable to retail and e-commerce roles

## 💡 Learning Outcomes

By completing this project, you'll gain experience in:
- Setting up databases for business analytics
- Cleaning and preparing real-world datasets
- Writing SQL queries that answer business questions
- Presenting technical analysis in business context
- Understanding e-commerce metrics and KPIs

---

*This project bridges the gap between academic SQL learning and real-world business analytics, providing hands-on experience with the types of challenges data analysts face in the e-commerce industry.*