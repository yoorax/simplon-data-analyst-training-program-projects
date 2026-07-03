# Data Dictionary and Power BI Modeling Architecture

This document provides a complete overview of the cleaned dataset schemas and the structural relationships modeled inside Power BI.

---

## Part 1: Clean Data Dictionary

### 1. Customer Dimension Table (`olist_customer`)
*   **`customer_unique_id`** (Primary Key)
    *   *Description:* Unique identifier assigned to each physical buyer. Used to track repeat purchases.
    *   *Data Type:* String / Object
*   **`customer_zip_code_prefix`** (Foreign Key)
    *   *Description:* 5-digit zip code prefix of the customer's delivery address.
    *   *Data Type:* Integer (`int32`)
*   **`customer_city`**
    *   *Description:* Standardized name of the city where the customer is located.
    *   *Data Type:* Categorical
*   **`customer_state`**
    *   *Description:* Two-letter abbreviation of the state where the customer is located.
    *   *Data Type:* Categorical

---

### 2. Geolocation Lookup Table (`olist_geolocation`)
*   **`geolocation_zip_code_prefix`** (Primary Key)
    *   *Description:* Unique 5-digit zip code prefix acting as the geographical locator.
    *   *Data Type:* Integer (`int32`)
*   **`geolocation_lat`**
    *   *Description:* Calculated latitude coordinate representing the centroid of the zip code sector.
    *   *Data Type:* Floating Point (`float32`)
*   **`geolocation_lng`**
    *   *Description:* Calculated longitude coordinate representing the centroid of the zip code sector.
    *   *Data Type:* Floating Point (`float32`)
*   **`geolocation_city`**
    *   *Description:* Standardized city name associated with the zip code.
    *   *Data Type:* Categorical
*   **`geolocation_state`**
    *   *Description:* State abbreviation associated with the zip code.
    *   *Data Type:* Categorical

---

### 3. Orders Table (`olist_orders`)
*   **`order_id`** (Primary Key)
    *   *Description:* Unique identifier assigned to each customer transaction/order.
    *   *Data Type:* String / Object
*   **`customer_unique_id`** (Foreign Key)
    *   *Description:* Links the order back to the unique customer record in `olist_customer`.
    *   *Data Type:* String / Object
*   **`order_status`**
    *   *Description:* Current fulfillment status of the order (e.g., delivered, shipped, canceled).
    *   *Data Type:* Categorical
*   **`order_purchase_date`**
    *   *Description:* Date and time when the customer placed the order.
    *   *Data Type:* DateTime (UTC)
*   **`order_approved_date`**
    *   *Description:* Date and time when the order payment was approved. Contains null values for non-approved stages.
    *   *Data Type:* DateTime (UTC)
*   **`order_delivered_carrier_date`**
    *   *Description:* Date and time when the package was handed over to the shipping carrier.
    *   *Data Type:* DateTime (UTC)
*   **`order_delivered_customer_date`**
    *   *Description:* Date and time when the carrier delivered the package to the customer.
    *   *Data Type:* DateTime (UTC)
*   **`order_estimated_delivery_date`**
    *   *Description:* Target delivery date promised to the customer at the time of purchase.
    *   *Data Type:* DateTime (UTC)

---

### 4. Order Items Fact Table (`olist_order_items`)
*   **`order_id`** (Foreign Key)
    *   *Description:* Links the item back to its parent transaction record in `olist_orders`.
    *   *Data Type:* String / Object
*   **`order_item_id`**
    *   *Description:* Sequential number identifying the item line within a single order (e.g., 1, 2, 3).
    *   *Data Type:* Integer (`int16`)
*   **`product_id`** (Foreign Key)
    *   *Description:* Unique identifier of the purchased product. Links to `olist_products`.
    *   *Data Type:* String / Object
*   **`seller_id`** (Foreign Key)
    *   *Description:* Unique identifier of the merchant who fulfilled the product. Links to `olist_sellers`.
    *   *Data Type:* String / Object
*   **`shipping_limit_date`**
    *   *Description:* Shipping deadline set for the seller to hand over the product to the carrier.
    *   *Data Type:* DateTime (UTC)
*   **`price`**
    *   *Description:* Sale price of the individual item.
    *   *Data Type:* Floating Point (`float32`)
*   **`freight_value`**
    *   *Description:* Shipping cost paid by the customer for this specific item.
    *   *Data Type:* Floating Point (`float32`)

---

### 5. Products Dimension Table (`olist_products`)
*   **`product_id`** (Primary Key)
    *   *Description:* Unique identifier for each product listed on the marketplace.
    *   *Data Type:* String / Object
*   **`product_category_name`**
    *   *Description:* Main category name of the product. Missing entries are designated as "unknown".
    *   *Data Type:* Categorical
*   **`product_name_length`**
    *   *Description:* Number of characters in the product's public title. Imputed with median.
    *   *Data Type:* Integer (`int16`)
