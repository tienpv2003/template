
--display
select * from role
select * from staff
select * from "Customer"
select * from "Type_customer"
select * from Convenient;
select * from News;
select * from Detail_news;
select * from Room;
select * from Room_type;
select * from Room_Detail;


SELECT TOP 5 *
FROM News n
JOIN Detail_news d ON n.news_id = d.news_id
WHERE n.status = 'active'
ORDER BY n.news_id DESC;

SELECT Top 3 * FROM [Review] Order by review_id DESC
select * from Comment;
select * from Reply;

select * from Review;
--update
update Customer set status = N'active'
where customer_id = 1

update Review set room_detail_id = 1 where review_id = 3;

update News set img = N'hoboivocuc.jpg'
where news_id = 4

UPDATE Detail_news SET content = N'Khách sạn ABC tưng bừng khuyến mại giảm 30% nhân dịp Tết Nguyên Đán 2024. Để chào mừng ngày Tết Nguyên Đán hòa chung không khí lễ hội, khách sạn chúng tôi từng bừng giảm giá, khuyến mại 30% khi khách hàng đặt phòng từ 2 phòng ngủ trở lên.' WHERE news_id = 7
UPDATE Room_type SET description = N'Phòng dành cho khách từ 2-3 người' where room_type_id = 2;

-- Loại bỏ khóa ngoại staff_id trong bảng Review
ALTER TABLE Review DROP CONSTRAINT review_staff_id_foreign;

-- Loại bỏ trường staff_id trong bảng Review
ALTER TABLE Review DROP COLUMN staff_id;



INSERT INTO Review (customer_id, description, status) VALUES (1, 'Phong dep', 'active')

--phan trang
select count(*) from Review where status = N'active'   --dem so luong review active
     --chia review 2 review/ 1 trang
select * from Review where status = N'active' order by review_id 
offset 1 rows fetch next 2 rows only            
select * from Review order by review_id desc;

DELETE FROM Review WHERE review_id = 23

insert Review values(1,N'Phòng ở đây rất rộng và đẹp',N'active',1);