BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Category" (
	"id"	INTEGER,
	"name"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Product" (
	"id"	INTEGER,
	"name"	TEXT,
	"quantity"	INTEGER,
	"category_id"	INTEGER,
	"price"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("category_id") REFERENCES "Category"("id")
);
CREATE TABLE IF NOT EXISTS "User" (
	"id"	INTEGER,
	"name"	TEXT,
	"address"	TEXT,
	"handphone"	INTEGER,
	"email"	TEXT,
	"password_"	TEXT,
	"profile"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Orders" (
	"id"	INTEGER,
	"user_id"	INTEGER,
	"product_id"	INTEGER,
	"quantity"	INTEGER,
	"date"	TEXT,
	"time"	INTEGER,
	"address"	TEXT,
	"delivery_date"	TEXT,
	"status"	TEXT,
	"subtotal"	INTEGER,
	"promo_code"	TEXT,
	"delivery_charges"	INTEGER,
	"total_discount_promo"	INTEGER,
	"grand_total"	INTEGER,
	PRIMARY KEY("id","status"),
	FOREIGN KEY("user_id") REFERENCES "User"("id"),
	FOREIGN KEY("product_id") REFERENCES "Product"("id")
);
CREATE TABLE IF NOT EXISTS "Delivery" (
	"orders_id"	INTEGER,
	"delivery_order_date"	TEXT,
	"packing_time"	INTEGER,
	"status"	TEXT,
	FOREIGN KEY("orders_id") REFERENCES "Orders"("id"),
	FOREIGN KEY("status") REFERENCES "Orders"("status")
);
CREATE TABLE IF NOT EXISTS "Product_Review" (
	"id"	INTEGER,
	"product_id"	INTEGER,
	"user_id"	INTEGER,
	"rating"	INTEGER,
	"review"	TEXT,
	"date"	TEXT,
	"time"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("product_id") REFERENCES "Product"("id"),
	FOREIGN KEY("user_id") REFERENCES "User"("id")
);
CREATE TABLE IF NOT EXISTS "Transaction_Records" (
	"id"	INTEGER,
	"orders_id"	INTEGER,
	"payment_type"	TEXT,
	"payment_mode"	TEXT,
	"status"	TEXT,
	"date"	TEXT,
	"time"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("status") REFERENCES "Orders"("status"),
	FOREIGN KEY("orders_id") REFERENCES "Orders"("id")
);
CREATE TABLE IF NOT EXISTS "Product_Orders" (
	"product_id"	INTEGER,
	"orders_id"	INTEGER,
	FOREIGN KEY("product_id") REFERENCES "Product"("id"),
	FOREIGN KEY("orders_id") REFERENCES "Orders"("id")
);
CREATE TABLE IF NOT EXISTS "Shop" (
	"id"	INTEGER,
	"name"	TEXT,
	"product_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("product_id") REFERENCES "Product"("id")
);
CREATE TABLE IF NOT EXISTS "Product_Shop" (
	"product_id"	INTEGER,
	"shop_id"	INTEGER,
	FOREIGN KEY("product_id") REFERENCES "Product"("id"),
	FOREIGN KEY("shop_id") REFERENCES "Shop"("id")
);
CREATE TABLE IF NOT EXISTS "Shop_Owner" (
	"id"	INTEGER,
	"name"	TEXT,
	"email"	TEXT,
	"address"	TEXT,
	"shop_id"	INTEGER,
	"handphone"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("shop_id") REFERENCES "Shop"("id")
);
COMMIT;