*   **`product_description_length`**
    *   *Description:* Number of characters in the product's detail page. Imputed with median.
    *   *Data Type:* Integer (`int16`)
*   **`product_photos_qty`**
    *   *Description:* Count of public images displayed on the product listing. Imputed with median.
    *   *Data Type:* Integer (`int16`)
*   **`product_weight_g`**
    *   *Description:* Weight of the product in grams. Imputed with median.
    *   *Data Type:* Floating Point (`float32`)
*   **`product_length_cm`**
    *   *Description:* Length dimension of the product packaging. Imputed with median.
    *   *Data Type:* Floating Point (`float32`)
*   **`product_height_cm`**
    *   *Description:* Height dimension of the product packaging. Imputed with median.
    *   *Data Type:* Floating Point (`float32`)
*   **`product_width_cm`**
    *   *Description:* Width dimension of the product packaging. Imputed with median.
    *   *Data Type:* Floating Point (`float32`)

---

### 6. Sellers Dimension Table (`olist_sellers`)
*   **`seller_id`** (Primary Key)
    *   *Description:* Unique identifier assigned to each seller.
    *   *Data Type:* String / Object
*   **`seller_zip_code_prefix`**
    *   *Description:* 5-digit zip code prefix of the seller's warehouse location.
    *   *Data Type:* Integer (`int32`)
*   **`seller_city`**
    *   *Description:* Standardized name of the city where the seller is located.
    *   *Data Type:* Categorical
*   **`seller_state`**
    *   *Description:* State abbreviation where the seller is located.
    *   *Data Type:* Categorical

---

### 7. Order Payments Table (`olist_order_payments`)
*   **`order_id`** (Foreign Key)
    *   *Description:* Links the payment back to the parent order in `olist_orders`.
    *   *Data Type:* String / Object
*   **`payment_sequential`**
    *   *Description:* Sequence number identifying the payment part (used if a customer splits payment across multiple vouchers or cards).
    *   *Data Type:* Integer (`int16`)
*   **`payment_type`**
    *   *Description:* Method of payment (credit card, boleto, debit card, voucher).
    *   *Data Type:* Categorical
*   **`payment_installments`**
    *   *Description:* Number of monthly installments chosen for the transaction.
    *   *Data Type:* Integer (`int16`)
*   **`payment_value`**
    *   *Description:* Total monetary amount paid in this specific transaction segment.
    *   *Data Type:* Floating Point (`float32`)

---

### 8. Order Reviews Table (`olist_order_reviews`)
*   **`review_id`**
    *   *Description:* Unique identifier assigned to each review survey transaction.
    *   *Data Type:* String / Object
*   **`order_id`** (Foreign Key)
    *   *Description:* Links the review score back to the transaction in `olist_orders`.
    *   *Data Type:* String / Object
*   **`review_score`**
    *   *Description:* Satisfaction score left by the customer (ranging from 1 to 5 stars).
    *   *Data Type:* Integer (`int16`)
*   **`review_creation_date`**
    *   *Description:* Timestamp when the satisfaction survey was generated and sent to the customer.
    *   *Data Type:* Date
*   **`review_answer_date`**
    *   *Description:* Timestamp when the customer submitted their rating.
    *   *Data Type:* DateTime

---

## Part 2: Power BI Data Modeling Architecture

The model built in Power BI utilizes a **Snowflake Schema** design to balance normalized dimensions with cross-table filter capabilities. 

### 1. Dimension & Fact Split
*   **Fact Tables:** The transactional detail is stored in **`olist_order_items`** (containing product prices, shipping limits, and freight costs) and **`olist_orders`** (acting as the transactional header containing delivery timelines and order status). 
*   **Supporting Fact Segments:** **`olist_order_payments`** and **`olist_order_reviews`** act as auxiliary transaction tables connected to `olist_orders`.
*   **Dimension Tables:** **`olist_products`**, **`olist_sellers`**, and **`olist_customer`** serve as lookup tables containing categorical fields and physical parameters.

### 2. Normalized Geolocation (Role-Playing Boundary)
*   To prevent circular paths and relationship ambiguity, the **`olist_geolocation`** table is connected **only** to the **`olist_customer`** table.
*   This connection maps coordinates specifically for the customer profiles. Filters on customer state, city, and zip code flow into geolocation to represent buyer location maps.
*   Sellers remain independent of the coordinates registry in this model, avoiding any ambiguous paths between `order_items`, `sellers`, and customer geolocations.

### 3. Filter Propagation Configuration
*   **Single-Direction Filters:** Dimension tables (`products`, `sellers`, and `Customer Geolocation` $\rightarrow$ `customer`) filter the fact tables downward in a 1-to-Many configuration.
*   **Bi-Directional Filter (Both):** The relationship between **`olist_orders`** and **`olist_order_items`** is configured to filter in **both directions**. This is a critical configuration choice that allows filters on product categories or seller states to travel backwards from `order_items` through `orders` and filter review scores or payment methods correctly.
