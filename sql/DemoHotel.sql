create database DemoHotel
use DemoHotel
CREATE TABLE "Type_customer"(
    "type_customer" INT IDENTITY(1,1) NOT NULL,
    "type_customer_name" NVARCHAR(255) NOT NULL,
    "money_level" FLOAT NOT NULL, 
    "discount" FLOAT NOT NULL,
    CONSTRAINT "type_customer_type_customer_primary" PRIMARY KEY("type_customer")
);

CREATE TABLE "Customer"(
    "customer_id" INT IDENTITY(1,1) NOT NULL,
    "type_customer" INT NOT NULL,
    "first_name" NVARCHAR(255),
    "last_name" NVARCHAR(255),
    "email" NVARCHAR(255) Unique NOT NULL,
    "password" NVARCHAR(255) NOT NULL,
    "phone" NVARCHAR(255),
    "address" NVARCHAR(255),
    "status" NVARCHAR(255) NOT NULL,
    CONSTRAINT "customer_customer_id_primary" PRIMARY KEY("customer_id"),
    CONSTRAINT "customer_type_customer_foreign" FOREIGN KEY("type_customer") REFERENCES "Type_customer"("type_customer")
);


CREATE TABLE "Role"(
    "staff_type_id" INT IDENTITY(1,1) NOT NULL,
    "type" NVARCHAR(255) NOT NULL,
    CONSTRAINT "role_staff_type_id_primary" PRIMARY KEY("staff_type_id")
);

CREATE TABLE "Staff"(
    "staff_id" INT IDENTITY(1,1) NOT NULL,
    "staff_type_id" INT NOT NULL,
    "email" NVARCHAR(255) NOT NULL,
    "password" NVARCHAR(255) NOT NULL,
    "status" NVARCHAR(255) NOT NULL,
    CONSTRAINT "staff_staff_id_primary" PRIMARY KEY("staff_id"),
    CONSTRAINT "staff_staff_type_id_foreign" FOREIGN KEY("staff_type_id") REFERENCES "Role"("staff_type_id")
);

CREATE TABLE "Room_type"(
    "room_type_id" INT IDENTITY(1,1) NOT NULL,
    "type_name" NVARCHAR(255) NOT NULL,
    "status" NVARCHAR(255) NULL,
	"quantity" int not null,
	"roomtype_img"  NVARCHAR(255) NOT NULL,
	"descripsion" NVARCHAR(MAX) NOT NULL,
	"room_type_price" FLOAT NOT NULL,
    CONSTRAINT "room_type_room_type_id_primary" PRIMARY KEY("room_type_id")
);

CREATE TABLE "Room"(
    "room_id" INT IDENTITY(1,1) NOT NULL,
    "room_type_id" INT NOT NULL,
    "room_name" NVARCHAR(255) NOT NULL,
	"title_descripsion" NVARCHAR(255) NOT NULL,
    "descripsion" NVARCHAR(MAX) NOT NULL,
	"content_descripsion" NVARCHAR(MAX) NOT NULL,
    "current_price" FLOAT NOT NULL,
    "status" NVARCHAR(255) NULL,
    CONSTRAINT "room_room_id_primary" PRIMARY KEY("room_id"),
    CONSTRAINT "room_room_type_id_foreign" FOREIGN KEY("room_type_id") REFERENCES "Room_type"("room_type_id")
);

CREATE TABLE "Room_Detail"(
    "room_id" INT,
    "img" NVARCHAR(255),
    CONSTRAINT "room_detail_room_id_foreign" FOREIGN KEY("room_id") REFERENCES "Room"("room_id")
);

CREATE TABLE "Service"(
    "service_id" INT IDENTITY(1,1) NOT NULL,
    "name_service" NVARCHAR(MAX) NOT NULL,
    "title_service" NVARCHAR(MAX) NULL,
    "description" NVARCHAR(MAX) NULL,
    "img" NVARCHAR(MAX) NULL,
    "status" NVARCHAR(MAX) NOT NULL,
	"service_price" FLOAT NOT NULL,
    CONSTRAINT "service_service_id_primary" PRIMARY KEY("service_id"),
);

CREATE TABLE "Event_id"(
    "event_id" INT IDENTITY(1,1) NOT NULL,
	"title_event" NVARCHAR(MAX) NULL,
	"img" NVARCHAR(MAX) NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME NOT NULL,
    "detail" NVARCHAR(MAX) NOT NULL,
    "discount_percent" FLOAT NOT NULL,
    "description" NVARCHAR(MAX) NOT NULL,
    "status" NVARCHAR(255) NOT NULL,
    CONSTRAINT "event_id_event_id_primary" PRIMARY KEY("event_id"),
);

CREATE TABLE "News"(
    "news_id" INT IDENTITY(1,1) NOT NULL,
    "staff_id" INT NOT NULL,
    "img" NVARCHAR(MAX) NOT NULL,
    "title" NVARCHAR(MAX) NOT NULL,
    "create_date" DATE NOT NULL,
    "desccription" NVARCHAR(MAX) NOT NULL,
    "status" NVARCHAR(MAX) NOT NULL,
    CONSTRAINT "news_news_id_primary" PRIMARY KEY("news_id"),
    CONSTRAINT "news_staff_id_foreign" FOREIGN KEY("staff_id") REFERENCES "Staff"("staff_id")
);

CREATE TABLE "Detail_news"(
    "detail_news_id" INT IDENTITY(1,1) NOT NULL,
    "news_id" INT NOT NULL,
    "content" NVARCHAR(MAX) NOT NULL,
    CONSTRAINT "detail_news_detail_news_id_primary" PRIMARY KEY("detail_news_id"),
    CONSTRAINT "detail_news_news_id_foreign" FOREIGN KEY("news_id") REFERENCES "News"("news_id")
);

