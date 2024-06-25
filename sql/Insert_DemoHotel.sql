--Insert DemoHotel
--------------------------------------------------------------------
use DemoHotel;
INSERT INTO "Role" ( "type")
VALUES
( N'Quản trị viên'),
( N'Nhân viên')


INSERT [Type_customer] ([type_customer_name], [money_level], [discount]) VALUES (N'New', 0, 0)
INSERT [Type_customer] ([type_customer_name], [money_level], [discount]) VALUES (N'VIP', 500000, 1)
INSERT [Type_customer] ([type_customer_name], [money_level], [discount]) VALUES (N'SVIP', 1000000, 1.5)

INSERT INTO "Customer"("type_customer", "first_name", "last_name", "email", "password", "phone", "address", "status") 
VALUES
(1, 'Vinh', 'Tien', 'vinhtien@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456789', '123 Main St, City', 'active'),
(1, 'Ha', 'Cong', 'mikizay175d@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456789', '123 Main St, City', 'active')

INSERT INTO "Staff" ( "staff_type_id", "email", "password", "status")
VALUES
( 1, 'admin@gmail.com', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'active'),   --pass: 111111
( 2, 'dinhtu@gmail.com', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'active')

-- Insert into News table
INSERT INTO "News" ("staff_id", "img", "title", "create_date", "desccription", "status") VALUES
(1, N'img1.jpg', N'Khách sạn ABC khai trương hồ bơi vô cực mới', '2024-06-01', N'Khách sạn ABC vừa khai trương hồ bơi vô cực mới với tầm nhìn tuyệt đẹp.', N'active'),
(2, N'img2.jpg', N'Nhà hàng tại khách sạn ABC nhận giải thưởng ẩm thực', '2024-06-02', N'Nhà hàng tại khách sạn ABC vừa nhận giải thưởng ẩm thực uy tín.', N'active'),
(2, N'img3.jpg', N'Khuyến mãi hè tại khách sạn ABC', '2024-06-03', N'Khách sạn ABC tung ra chương trình khuyến mãi đặc biệt cho mùa hè này.', N'active'),
(2, N'img4.jpg', N'Khách sạn ABC tổ chức sự kiện hội thảo quốc tế', '2024-06-04', N'Khách sạn ABC sẽ là nơi tổ chức sự kiện hội thảo quốc tế về du lịch.', N'active'),
(1, N'img5.jpg', N'Khách sạn ABC đạt chuẩn 5 sao', '2024-06-05', N'Khách sạn ABC vừa được nâng cấp và đạt chuẩn 5 sao.', N'active');

-- Insert into Detail_news table
INSERT INTO "Detail_news" ("news_id", "content") VALUES
(1, N'Hồ bơi vô cực mới của khách sạn ABC được xây dựng với thiết kế hiện đại và tầm nhìn bao quát toàn cảnh thành phố. Đây sẽ là điểm đến lý tưởng cho du khách muốn thư giãn và tận hưởng cảnh đẹp.'),
(2, N'Nhà hàng tại khách sạn ABC vừa nhận giải thưởng ẩm thực từ Hiệp hội Ẩm thực Quốc tế. Với đội ngũ đầu bếp tài năng và thực đơn đa dạng, nhà hàng hứa hẹn sẽ mang đến những trải nghiệm ẩm thực độc đáo cho khách hàng.'),
(3, N'Để chào đón mùa hè, khách sạn ABC tung ra chương trình khuyến mãi với nhiều ưu đãi hấp dẫn như giảm giá phòng, tặng vé buffet sáng và nhiều quà tặng giá trị. Đừng bỏ lỡ cơ hội này để có một kỳ nghỉ tuyệt vời tại ABC.'),
(4, N'Khách sạn ABC sẽ là nơi tổ chức hội thảo quốc tế về du lịch vào tháng 7 tới. Sự kiện dự kiến thu hút nhiều chuyên gia và doanh nghiệp trong ngành du lịch đến tham dự, trao đổi và chia sẻ kinh nghiệm.'),
(5, N'Với sự nỗ lực không ngừng trong việc cải thiện dịch vụ và cơ sở vật chất, khách sạn ABC đã chính thức được nâng cấp và đạt chuẩn 5 sao. Đây là niềm tự hào lớn của toàn bộ đội ngũ nhân viên khách sạn.');


-- Thêm dữ liệu vào bảng Comment
INSERT INTO "Comment" ("customer_id", "detai_new_id", "content", "comment_date", "status")
VALUES
(1, 1, N'Hay', '2024-05-10', 'active'),
(2, 2, N'Tốt', '2024-05-11', 'active'),
(2, 3, N'Rất hay', '2024-05-12', 'active');

-- Thêm dữ liệu vào bảng Reply
INSERT INTO "Reply" ("customer_id", "comment_id", "content", "reply_date", "status")
VALUES
(1, 1, N'Wow', '2024-05-13', 'active'),
(2, 2, N'Vậy sao', '2024-05-14', 'inactive'),
(2, 3, N'Tôi cũng thấy thế', '2024-05-15', 'active');