CREATE TABLE "Reservation"(
    "reservation_id" INT IDENTITY(1,1) NOT NULL,
    "customer_id" INT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "discountpercent_level" FLOAT NOT NULL,
    "event_id" INT,
    "total_price" FLOAT NOT NULL,
	"quantity" int not null,
	"staff_id" INT,
    CONSTRAINT "reservation_reservation_id_primary" PRIMARY KEY("reservation_id"),
    CONSTRAINT "reservation_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id"),
    CONSTRAINT "reservation_event_id_foreign" FOREIGN KEY("event_id") REFERENCES "Event_id"("event_id"),
	CONSTRAINT "reservation_staff_id_foreign" FOREIGN KEY("staff_id") REFERENCES "Staff"("staff_id")
);

CREATE TABLE "Invoice_customer"(
    "invoice_customer_id" INT IDENTITY(1,1) NOT NULL,
    "customer_id" INT NOT NULL,
    "reservation_id" INT NOT NULL,
    "invoice_amount" FLOAT NOT NULL,
    "ts_paid" DATETIME NULL,
    CONSTRAINT "invoice_customer_invoice_customer_id_primary" PRIMARY KEY("invoice_customer_id"),
    CONSTRAINT "invoice_customer_reservation_id_foreign" FOREIGN KEY("reservation_id") REFERENCES "Reservation"("reservation_id"),
    CONSTRAINT "invoice_customer_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id")
);

CREATE TABLE "Level_customer"(
    "level_id" INT IDENTITY(1,1) NOT NULL,
    "customer_id" INT NOT NULL,
    "reservation_id" INT NOT NULL,
    "total" FLOAT NOT NULL,
    CONSTRAINT "level_customer_level_id_primary" PRIMARY KEY("level_id"),
    CONSTRAINT "level_customer_reservation_id_foreign" FOREIGN KEY("reservation_id") REFERENCES "Reservation"("reservation_id"),
    CONSTRAINT "level_customer_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id")
);

CREATE TABLE "Comment"(
    "comment_id" INT IDENTITY(1,1) NOT NULL,
    "customer_id" INT NOT NULL,
    "detai_new_id" INT NOT NULL,
    "content" NVARCHAR(MAX) NOT NULL,
    "comment_date" DATE NOT NULL,
    "status" NVARCHAR(255) NOT NULL,
    CONSTRAINT "comment_comment_id_primary" PRIMARY KEY("comment_id"),
    CONSTRAINT "comment_detai_new_id_foreign" FOREIGN KEY("detai_new_id") REFERENCES "Detail_news"("detail_news_id"),
    CONSTRAINT "comment_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id")
);

CREATE TABLE "Reply"(
    "reply_id" INT IDENTITY(1,1) NOT NULL,
    "customer_id" INT NOT NULL,
    "comment_id" INT NOT NULL,
    "content" NVARCHAR(MAX) NOT NULL,
    "reply_date" DATE NOT NULL,
    "status" NVARCHAR(255) NOT NULL,
    CONSTRAINT "reply_reply_id_primary" PRIMARY KEY("reply_id"),
    CONSTRAINT "reply_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id"),
    CONSTRAINT "reply_comment_id_foreign" FOREIGN KEY("comment_id") REFERENCES "Comment"("comment_id")
);

CREATE TABLE "Room_reserved"(
    "reservation_id" INT IDENTITY(1,1) NOT NULL,
    "room_id" INT NOT NULL,
    "price" FLOAT NOT NULL,
    CONSTRAINT "room_reserved_reservation_id_foreign" FOREIGN KEY("reservation_id") REFERENCES "Reservation"("reservation_id"),
    CONSTRAINT "room_reserved_room_id_foreign" FOREIGN KEY("room_id") REFERENCES "Room"("room_id")
);

CREATE TABLE "Room_service"(
    "service_id" INT NOT NULL,
    "room_type_id" INT NOT NULL,
    CONSTRAINT "room_service_service_id_foreign" FOREIGN KEY("service_id") REFERENCES "Service"("service_id"),
    CONSTRAINT "room_service_room_type_id_foreign" FOREIGN KEY("room_type_id") REFERENCES "Room_type"("room_type_id")
);

CREATE TABLE "Review"(
    "review_id" INT IDENTITY(1,1) NOT NULL,
    "customer_id" INT NOT NULL,
    "staff_id" INT NOT NULL,
	"room_id" INT NOT NULL,
    "description" NVARCHAR(MAX) NOT NULL,
    CONSTRAINT "review_review_id_primary" PRIMARY KEY("review_id"),
    CONSTRAINT "review_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id"),
	CONSTRAINT "review_room_id_foreign" FOREIGN KEY("room_id") REFERENCES "Room"("room_id")
);

CREATE TABLE "Convenient" (
	"convenient_id" INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	"convenient_name" NVARCHAR(255) NOT NULL,
	"status" NVARCHAR(255) NOT NULL	
);

CREATE TABLE "Room_Convenient" (
    "room_id" INT NOT NULL,
    "convenient_id" INT NOT NULL,
    "status" NVARCHAR(255) NOT NULL,
    PRIMARY KEY ("room_id", "convenient_id"),
    CONSTRAINT "room_convenient_room_id_foreign" FOREIGN KEY ("room_id") REFERENCES "Room"("room_id"),
    CONSTRAINT "room_convenient_convenient_id_foreign" FOREIGN KEY ("convenient_id") REFERENCES "Convenient"("convenient_id")
);

--------------------------------------------------------------------
