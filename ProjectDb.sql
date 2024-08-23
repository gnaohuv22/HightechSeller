USE [PROJECT_PRN221]
GO
/****** Object:  Table [dbo].[About]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[aId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Image] [varchar](255) NULL,
	[Content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[aId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
	[gmail] [nvarchar](250) NULL,
	[dob] [date] NULL,
	[image] [nvarchar](250) NULL,
	[username] [nvarchar](250) NULL,
	[password] [nvarchar](250) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[customer_id] [int] NULL,
	[comment_date] [date] NULL,
	[comment_content] [text] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[gmail] [nvarchar](250) NULL,
	[contact_content] [text] NULL,
	[contact_date] [date] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
	[email] [nvarchar](250) NULL,
	[dob] [date] NULL,
	[image] [nvarchar](250) NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](250) NULL,
	[username] [nvarchar](250) NULL,
	[password] [nvarchar](250) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[newsgroup_id] [int] NULL,
	[image] [nvarchar](250) NULL,
	[title] [nvarchar](250) NULL,
	[content] [text] NULL,
	[createdby] [int] NULL,
	[created_date] [date] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_group]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_group](
	[newsgroup_id] [int] IDENTITY(1,1) NOT NULL,
	[newsgroup_name] [nvarchar](250) NULL,
 CONSTRAINT [PK_News_group] PRIMARY KEY CLUSTERED 
(
	[newsgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[name_receiver] [nvarchar](250) NULL,
	[phone_receiver] [nvarchar](250) NULL,
	[address_receiver] [nvarchar](250) NULL,
	[total_price] [float] NULL,
	[oder_date] [date] NULL,
	[payment] [nvarchar](250) NULL,
	[status] [nvarchar](250) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[orderdetail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[list_price] [float] NULL,
	[quantity_order] [int] NULL,
 CONSTRAINT [PK_Order_detail] PRIMARY KEY CLUSTERED 
(
	[orderdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](250) NULL,
	[sub_description] [text] NULL,
	[description] [text] NULL,
	[image] [nvarchar](250) NULL,
	[list_price] [float] NULL,
	[discount] [float] NULL,
	[category_id] [int] NULL,
	[brand_id] [int] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warranty]    Script Date: 7/18/2024 3:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warranty](
	[warranty_id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[product_id] [int] NULL,
	[customer_id] [int] NULL,
	[image_product] [nvarchar](250) NULL,
	[product_status] [nvarchar](50) NULL,
	[warranty_date] [date] NULL,
	[warranty_status] [nvarchar](50) NULL,
	[warranty_quantity] [int] NULL,
	[product_status_admin] [nvarchar](250) NULL,
	[image_product_admin] [nvarchar](250) NULL,
	[warranty_date_admin] [nvarchar](250) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Warranty] PRIMARY KEY CLUSTERED 
(
	[warranty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([aId], [Title], [Image], [Content]) VALUES (1, N'Terms and Conditions', N'images/about/teamworking.jpg', N'<p>Welcome to Hightech Store''s website. Before using this website, please read and understand the following terms and conditions. By using this website, you agree to comply with the following terms and conditions. If you do not agree with any of the terms, please refrain from using this website.</p>
<p>1. Intellectual Property Rights: All content on this website, including but not limited to images, text, graphics, forms, and logos, is the property of Hightech Store or third parties. You are not permitted to copy, reproduce, or distribute any content without prior written consent.</p>
<p>2. Product Information: We strive to provide accurate and up-to-date information about our products. However, we do not guarantee the accuracy, completeness, or reliability of any product descriptions, specifications, pricing, or availability. It is your responsibility to verify the information before making a purchase.</p>
<p>3. Pricing and Payment: All prices listed on the website are in the specified currency and are subject to change without notice. We accept various payment methods, and by making a purchase, you agree to comply with the payment terms and conditions specified during the checkout process.</p>
<p>4. Product Warranty: We make every effort to ensure the quality and functionality of our products. However, product warranties, if applicable, are provided by the respective manufacturers. Please refer to the manufacturer''s warranty terms and conditions for details.</p>
<p>5. Shipping and Delivery: We will make reasonable efforts to deliver your order within the estimated timeframe. However, we are not responsible for any delays or damages that occur during the shipping process. Please refer to our Shipping Policy for more information.</p>
<p>6. Returns and Refunds: If you are not satisfied with your purchase, you may be eligible for a return or refund according to our Returns and Refunds Policy. Please review the policy for detailed instructions on how to initiate a return or request a refund.</p>
<p>7. User Accounts: If you create an account on our website, you are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You must provide accurate and complete information during the account registration process.</p>
<p>8. Limitation of Liability: Hightech Store and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of or in connection with the use or inability to use this website or the products purchased from it.</p>
<p>9. Governing Law and Jurisdiction: These terms and conditions shall be governed by and construed in accordance with the laws of [insert applicable jurisdiction]. Any disputes arising from or in connection with these terms and conditions shall be subject to the exclusive jurisdiction of the courts in [insert applicable jurisdiction].</p>
<p>By using the Hightech Store website, you acknowledge that you have read, understood, and agreed to these terms and conditions. If you have any questions or concerns, please contact us through the provided channels.</p>')
INSERT [dbo].[About] ([aId], [Title], [Image], [Content]) VALUES (2, N'Career Opportunities at Hightech Store', N'images/about/teamworking.jpg', N'<p>At Hightech Store, we are passionate about technology and providing exceptional products and services to our customers. If you share our enthusiasm for the world of computers and electronics, we invite you to explore the career opportunities available with us.</p>
<p><strong>Why Work with Us?</strong></p>
<p>Innovative Environment: Join a team that values innovation and encourages creative thinking. At Hightech Store, we strive to stay at the forefront of technology trends and provide cutting-edge solutions to our customers.</p>
<p>Professional Growth: We believe in investing in our employees'' professional development. As a member of our team, you will have access to ongoing training and learning opportunities to enhance your skills and advance your career.</p>
<p>Team Collaboration: Collaboration is at the heart of our success. We foster a collaborative work environment where everyone''s ideas and contributions are valued. You''ll have the chance to work with talented individuals who share a common passion for technology.</p>
<p>Customer Satisfaction: We are committed to providing outstanding customer service. Join us in delivering exceptional experiences to our customers and making a positive impact in their lives.</p>
<p><strong>Current Job Openings</strong></p>
<p>We are currently seeking talented individuals to join our team in the following positions:</p>
<p>Sales Associate: In this role, you will assist customers in selecting the right computer products, provide product information, and ensure a seamless shopping experience.</p>
<p>Technical Support Specialist: As a technical support specialist, you will troubleshoot and resolve customer inquiries related to computer hardware, software, and peripherals.</p>
<p>E-commerce Specialist: Join our e-commerce team and contribute to the growth of our online sales platform. You will manage product listings, optimize website content, and enhance the overall online shopping experience.</p>
<p>Warehouse Associate: As a warehouse associate, you will be responsible for receiving, organizing, and shipping computer products, ensuring accuracy and efficiency in inventory management.</p>
<p><strong>How to Apply</strong></p>
<p>If you are interested in joining our team, please submit your resume and a cover letter highlighting your relevant skills and experiences to [hightechstore05vn@gmail.com] Please indicate the position you are applying for in the subject line of the email.</p>
<p>We thank all applicants for their interest; however, only those selected for an interview will be contacted.</p>
<p><strong>Equal Opportunity Employer</strong></p>
<p>Hightech Store is an equal opportunity employer. We are committed to creating an inclusive and diverse workforce and welcome applications from individuals of all backgrounds, experiences, and abilities.</p>
<p>Join us in shaping the future of technology and delivering exceptional products and services to our customers. Explore the career opportunities at Hightech Store today!&nbsp;</p>
<p>&nbsp;</p>')
INSERT [dbo].[About] ([aId], [Title], [Image], [Content]) VALUES (3, N'Privacy Policy', N'images/about/teamworking.jpg', N'<p>At Hightech Store, we are committed to protecting the privacy and security of our customers'' personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard the personal data you provide to us when using our website.</p>
<p><strong>Information We Collect</strong></p>
<p>When you visit our website, we may collect certain personally identifiable information ("Personal Data") from you, including but not limited to:</p>
<p>1. Contact information (such as name, email address, phone number)</p>
<p>2. Billing and shipping address</p>
<p>3. Payment details (credit card information, PayPal account details, etc.)</p>
<p>4. Purchase history and preferences</p>
<p>5. Communication preferences</p>
<p><strong>How We Use Your Information</strong></p>
<p>We use the collected Personal Data for the following purposes:</p>
<p>1. To process and fulfill your orders and provide customer support</p>
<p>2. To personalize and improve your browsing and shopping experience on our website</p>
<p>3. To communicate with you regarding your orders, inquiries, and promotions</p>
<p>4. To send you marketing and promotional materials, subject to your preferences</p>
<p>5. To detect and prevent fraudulent activities and ensure the security of our website</p>
<p>6. To comply with legal obligations and resolve any disputes</p>
<p><strong>Information Sharing and Disclosure</strong></p>
<p>We may share your Personal Data with third-party service providers who assist us in carrying out our business operations, such as payment processors, shipping carriers, and customer support services. These third parties are contractually obligated to handle your information securely and use it only for the purposes specified by us.</p>
<p>We may also disclose your Personal Data when required by law, in response to a legal process, or to protect our rights, property, or safety, as well as the rights, property, and safety of our users or others.</p>
<p><strong>Data Retention</strong></p>
<p>We retain your Personal Data for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.</p>
<p><strong>Your Rights</strong></p>
<p>You have certain rights regarding your Personal Data, including the right to access, correct, and delete your information. You may also opt-out of receiving marketing communications from us at any time. To exercise these rights or to obtain more information, please contact us using the contact details provided at the end of this Privacy Policy.</p>
<p><strong>Data Security</strong></p>
<p>We implement appropriate security measures to protect your Personal Data against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.</p>
<p><strong>Changes to this Privacy Policy</strong></p>
<p>We may update this Privacy Policy from time to time to reflect changes in our practices or legal requirements. We will notify you of any material changes by posting the updated Privacy Policy on our website. Please review this Privacy Policy periodically for any updates.</p>
<p><strong>Contact Us</strong></p>
<p>If you have any questions, concerns, or requests regarding this Privacy Policy or the handling of your Personal Data, please contact us at:</p>
<p>Hightech Store</p>
<p>FPT University</p>
<p>Ha Noi,&nbsp; 10000</p>
<p>Phone: 0123456789</p>
<p>Email: <a href="mailto:hightechstore05vn@gmail.com">hightechstore05vn@gmail.com</a></p>')
INSERT [dbo].[About] ([aId], [Title], [Image], [Content]) VALUES (4, N'Returns & Refunds Policy', N'images/about/teamworking.jpg', N'<p>At Hightech Store, we want you to be completely satisfied with your purchase. If you are not satisfied with your product, we offer a straightforward Returns &amp; Refunds policy to ensure your peace of mind.</p>
<p><strong>Return Eligibility</strong></p>
<p>To be eligible for a return, the following conditions must be met:</p>
<p>The return request must be initiated within [number of days] days from the date of delivery.</p>
<p>The product must be in its original condition, unopened, and unused.</p>
<p>The product must be accompanied by the original receipt or proof of purchase.</p>
<p>Please note that certain products, such as software licenses, gift cards, or personalized items, may not be eligible for return. Additionally, items marked as "Final Sale" or "Non-Returnable" are not eligible for return or refund.</p>
<p><strong>Return Process</strong></p>
<p>To initiate a return, please follow these steps:</p>
<p>Contact our customer support team at [insert contact details] to request a return authorization. Provide your order number, product details, and reason for the return.</p>
<p>Once your return request is approved, you will receive further instructions on how to return the product.</p>
<p>Carefully package the product to ensure it is protected during transit.</p>
<p>Ship the product back to us using a reliable shipping method. You will be responsible for the return shipping costs unless the return is due to a defective or incorrect item.</p>
<p>Please provide us with the tracking number for the returned package for reference.</p>
<p><strong>Refund Process</strong></p>
<p>Once we receive and inspect the returned product, we will process your refund within 30 days. The refund will be issued using the original payment method used for the purchase.</p>
<p>Please note that the following conditions may apply to your refund:</p>
<p>If the returned product is in its original condition, a full refund of the product''s purchase price will be issued.</p>
<p>If the product is returned opened, used, or not in its original condition, we reserve the right to apply a restocking fee or reject the return.</p>
<p>Original shipping charges are non-refundable unless the return is due to a defective or incorrect item.</p>
<p><strong>Damaged or Defective Items</strong></p>
<p>If you receive a damaged or defective item, please contact us immediately. We will guide you through the return process and arrange for a replacement or refund, depending on your preference and product availability. Please provide us with clear photos or videos of the damaged or defective item for our records and quality control purposes.</p>
<p><strong>Customer Support</strong></p>
<p>If you have any questions, concerns, or need assistance with the Returns &amp; Refunds process, please contact our customer support team at hightechstore05vn@gmail.com. We are here to help and ensure your satisfaction.</p>')
INSERT [dbo].[About] ([aId], [Title], [Image], [Content]) VALUES (5, N'Delivery Information', N'/Images/about/teamworking.jpg', N'<p>At Hightech Store, we strive to provide a seamless and reliable delivery experience for our customers. Please review the following information regarding our delivery process, options, and estimated timeframes.</p>
<p><strong>Shipping Methods</strong></p>
<p>We offer the following shipping methods for domestic and international orders:</p>
<p>1.&nbsp;<em>Standard Shipping</em>: This method utilizes reputable shipping carriers and provides a cost-effective option for delivery within a specified timeframe. Delivery times may vary based on the destination and shipping provider.</p>
<p>2.&nbsp;<em>Express Shipping</em>: For customers who require faster delivery, we offer express shipping services. This method ensures expedited handling and delivery of your order within a shorter timeframe. Additional shipping charges may apply.</p>
<p><strong>Order Processing Time</strong></p>
<p>Once your order is placed and payment is confirmed, our team will process and prepare your order for shipment. Order processing typically takes [insert number of business days] business days, excluding weekends and holidays. Please note that order processing time may be longer during peak periods or in case of unforeseen circumstances.</p>
<p><strong>Estimated Delivery Time</strong></p>
<p>The estimated delivery time includes both the order processing time and the shipping time. Delivery times may vary depending on factors such as the destination, shipping method, and carrier''s policies. Please note that the estimated delivery time is provided as a general guideline and is not guaranteed.</p>
<p><strong>Tracking Your Order</strong></p>
<p>Once your order is shipped, you will receive a shipping confirmation email containing the tracking information for your package. You can use this information to track the progress of your shipment through the carrier''s website or tracking portal.</p>
<p><strong>Shipping Restrictions</strong></p>
<p>Please be aware of any shipping restrictions that may apply to certain products or destinations. Some items may have specific shipping limitations due to their size, weight, or regulatory restrictions imposed by local authorities. We will make every effort to notify you if any shipping restrictions apply to your order.</p>
<p><strong>Customs and Import Duties</strong></p>
<p>For international orders, please note that customs and import duties may be applicable based on your country''s regulations. Any additional fees or charges related to customs clearance are the responsibility of the recipient. We recommend contacting your local customs office for more information about these charges before placing an order.</p>
<p><strong>Shipping Address</strong></p>
<p>Please ensure that the shipping address provided during checkout is accurate and complete. We are not responsible for any delays or delivery issues resulting from incorrect or incomplete shipping information. In case you need to make changes to your shipping address after placing an order, please contact our customer support team as soon as possible.</p>
<p><strong>Delivery Issues and Support</strong></p>
<p>If you encounter any issues with the delivery of your order or have questions regarding your shipment, please contact our customer support team at [insert contact details]. We will assist you in resolving any delivery-related concerns and provide you with the necessary support.</p>
<p>&nbsp;</p>')
INSERT [dbo].[About] ([aId], [Title], [Image], [Content]) VALUES (6, N'How was HighTech Store started?', N'/Images/about/teamworking.jpg', N'<p>Welcome to HighTech, your ultimate destination for cutting-edge technology products! We are thrilled to present you with an online platform that brings together the latest gadgets and electronics, offering you an unparalleled shopping experience.At HighTech, we understand the fast-paced nature of the tech industry and the ever-evolving needs of tech enthusiasts like yourself. That''s why we have curated a diverse range of products that cater to every aspect of your technological lifestyle. Whether you''re a tech-savvy professional, a passionate gamer, or someone who simply appreciates the convenience and innovation that technology brings, we have something for everyone.Our extensive collection features top-of-the-line smartphones, sleek laptops, powerful desktop computers, immersive virtual reality systems, high-resolution cameras, smart home devices, and so much more. We partner with renowned brands and manufacturers known for their quality and reliability, ensuring that you receive only the best products that meet your expectations. hello</p>')
SET IDENTITY_INSERT [dbo].[About] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([admin_id], [name], [phone], [gmail], [dob], [image], [username], [password], [status]) VALUES (1, N'Đỗ Văn Đạt', N'0968519615', N'datdvhe161664@fpt.edu.vn', CAST(N'2002-11-19' AS Date), N'/Images/avatar/avtgithub.jpg', N'admin', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Active')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (1, N'Apple')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (2, N'Dell')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (3, N'Lenovo')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (4, N'Asus')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (5, N'Samsung')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (6, N'Xiaomi')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (7, N'Sony')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (8, N'Microsoft')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (9, N'LG')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (10, N'Acer')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Laptop')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Tablet')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Phone')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (2, N'Do Van Dat', N'datdvhe161664@fpt.edu.vn', N'nice product', CAST(N'2024-02-24' AS Date))
INSERT [dbo].[Contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (3, N'Do Van Dat', N'datdvhe161664@fpt.edu.vn', N'i love it', CAST(N'2024-02-24' AS Date))
INSERT [dbo].[Contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (4, N'Do Van Dat', N'datdvhe161664@fpt.edu.vn', N'love ittt', CAST(N'2024-02-24' AS Date))
INSERT [dbo].[Contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (5, N'Do Van Dat', N'datdvhe161664@fpt.edu.vn', N'nice product', CAST(N'2024-02-26' AS Date))
INSERT [dbo].[Contact] ([contact_id], [name], [gmail], [contact_content], [contact_date]) VALUES (6, N'Đỗ Văn Đạt', N'dovandat1611@gmail.com', N'nice product', CAST(N'2024-02-27' AS Date))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customer_id], [name], [phone], [email], [dob], [image], [gender], [address], [username], [password], [status]) VALUES (1, N'Đỗ Văn Đạt', N'0902121881', N'dovandat1611@gmail.com', CAST(N'2002-11-16' AS Date), N'/Images/avatar/dovandat.jpg', 1, N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', N'dovandat', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Active')
INSERT [dbo].[Customer] ([customer_id], [name], [phone], [email], [dob], [image], [gender], [address], [username], [password], [status]) VALUES (2, N'Lê Ngọc Tuấn Minh', N'0967827754', N'letuanminh311@gmail.com', CAST(N'2024-07-03' AS Date), NULL, 1, N'Hà Nội', N'minhle123', N'739c58d51f8770819c9bf91a5bb848f5ca5866306d6d387309b1caf81778ef01', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (1, 2, N'/Images/news/macbook-photo.jpg', N'Unveiling the Dell Gaming G15 5520 - A Powerful Gaming Experience', N'<p><strong>Dell,</strong> a renowned name in the gaming industry, is thrilled to introduce the <span style="text-decoration: underline;"><em><strong>Dell Gaming G15 5520,</strong></em></span> the ultimate gaming laptop designed to deliver an immersive gaming experience like no other. The <em><strong><span style="text-decoration: underline;">Dell Gaming G15 5520</span></strong></em> combines powerful hardware, innovative features, and striking design to provide gamers with an exceptional gaming performance.</p>
<p>Powered by the <strong><span style="text-decoration: underline;">latest 11th</span></strong> generation Intel Core processors and equipped with <span style="text-decoration: underline;">NVIDIA</span> GeForce graphics, this laptop is a true powerhouse that can handle the most demanding games with ease. Featuring a <strong><span style="text-decoration: underline;">15.6-inch FHD</span></strong> display with a fast refresh rate, the <em><span style="text-decoration: underline;"><strong>Dell Gaming G15 5520</strong></span></em> ensures smooth gameplay and stunning visuals. The high-resolution display and vibrant colors bring games to life, allowing gamers to experience every detail and immerse themselves in the virtual worlds they explore. In addition to its impressive graphics capabilities, the Dell Gaming G15 5520 offers an enhanced audio experience.</p>
<p>With <span style="text-decoration: underline;"><strong>Nahimic 3D </strong></span>audio technology and front-firing speakers, gamers can enjoy immersive soundscapes that add depth and realism to their gaming sessions. Designed with gamers in mind, the <span style="text-decoration: underline;"><em><strong>Dell Gaming G15 5520</strong></em></span> features a responsive keyboard with customizable RGB lighting. Each keystroke is precise and comfortable, ensuring gamers can execute complex maneuvers with ease. The laptop also incorporates an advanced cooling system to keep temperatures low, allowing for extended gaming sessions without compromising performance.</p>', 1, CAST(N'2024-02-21' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (2, 1, N'/Images/news/macbook-promo-2.jpg', N'Memorial Day Deals 2023: Shop Deals on Tech, Home and More Before They are Gone', N'<p><strong>Today is Memorial Day,</strong> wh<strong>i<span style="text-decoration: underline;">ch means this weekends sales are starting to wind down. But that doesnt mean its too late to take advantage of major savings on everything from tech and TVs to mattresses, furniture and much more.</span></strong></p><p><strong>However</strong>, most of these sales are set to expire tonight, and we probably wont see deals this good again until Fourth of July weekend or Amazons Prime Day, so youll want to act fast if you dont want to miss out on these savings. To help you make the most of the remaining hours, we have rounded up some of the very best Memorial Day deals you can still shop right now below.</p><p><span style="text-decoration: underline;"><strong>You can also check out our roundups of the best Memorial Day</strong></span> deals at Amazon and Best Buy for even more last-minute bargains.</p>', 1, CAST(N'2024-03-01' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (3, 3, N'/Images/news/macbook-photo.jpg', N'5 things I want to see on the rumored MacBook Air', N'<ol>
<li><strong>Not a 15-inch Air Why, god?! Why?</strong> While some of us are starting to believe that a 15-inch MacBook Air is happening, the best thing about the Air is that its incredibly portable. It manages to stay thin, compact and lightweight, giving you enough power for creative work and a long enough battery life to outlast your workday. The MacBook Air 15-inch has already been spotted in testing, and all signs point to a WWDC 2023 launch.&nbsp;</li>
<li>&nbsp;<strong>A cheaper price tag In this economy</strong>, getting a pricey laptop is the last thing on peoples minds. Not especially when there are so many affordable options that are just as great or even better (such as the best Lenovo laptops). Unfortunately, last years overhaul of the MacBook Air also came with a price increase, starting at $1,199 / &pound;1,249 / AU$1,899 &ndash; $200 / &pound;250 more than the M1 model (which remains on sale).&nbsp;</li>
<li>&nbsp;<strong>Better battery life The M1 MacBook Air has one of the longest battery lives of any laptop</strong> weve tested, but that doesnt mean Apple should rest on its laurels. We want to see even better battery life on the new MacBook Air, especially since it could end up being the go-to laptop for working from home or on the road.&nbsp;</li>
<li>&nbsp;<strong>More power The M1 chip is no slouch, but Apple could do even better with the rumored M2 or M2 Pro chip</strong>. More power doesnt just mean better performance &ndash; it also means more capabilities for creatives. The MacBook Air 2022 was a step up from the M1 MacBook Air, but it could do with even more performance for demanding tasks, such as video editing or music production.&nbsp;</li>
<li>&nbsp;<strong>M1 MacBook Air problems fixed While the M1 MacBook Air is a fantastic laptop</strong>, its not perfect. Some users have reported screen flickering issues, while others have complained about battery drain problems. Apple has released fixes for some of these issues, but we want to see all of them addressed in the new MacBook Air.</li>
</ol>', 1, CAST(N'2024-03-02' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (4, 4, N'/Images/news/teamworking.jpg', N'Technologies shaping the future green city at FPT Techday', N'<ul>
<li><strong>FPT Techday 2021</strong> launches a smart green city exhibition applying the group''s latest technology services, solutions, and products. According to information from the General Statistics Office, compared with the previous quarter, the number of employees suffering The negative impact of the pandemic in the third quarter increased by 15.4 million people, to more than 28.2 million people due to job loss, work leave, rotating leave, reduced working hours, and reduced income.</li>
<li>The impact of Covid-19 also greatly affected the production and business activities of enterprises. Around the world, the pandemic has also caused three-quarters of startups in most countries to pause and have no hope of raising more investment capital in the short term. With this theme, guests will have the opportunity to fully approach and experience a green normal world, where the activities of governments, organizations, businesses, and the lives of individuals are operated according to new way of "living with the flood". In particular, at the event, FPT will introduce the exhibition "Green Smart City" - a smart green city with the application of an ecosystem including the group''s latest technology services, solutions, and products.</li>
<li>The smart green city will be divided into 6 subdivisions: green government, green business, green mobility, green health, green education, green life. In particular, the subdivisions will operate around a focus on green government and connect, operate smoothly and flexibly based on core technologies such as AI, Cloud, Bigdata, Blockchain...</li>
<li>In particular, green government - the heart of a smart green city, is operated based on advanced technology solutions that help authorities get real-time updated data on all activities, thereby Make timely, coherent decisions and immediately see the results of change. In particular, in the context of Covid''s complicated developments, the green control center will be a place to exchange and connect with the command posts to discuss and provide solutions to big problems without having to meet. direct. Green enterprises, with the support of technology, can actively control the proportion of green personnel; administer, operate, work remotely.</li>
<li>Green education brings a smoothly connected learning and teaching experience between teachers and students based on artificial intelligence technology, social construction training methods to help learners be active, active and interested. participate and increase learning efficiency.</li>
</ul>', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (5, 4, N'/Images/news/Teamwork-in-the-Workplace.png', N'Entegy: Self-managed, touchless, all-in-one platform', N'<ul>
<li><strong>Entegy is an intuitive and easy-to-use events management, communication,</strong> and engagement platform, designed specifically for business events. The platform allows anyone to create and manage the entire event lifecycle from a single system.</li>
<li><strong>Offering a range of feature sets</strong>, from websites and registration to apps, email campaigns, attendance tracking, lead capture and touchless badge printing, Entegy can cater to events of all types and sizes. Central to the ease of running an event with Entegy, is a single set of live profiles and content powering all applications and functions. As new profiles are created in the system, they are automatically assigned a unique QR code that can be used to perform touchless actions.</li>
<li><strong>A new attendee has registered onsite?</strong> No problem! Instantly, they can print a badge, get app access and engage with lead generation. A speaker has pulled out? No problem! A single change can update the website and event app. You get the picture&hellip; Touchless Technology Entegy rolled out its first touchless solutions way back in 2012.</li>
<li>&nbsp;<strong>With the improvements</strong> in mobile technology and general acceptance of QR code scanning becoming commonplace, Entegy not only boasts a robust, accessible and reliable system but also a solution that is 100% touchless.</li>
</ul>', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (6, 1, N'https://www.cnet.com/a/img/resize/e9eabeaebbed80633f34e36b21f5477055d087a4/hub/2023/03/16/a8cf61d9-042f-49fe-bc7a-e357b0133417/apple-iphone-14-xx-8083-3.jpg?auto=webp&fit=crop&height=675&width=1200', N'iOS 17 Could Make Your Locked iPhone Screen an Apple Smart Home Display', N'<p>The next software updates for iPhones could come with a feature that lets you view more items on your locked phone screen, Bloomberg reported Wednesday. Apple''s upcoming iOS 17 would reportedly feature a smart display setting that shows things like calendar appointments, weather and notifications. The display would appear horizontally and resemble a smart home display like those sold by Amazon and Google while your phone is locked and lying unused on your desk or nightstand, Bloomberg said, citing unidentified sources. It''ll have a "dark background with bright text," the report says, so that you can easily read the information. While Apple last year launched lock screen widgets on iPhones and a customizable lock screen under iOS 16, the smart home-esque display would be a different experience, potentially giving you information without you having to touch your phone. A similar horizontal smart display would reportedly come to iPads at a later date. Apple didn''t immediately respond to a request for comment, but the news will reportedly be revealed at Apple''s annual Worldwide Developers Conference next month. Apple''s WWDC event will kick off with a keynote on June 5, where it''s expected the tech giant will unveil iOS 17, an AR/VR mixed-reality headset and possibly a new MacBook Air. You''ll be able to watch WWDC online as well as on the Apple TV app.</p>', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (7, 1, N'https://www.cnet.com/a/img/resize/4a3a8f8877b788ffa94ed8bc7beced43a9a11e28/hub/2022/10/11/fee761e5-5f5d-424f-8add-74d9b5e43be0/quest-pro-demo-laptop.jpg?auto=webp&width=1200', N'Apple''s Mixed Reality Headset: What to Expect From WWDC Big Reveal', N'<p>Apple''s next big product looks like it''ll cost $3,000, rest on your face and need to be tethered to a battery pack. Whatever this expected VR headset ends up being, it isn''t immediately clear what it''ll do or who it''s for. The Reality Pro headset, as it''s expected to be called when it''s likely unveiled at Apple''s WWDC developer conference on June 5, is Apple''s biggest new product in nearly a decade. It''s also totally different than anything Apple has ever made before.
VR headsets have been a standard consumer tech thing for years, and your family, or families you know, may already have one lying in a corner. They''re used for games, fitness, creative collaboration, even theater. Still, VR and AR have been outlier technologies, not deeply connected enough to the phones, tablets and laptops most of us use every day.
Apple could change that. And of course, don''t expect the word "metaverse" to be uttered even once. The metaverse became Meta''s buzzword to envision its future of AR and VR. Apple will have its own parallel, possibly unique, pitch.
A connection to everything?
I pair my Quest 2, from Meta, to my phone, and it gets my texts and notifications. I connect it to my Mac to cast extra monitors around my desk using an app called Immersed. But VR and AR don''t often feel deeply intertwined with the devices I use. They aren''t seamless in the way my watch feels when used with an iPhone, or AirPods feel when used with an iPad or Mac.
Apple needs this headset to bridge all of its devices, or at least make a good starting effort. Reports say the headset will run iPad apps on its built-in 4K displays, suggesting a common app ecosystem. It''s also possible that the Apple Watch could be a key peripheral, tracking fitness and also acting as a vibrating motion-control accessory. 

Watch this: Apple''s WWDC 2023: What We Expect
06:55
VR is a self-contained experience, but mixed reality – which Apple''s headset should lean on heavily – uses pass-through cameras to blend virtual things with video of the real world. In Apple''s case, its own devices could act as spatially linked accessories, using keyboards and touchscreens and ways to show virtual screens springing from real ones.
Apple''s expected headset is supposed to be self-contained, a standalone device like the Quest 2 and Quest Pro. But that interconnectivity, and its position in Apple''s continuity-handoff connected ecosystem, is a big opportunity and a big question mark.
However, Apple does have a big AR head start: Its iOS ecosystem has supported AR for years, and the iPhone and iPad Pro already have depth-sensing lidar scanners that can map out rooms in ways that Apple''s headset should replicate. Apple could emphasize making its existing AR tools on other devices more usable and visible through a new interface.
Apple''s head of AR, Mike Rockwell – the person expected to be leading this new headset''s development – told me in a conversation about AR in 2020 that "AR has enormous potential to be helpful to folks in their lives across devices that exist today, and devices that may exist tomorrow, but we''ve got to make sure that it is successful. For us, the best way to do that is to enable our device ecosystem, so that it is a healthy and profitable place for people to invest their time and effort."
</p>', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (8, 1, N'https://www.reuters.com/resizer/jGIUZI7779lh_g5JzbWRC7Ot6rM=/960x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/JDJIDLLSYRMYFOVQ66HE6LQZDM.jpg', N'Xiaomi to make wireless audio products in India', N'NEW DELHI/BENGALURU, May 29 (Reuters) - Xiaomi Corps (1810.HK) Indian arm will start making wireless audio products in the country through a partnership with electronics manufacturer Optiemus in a push to further localize its operations, the company said on Monday.
Xiaomi India will make its first local audio gadget at Optiemus Electronics factory in the northern state of Uttar Pradesh, the company said in a statement, reiterating that it was targeting a 50% increase in the production of components locally sourced by 2025.
The push comes as the manufacturer of the Redmi brand of smartphones recently lost out to South Korean rival Samsung (005930.KS) as India''s top smartphones company.
The company did not say what kind of audio product it will make in the Indian factory, but it is "committed to forging more such collaborations for a wider range of categories, across our product line-up."
Xiaomi, which locally manufactures most of the smartphones and TVs it sells in India, did not say when it will start making the audio products. It sells speakers, ear-buds, wired and wireless headphones in India.
The Indian government has been pushing global companies to invest in local manufacturing as a part of its vision to make the country self-reliant.
', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (9, 1, N'https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/828x552/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/22046473/vpavic_4291_20201113_0402.0.jpg', N'Apple’s $50 million butterfly keyboard settlement is finally approved', N'The $50 million settlement over Apple''s bad butterfly keyboard design got final approval by a federal court judge in California, Reuters reported yesterday. US District Court Judge Edward Davila denied an attempt to amend the agreement, writing in his ruling that 86,000 people filed claims. That finally puts a figure on the number of people affected who will get compensation for repairs they''d paid for. Or at least the number who heard about the lawsuit and followed it to the settlement agreement that was reached last July. The original suit came about because Apple laptops from 2015 to 2019 had a new keyboard design that just didn''t hold up under normal use; crumbs and dirt, or even just accumulated dust, could cause keys to fail or stick. Casey Johnston famously wrote in The Outline that “The new MacBook keyboard is ruining my life.” Despite Apple''s repeated attempts to iterate on the keyboard, the problem didn''t go away until it released the 16-inch MacBook Pro in 2019, which took things back to the “scissor switch” design that also ships in the Magic Keyboard for Apple desktops. The design was fully phased out of its products a few months later when Apple released a redesigned 13-inch MacBook Pro. Apple''s settlement doesn''t include an admission of wrongdoing but will pay some people back up to $395 to cover their repair costs. This final wrinkle in the saga involved six objectors who offered arguments saying the settlement wasn''t fair to MacBook owners who''d never repaired their failed keyboards (and therefore don''t get any cash) or that the $125 offered to those who''d only had to pay for one replacement wasn''t enough to cover the cost of repairs. But Davila denied their objections, saying that just wanting more money isn''t enough to deny the settlement''s approval. In short, anyone who filed a verifiable claim for keyboard money by the March deadline will be getting their money soon. Correction May 27th, 2023 7:05PM ET: This article previously said the 2019 16-inch MacBook Pro contains an Apple M1 chip. In fact, it does not. We regret the error.', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (10, 1, N'/Images/news/MSI.jpg', N'MSI is trying hard to be a premium laptop brand', N'<ul><li><span style="text-decoration: underline;"><strong>MSI &mdash; a brand traditionally known for gaming hardware </strong></span>&mdash; has announced a bunch of laptops at Computex 2023, and there''s an interesting lack of gamery among them. Instead, the company appears to be focusing hard on the premium lifestyle space with its mid-2023 offerings. Notable among these releases is the new Commercial 14 series, a line of business laptops intended to compete with high-end enterprise PCs &mdash; the likes of the ThinkPad. I conclude this from the fact that MSI''s press release highlights its “tailor-made solutions to enterprises through a series of optional security measures, NFC (near-field communication) and built-in Smart Card Reader.” If that''s not a word-for-word ThinkPad pitch, I don''t know what is. MSI has attempted business lines in the past, namely in its Summit Series, which we haven''t heard much about for a hot minute.</li><li><strong>These were solid, functional devices</strong>, but they didn''t have the build quality (or laundry list of enterprise security features) to compete with the established top players in that space, and they certainly weren''t priced to do that. The Commercial, which rolls out in the second half of this year, looks like it could be a few rungs up that ladder. The other release that''s catching my eye is the Prestige 16 Studio Evo, also slated for release in the second half of this year.</li><li>This is another product laser-focused on the high-end enterprise space. I''ve traditionally thought of the Prestige line largely as productivity devices that also have the chops for some gaming here and there. But this version, as the Studio moniker indicates, is for creative professionals, featuring Thunderbolt 4, a 99Whr battery, and Nvidia''s Studio platform (and RTX discrete GPUs, of course). I''m always on the lookout for powerful devices in the 16-inch space that don''t weigh ten thousand pounds, since big-screened-but-still-portable workstations are a need I hear about from video editors all the time. This Prestige Studio could be a nice get for those folks (if it''s good). Another big professional product, the Creator Z17 HX Studio, was actually announced earlier this year.</li><li><strong>It''s geared towards workers across the creative space</strong>, from video professionals to digital artists, and it''s compatible with an absolutely bonkers stylus that doubles as a mechanical pencil. MSI has that prominently on display at Computex as well, further pushing the idea that it''s not just a gaming brand, everyone, we promise. The Creator starts at $2,999 (yeah, it''s not cheap), but MSI hasn''t revealed pricing for the Prestige or the Commercial yet. Those numbers will give us a better idea of where MSI thinks these products fit in the current market and how high-end it thinks they really are. The video player is currently playing an ad. You can skip the ad in 5 sec with a mouse or keyboard Skip in 1s Lenovo is at MWC 2023 to make a pitch for a rollable future. Its got a prototype rollable laptop and a prototype rollable phone. Both have screens that can expand to give you more screen real-estate.</li></ul>', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (11, 1, N'/Images/news/Apple.webp', N'It is Time to Stop Waiting for Apple Next iPhone Moment', N'<ul><li>It''s been a long time since <strong>Apple </strong>revolutionized the smartphone industry with the launch of the first <strong>iPhone </strong>in <strong>2007</strong>. Since then, the company has released numerous iterations of its iconic device, each one more powerful and feature-packed than the last. But in recent years, the excitement around new iPhone releases has waned, and consumers are starting to wonder: is <strong>Apple </strong>running out of ideas? The answer, of course, is no. <strong>Apple </strong>is still one of the most innovative companies in the world, and there''s no doubt that they have some exciting new products in the pipeline. But the days of the <strong>iPhone </strong>being the center of attention are over.</li><li>It''s time for consumers to stop waiting for <strong>Apple''s </strong>next big <strong>iPhone </strong>moment and start paying attention to the company''s other offerings. Take the<strong> Apple Watch</strong>, for example. Since its launch in <strong>2015</strong>, the <strong>Apple Watch</strong> has become one of the most popular smartwatches on the market, and it''s not hard to see why. With features like heart rate monitoring, <strong>GPS </strong>tracking, and cellular connectivity, the <strong>Apple Watch </strong>is much more than just a timepiece. It''s a powerful fitness tracker, a convenient way to stay connected, and a stylish accessory all rolled into one.</li></ul>', 1, CAST(N'2024-02-29' AS Date), N'Active')
INSERT [dbo].[News] ([news_id], [newsgroup_id], [image], [title], [content], [createdby], [created_date], [status]) VALUES (12, 4, N'/Images/news/SamsungGalaxyZFlip4.jpg', N'Samsung Unveils the Future of Foldable Technology with the Samsung Galaxy Z Fold 4', N'<p><strong>Seoul, South Korea</strong> - Samsung Electronics, the renowned global leader in consumer electronics, has officially announced the highly anticipated launch of its latest innovation in foldable technology, the Samsung Galaxy Z Fold 4. Building on the success of its predecessors, the Galaxy Z Fold 4 is set to redefine the smartphone experience, offering users a remarkable combination of functionality, versatility, and style.</p><p>&nbsp;</p><p>At a glamorous unveiling event held at the Samsung Digital City, industry experts and tech enthusiasts witnessed the grand reveal of the <strong>Galaxy Z Fold 4</strong>. The device captured the audience''s attention with its cutting-edge features and sleek design, showcasing Samsung''s relentless pursuit of innovation.</p><p>&nbsp;</p><p>The Samsung Galaxy Z Fold 4 features a larger and more immersive foldable display, providing users with a seamless transition between smartphone and tablet modes. The dynamic AMOLED display delivers vibrant colors, deep blacks, and astonishing clarity, ensuring a visually stunning experience for users.</p><p>&nbsp;</p><p>Equipped with the latest Snapdragon processor and an enhanced multi-camera system, the Galaxy Z Fold 4 delivers unparalleled performance and versatility. Users can capture professional-grade photos and videos with ease, thanks to the device''s advanced camera capabilities and AI-powered enhancements.</p><p>&nbsp;</p><p>Samsung has also made significant improvements to the durability of the Galaxy Z Fold 4. The device features an upgraded hinge mechanism and a more robust construction, ensuring a reliable and long-lasting foldable smartphone experience. The addition of an ultra-thin glass layer further enhances the device''s durability while maintaining its sleek profile.</p>', 1, CAST(N'2024-02-29' AS Date), N'Active')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[News_group] ON 

INSERT [dbo].[News_group] ([newsgroup_id], [newsgroup_name]) VALUES (1, N'Tech-news')
INSERT [dbo].[News_group] ([newsgroup_id], [newsgroup_name]) VALUES (2, N'Review')
INSERT [dbo].[News_group] ([newsgroup_id], [newsgroup_name]) VALUES (3, N'Tutorial')
INSERT [dbo].[News_group] ([newsgroup_id], [newsgroup_name]) VALUES (4, N'Events')
SET IDENTITY_INSERT [dbo].[News_group] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [oder_date], [payment], [status]) VALUES (1, 1, N'Đỗ Văn Đạt', N'0902121881', N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', 149700000, CAST(N'2024-01-31' AS Date), N'Ship COD', N'Done')
INSERT [dbo].[Order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [oder_date], [payment], [status]) VALUES (2, 1, N'Đỗ Văn Đạt', N'0902121881', N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', 49900000, CAST(N'2024-02-13' AS Date), N'Payment by Card', N'Cancel')
INSERT [dbo].[Order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [oder_date], [payment], [status]) VALUES (3, 1, N'Đỗ Văn Đạt', N'0902121881', N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', 49900000, CAST(N'2024-02-19' AS Date), N'Payment by Card', N'Process')
INSERT [dbo].[Order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [oder_date], [payment], [status]) VALUES (4, 1, N'Đỗ Văn Đạt', N'0902121881', N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', 13839200, CAST(N'2024-02-26' AS Date), N'Payment by Card', N'Process')
INSERT [dbo].[Order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [oder_date], [payment], [status]) VALUES (5, 1, N'Đỗ Văn Đạt', N'0902121881', N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', 27678400, CAST(N'2024-02-27' AS Date), N'Payment by Card', N'Wait')
INSERT [dbo].[Order] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [oder_date], [payment], [status]) VALUES (6, 2, N'Lê Ngọc Tuấn Minh', N'0967827754', N'Hà Nội', 15439200, CAST(N'2024-07-18' AS Date), N'Ship COD', N'Wait')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_detail] ON 

INSERT [dbo].[Order_detail] ([orderdetail_id], [order_id], [product_id], [list_price], [quantity_order]) VALUES (1, 1, 1, 149700000, 3)
INSERT [dbo].[Order_detail] ([orderdetail_id], [order_id], [product_id], [list_price], [quantity_order]) VALUES (2, 2, 1, 49900000, 1)
INSERT [dbo].[Order_detail] ([orderdetail_id], [order_id], [product_id], [list_price], [quantity_order]) VALUES (3, 3, 1, 49900000, 1)
INSERT [dbo].[Order_detail] ([orderdetail_id], [order_id], [product_id], [list_price], [quantity_order]) VALUES (4, 4, 3, 13839200, 1)
INSERT [dbo].[Order_detail] ([orderdetail_id], [order_id], [product_id], [list_price], [quantity_order]) VALUES (5, 5, 3, 27678400, 2)
INSERT [dbo].[Order_detail] ([orderdetail_id], [order_id], [product_id], [list_price], [quantity_order]) VALUES (6, 6, 2, 15439200, 1)
SET IDENTITY_INSERT [dbo].[Order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (1, N'LG GRAM 17ZD90R-G.AX73A5 (256GB/GREY)', N'<ul>
<li>CPU: <strong>I7-1360P</strong></li>
<li>RAM: <strong>16GB RAM</strong></li>
<li>SSD: <strong>256GB SSD</strong></li>
<li>Size: <strong>17.0 INCH</strong></li>
<li>Operating System: <strong>DOS</strong></li>
<li>Color: <strong>GREY</strong></li>
</ul>', N'<p>&bull;<span style="white-space: pre;"> </span>The LG Gram <strong>17ZD90R-G.AX73A5</strong> laptop is a powerful and lightweight device,</p>
<p>&bull;<span style="white-space: pre;"> </span>Featuring an<strong> Intel Core i7</strong> processor, <strong>16GB of RAM</strong>, and a 256GB SSD.</p>
<p>&bull;<span style="white-space: pre;"> </span>With its <strong>17.0-inch WQXGA</strong> display, this laptop offers a vibrant and crisp viewing experience, catering to all your work and entertainment needs.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/product/macbook-promo-1.jpg" alt="" width="675" height="401" /></p>', N'/Images/products/15.png', 49900000, 0, 1, 9, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (2, N'LENOVO IDEAPAD SLIM 5 PRO  (512GB/SILVER)', N'<p>CPU: <strong>I5 1240P</strong>.</p>
<p>RAM: <strong>16GB RAM.</strong></p>
<p>SSD: <strong>512GB SSD</strong>.</p>
<p>Size &amp; Display: <strong>14-inch 2.8K</strong>.</p>
<p>Operating System: <strong>WIN11.</strong></p>
<p>Color: <strong>SILVER</strong>.</p>', N'<p><em><strong>The Lenovo IdeaPad Slim 5 Pro 14IAP7 (82SH002TVN)</strong></em> laptop delivers excellence with an Intel Core i5 processor, 16GB of RAM, and a 512GB SSD.</p>
<p><em>Its 14-inch 2.8K display provides sharp and detailed visuals. With the Windows 11 operating system, you can enjoy an optimized user experience and reliable performance.</em></p>
<p style="text-align: left;"><em>The sleek SILVERcolor of this device adds sophistication and style.</em></p>', N'/Images/products/Lenovo IDEAPAD SLIM 5 PRO.jpg', 19299000, 0.2, 1, 3, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (3, N'ACER ASPIRE 5 A514-55-5954 (512GB SSD/GREY)', N'<ul>
<li>CPU: <strong>I5 1235U</strong></li>
<li>RAM: <strong>8GB RAM.</strong></li>
<li>SSD: <strong>512GB SSD</strong></li>
<li>Size: <strong>14.0 INCH FHD.</strong></li>
<li>Operating System: <strong>WIN11</strong></li>
<li>Color: <strong>GREY.</strong></li>
</ul>', N'<ul>
<li>The Acer Aspire 5 A514-55-5954 (NX.K5BSV.001) laptop is a reliable and efficient device, equipped with an Intel Core i5 processor, 8GB of RAM, and a 512GB SSD. Its 14.0-inch Full HD display delivers clear and vibrant visuals for an immersive viewing experience..</li>
<li>I5 1235U/8GB RAM.</li>
<li>512GB SSD/14.0 INCH FHD.</li>
<li>WIN11/GREY.</li>
</ul>', N'/Images/products/20.png', 17299000, 0.2, 1, 10, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (4, N'ASUS VIVOBOOK A1503ZA-L1422W (512GB SSD/15.6 OLED/BLUE)', N'<ul>
<li>CPU: <strong>I5 12500H</strong></li>
<li>RAM: <strong>8GB RAM.</strong></li>
<li>SSD: <strong>512GB SSD </strong></li>
<li>Size: <strong>15.6 OLED.</strong></li>
<li>Operating System: <strong>WIN11</strong></li>
<li>Color:&nbsp;<strong>SILVER.</strong></li>
</ul>', N'<ul>
<li>The ASUS VivoBook A1503ZA-L1422W laptop combines power and style, featuring an Intel Core i5 12500H processor, 8GB of RAM, and a 512GB SSD for fast and efficient performance. Its 15.6-inch OLED display offers vivid and immersive visuals with stunning color reproduction.&nbsp;</li>
<li>I5 12500H/8GB RAM.</li>
<li>512GB SSD/15.6 OLED.</li>
<li>WIN11/SILVER.</li>
</ul>', N'/Images/products/19.png', 17299000, 0.1, 1, 4, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (5, N'DELL INSPIRON 3520 (256GB SSD/15.6 INCH/BLACK)', N'<ul>
<li>CPU: <strong>I5 1235U </strong></li>
<li>RAM: <strong>8GB RAM</strong></li>
<li>SSD: <strong>256GB SSD</strong></li>
<li>Size: <strong>15.6 INCH FHD</strong></li>
<li>Operating&nbsp; System: <strong>WIN11</strong></li>
<li>Color: <strong>BLACK</strong></li>
</ul>', N'<ul>
<li>The Dell Inspiron 3520 (N5I5122W1) laptop delivers a powerful and efficient performance, featuring an Intel Core i5 1235U processor, 8GB of RAM, and a 256GB SSD for quick data access. Its 15.6-inch Full HD display offers sharp and vibrant visuals.</li>
<li>&nbsp;I5 1235U 8GB RAM</li>
<li>256GB SSD/15.6 INCH FHD</li>
<li>WIN11/OFFICEHS21/BLACK.</li>
</ul>', N'/Images/products/13.png', 16099000, 0.1, 1, 2, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (6, N'ACER ASPIRE 5 A514-55-5954 (512GB SSD/GREY)', N'<ul>
<li>CPU: <strong>I5 1235U</strong></li>
<li>RAM: <strong>8GB RAM.</strong></li>
<li>SSD: <strong>512GB SSD</strong></li>
<li>Size: <strong>14.0 INCH FHD.</strong></li>
<li>Operating System: <strong>WIN11</strong></li>
<li>Color: <strong>GREY.</strong></li>
</ul>', N'<ul>
<li>The Acer Aspire 5 A514-55-5954 (NX.K5BSV.001) laptop is a reliable and efficient device, equipped with an Intel Core i5 processor, 8GB of RAM, and a 512GB SSD. Its 14.0-inch Full HD display delivers clear and vibrant visuals for an immersive viewing experience..</li>
<li>I5 1235U/8GB RAM.</li>
<li>512GB SSD/14.0 INCH FHD.</li>
<li>WIN11/GREY.</li>
</ul>', N'/Images/products/20.png', 17299000, 0.2, 1, 10, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (7, N'ASUS VIVOBOOK A1503ZA-L1422W (512GB SSD/15.6 OLED/BLUE)', N'<ul>
<li>CPU: <strong>I5 12500H</strong></li>
<li>RAM: <strong>8GB RAM.</strong></li>
<li>SSD: <strong>512GB SSD </strong></li>
<li>Size: <strong>15.6 OLED.</strong></li>
<li>Operating System: <strong>WIN11</strong></li>
<li>Color:&nbsp;<strong>SILVER.</strong></li>
</ul>', N'<ul>
<li>The ASUS VivoBook A1503ZA-L1422W laptop combines power and style, featuring an Intel Core i5 12500H processor, 8GB of RAM, and a 512GB SSD for fast and efficient performance. Its 15.6-inch OLED display offers vivid and immersive visuals with stunning color reproduction.&nbsp;</li>
<li>I5 12500H/8GB RAM.</li>
<li>512GB SSD/15.6 OLED.</li>
<li>WIN11/SILVER.</li>
</ul>', N'/Images/products/19.png', 17299000, 0.1, 1, 4, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (8, N'DELL INSPIRON 3520 (256GB SSD/15.6 INCH/BLACK)', N'<ul>
<li>CPU: <strong>I5 1235U </strong></li>
<li>RAM: <strong>8GB RAM</strong></li>
<li>SSD: <strong>256GB SSD</strong></li>
<li>Size: <strong>15.6 INCH FHD</strong></li>
<li>Operating&nbsp; System: <strong>WIN11</strong></li>
<li>Color: <strong>BLACK</strong></li>
</ul>', N'<ul>
<li>The Dell Inspiron 3520 (N5I5122W1) laptop delivers a powerful and efficient performance, featuring an Intel Core i5 1235U processor, 8GB of RAM, and a 256GB SSD for quick data access. Its 15.6-inch Full HD display offers sharp and vibrant visuals.</li>
<li>&nbsp;I5 1235U 8GB RAM</li>
<li>256GB SSD/15.6 INCH FHD</li>
<li>WIN11/OFFICEHS21/BLACK.</li>
</ul>', N'/Images/products/13.png', 16099000, 0.1, 1, 2, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (9, N'APPLE MACBOOK AIR (256GB SSD/13.6 INCH IPS/SILVER)', N'<ul>
<li>CHIP & CPU: <strong>APPLE M2/8C CPU</strong></li>
<li>RAM: <strong>8GB RAM</strong></li>
<li>SSD: <strong>256GB SSD</strong></li>
<li>Size: <strong>13.6 INCH IPS</strong></li>
<li>OS: <strong>MAC OS</strong></li>
<li>Color: <strong>SILVER.</strong></li>
</ul>', N'<ul>
<li>The Apple MacBook Air (MLXY3SA/A) is a powerful and stylish laptop featuring the Apple M2 chip with an 8-core CPU and 8-core GPU. With 8GB of RAM and a 256GB SSD, it offers efficient performance and ample storage. The 13.6-inch IPS display delivers vibrant visuals, and running on macOS.</li>
<li>APPLE M2/8C CPU/8C GPU</li>
<li>8GB RAM/256GB SSD</li>
<li>13.6 INCH IPS/MAC OS/SILVER.</li>
</ul>', N'/Images/products/18.png', 31499000, 0, 1, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (10, N'APPLE MACBOOK PRO 13 (512GB SSD/13.3 INCH/GOLD)', N'<ul>
<li>CHIP & CPU : <strong>APPLE M2 /8C CPU/10C GPU</strong></li>
<li>RAM: <strong>16GB RAM</strong></li>
<li>SSD: <strong>512GB SSD</strong></li>
<li>Size: <strong>13.3 INCH</strong></li>
<li>OS: <strong>MAC OS</strong></li>
<li>Color:<strong> SILVER</strong></li>
</ul>', N'<ul>
<li>The Apple MacBook Pro 13 (Z16U00034) is a powerful and premium laptop. It is equipped with the advanced Apple M2 chip featuring an 8-core CPU and 10-core GPU, delivering exceptional performance.</li>
<li>APPLE M2 /8C CPU/10C GPU</li>
<li>16GB RAM/512GB SSD</li>
<li>13.3 INCH/MAC OS/SILVER</li>
</ul>', N'/Images/products/1.jpg', 43999000, 0, 1, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (11, N'iPad Gen 9 - 10.2', N'<ul>
<li><strong>iPad Gen 9</strong> is a <strong>10.2-inch</strong> tablet released in <strong>2021</strong>.</li>
<li>It offers a reliable and versatile performance with its <strong>Wi-Fi</strong> connectivity and <strong>64GB </strong>of storage capacity.</li>
</ul>', N'<ul>
<li>The iPad Gen 9 is a 10.2-inch tablet released in 2021. It offers a reliable and versatile performance with its Wi-Fi connectivity and 64GB of storage capacity. The iPad Gen 9 is perfect for various tasks, such as browsing the internet, streaming media, and using a wide range of apps. Its portable size and long battery life make it an excellent companion for both productivity and entertainment on the go.</li>
</ul>', N'/Images/products/17.png', 6950000, 0, 2, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (12, N'Lenovo Tab P11 Plus - 11'''' - 64GB', N'<ul>
<li><strong>The Lenovo Tab P11 Plus</strong> is an <strong>11-inch</strong> tablet with <strong>64GB </strong>of storage capacity.</li>
<li>It offers a versatile and immersive multimedia experience with its large display and ample storage. </li>
</ul>', N'<p>The Lenovo Tab P11 Plus is an 11-inch tablet with 64GB of storage capacity. It offers a versatile and immersive multimedia experience with its large display and ample storage. Whether you''re browsing the web, watching videos, or playing games, the Lenovo Tab P11 Plus provides crisp visuals and smooth performance. With its portable design and long-lasting battery life, it''s a great companion for both productivity and entertainment on the move.</p>', N'/Images/products/LenovoTabP11Pro__1_.jpg', 8190000, 0, 2, 3, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (13, N'iPad Pro M2 11', N'<ul>
<li><strong>The iPad Pro M2</strong> is an advanced <strong>11-inch</strong> tablet with <strong>512GB </strong>of storage.</li>
<li>It features a powerful <strong>M2 chip</strong> and <strong>5G </strong>connectivity for fast performance and seamless internet access. </li>
</ul>', N'<ul>
<li>The iPad Pro M2 is an advanced 11-inch tablet with 512GB of storage. It features a powerful M2 chip and 5G connectivity for fast performance and seamless internet access. With its high-resolution display, the iPad Pro M2 provides a stunning visual experience, perfect for creative tasks and multimedia consumption.</li>
</ul>', N'/Images/products/IpadProM2.jpg', 33990000, 0, 2, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (14, N'Samsung Galaxy Tab S8 Ultra', N'<ul>
<li><strong>The Samsung Galaxy Tab S8 Ultra</strong> is a high-end tablet that offers an exceptional user experience.</li>
<li>With its large display, precise performance, and innovative features, it stands out as a flagship device.</li>
</ul>', N'<p>The Samsung Galaxy Tab S8 Ultra is a high-end tablet that offers an exceptional user experience. With its large display, precise performance, and innovative features, it stands out as a flagship device. The Tab S8 Ultra boasts a stunning and immersive display, perfect for multimedia consumption, gaming, and productivity tasks. Its powerful processor ensures smooth and seamless performance, allowing you to multitask effortlessly.</p>', N'/Images/products/Samsung-Galaxy.jpg', 23290000, 0, 2, 5, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (15, N'Xiaomi Pad 5 6GB/256GB', N'<ul>
<li><strong>The Xiaomi Pad 5</strong> is a sleek and powerful tablet with <strong>6GB </strong>of <strong>RAM and 256GB</strong> of storage.</li>
<li>It combines excellent performance with ample storage capacity, providing a seamless and immersive user experience for both work and entertainment.</li>
</ul>', N'<p>The Xiaomi Pad 5 is a sleek and powerful tablet with 6GB of RAM and 256GB of storage. It combines excellent performance with ample storage capacity, providing a seamless and immersive user experience for both work and entertainment.</p>', N'/Images/products/XiaomiPad5.jpg', 10490000, 0.2, 2, 6, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (16, N'iPad Mini 6 - 8.3', N'<ul>
<li>The <strong>iPad Mini 6</strong> is a compact and versatile tablet with an <strong>8.3-inch display. </strong></li>
<li><strong>Released in 2021</strong>, it offers <strong>Wi-Fi</strong> connectivity and <strong>64GB</strong> of storage capacity</li>
</ul>', N'<ul>
<li>The iPad Mini 6 is a compact and versatile tablet with an 8.3-inch display. Released in 2021, it offers Wi-Fi connectivity and 64GB of storage capacity. The iPad Mini 6 is perfect for on-the-go productivity, multimedia consumption, and staying connected. Its portable size, high-resolution display, and efficient performance make it a great choice for users who prioritize convenience without compromising functionality</li>
</ul>', N'/Images/products/IPadMini6.jpg', 11990000, 0, 2, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (17, N'iPhone 14 Pro Max (128GB)', N'<ul>
<li>The iPhone 14 Pro Max is a flagship smartphone with 128GB of storage capacity.</li>
<li>It offers a premium user experience with its advanced features and powerful performance.</li>
<li>The iPhone 14 Pro Max boasts a stunning display, exceptional camera capabilities, and a range of innovative features</li>
</ul>', N'<p>The iPhone 14 Pro Max is a flagship smartphone with 128GB of storage capacity. It offers a premium user experience with its advanced features and powerful performance. The iPhone 14 Pro Max boasts a stunning display, exceptional camera capabilities, and a range of innovative features</p>', N'/Images/products/Apple-iPhone-14-Pro-Max.jpg', 26290000, 0, 3, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (18, N'iPhone 14 Pro (256GB) - Gold', N'<ul>
<li>The iPhone 14 Pro in Gold is a luxurious and high-performance smartphone with 256GB of storage.</li>
<li>It combines elegance and power with its sleek design and advanced features.</li>
<li>The iPhone 14 Pro offers a premium user experience, featuring a stunning display, exceptional camera capabilities, and powerful performance.</li>
</ul>', N'<p>The iPhone 14 Pro in Gold is a luxurious and high-performance smartphone with 256GB of storage. It combines elegance and power with its sleek design and advanced features. The iPhone 14 Pro offers a premium user experience, featuring a stunning display, exceptional camera capabilities, and powerful performance.</p>', N'/Images/products/iphone_14_pro_max_gold.png', 27390000, 0.2, 3, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (19, N'iPhone 14 Plus (128GB) - Starlight', N'<ul>
<li><strong>The iPhone 14 Plus in Starlight</strong> is a premium smartphone with 128GB of storage. It combines powerful performance and a stylish design to deliver an exceptional user experience.</li>
<li><span style="text-decoration: underline;">The iPhone 14 Plus features</span> a large display, advanced camera system, and impressive features</li>
</ul>', N'<p><strong>The iPhone 14 Plus in Starlight</strong> is a premium smartphone with 128GB of storage. It combines powerful performance and a stylish design to deliver an exceptional user experience.<span style="text-decoration: underline;"> The iPhone 14 Plus features</span> a large display, advanced camera system, and impressive features.</p>', N'/Images/products/iphone14-white.jpg', 21590000, 0.2, 3, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (20, N'Surface Pro 7 Core i5 / 8GB / 128GB', N'<ul>
<li>The Surface Pro 7 is a versatile 2-in-1 device powered by an Intel Core i5 processor and equipped with 8GB of RAM and 128GB of storage.</li>
<li>It offers a seamless blend of performance and portability, allowing you to work, create, and entertain on-the-go.</li>
</ul>', N'<ul>
<li>The Surface Pro 7 is a versatile 2-in-1 device powered by an Intel Core i5 processor and equipped with 8GB of RAM and 128GB of storage. It offers a seamless blend of performance and portability, allowing you to work, create, and entertain on-the-go.</li>
</ul>', N'/Images/products/surface-pro-7.jpg', 19990000, 0, 1, 8, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (21, N'Surface Laptop Go Core i5 / 8GB / 128 GB / 12.4 inch', N'<ul>
<li>The Surface Laptop Go is designed for productivity and everyday tasks, making it perfect for students, professionals, and on-the-go individuals.</li>
<li>Its sleek design and vibrant display provide an enjoyable user experience, while the powerful specifications ensure smooth multitasking and efficient performance.</li>
</ul>', N'<p>The Surface Laptop Go is designed for productivity and everyday tasks, making it perfect for students, professionals, and on-the-go individuals. Its sleek design and vibrant display provide an enjoyable user experience, while the powerful specifications ensure smooth multitasking and efficient performance.</p>', N'/Images/products/SurfaceLaptopGoCorei5.jpg', 15790000, 0.1, 1, 8, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (22, N'Surface Pro 8 Core i7 / 16GB / 256GB', N'<ul>
<li><strong>The Surface Pro 8</strong> is a high-performance 2-in-1 device featuring an <strong>Intel Core i7</strong> processor, <strong>16GB of RAM</strong>, and a <strong>256GB SSD. </strong></li>
<li>It offers a powerful computing experience with the flexibility of a tablet and the productivity of a laptop.</li>
</ul>', N'<p>The Surface Pro 8 is a high-performance 2-in-1 device featuring an Intel Core i7 processor, 16GB of RAM, and a 256GB SSD. It offers a powerful computing experience with the flexibility of a tablet and the productivity of a laptop. The Surface Pro 8''s 12.3-inch display provides stunning visuals, while its versatile design allows you to switch between tablet and laptop modes effortlessly</p>', N'/Images/products/SurfacePro8.jpg', 37990000, 0, 1, 8, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (23, N'Surface Laptop 4 R5-4680U/8GB/128GB/13.5 inches', N'<ul>
<li>The Surface Laptop 4 is a sleek and powerful laptop featuring an AMD Ryzen 5 4680U processor,</li>
<li>8GB of RAM, and a 128GB SSD.</li>
<li>With its 13.5-inch display, it offers a compact yet immersive visual experience. </li>
</ul>', N'<p>The Surface Laptop 4 is a sleek and powerful laptop featuring an AMD Ryzen 5 4680U processor, 8GB of RAM, and a 128GB SSD. With its 13.5-inch display, it offers a compact yet immersive visual experience. The Surface Laptop 4 is designed for productivity and versatility, making it suitable for various tasks such as work, studies, and entertainment. Its lightweight design and long battery life make it ideal for on-the-go use.</p>', N'/Images/products/Surface-Laptop-4.jpg', 18990000, 0.2, 1, 8, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (24, N'Samsung Galaxy S22 Ultra - 8GB/128GB', N'<ul>
<li>The Samsung Galaxy S22 Ultra is a flagship smartphone featuring 8GB of RAM and 128GB of storage.</li>
<li>It offers a premium and immersive user experience with its powerful performance and advanced features.</li>
<li>The Galaxy S22 Ultra boasts a stunning display, exceptional camera capabilities, and a range of innovative features.</li>
</ul>', N'<p>The Samsung Galaxy S22 Ultra is a flagship smartphone featuring 8GB of RAM and 128GB of storage. It offers a premium and immersive user experience with its powerful performance and advanced features. The Galaxy S22 Ultra boasts a stunning display, exceptional camera capabilities, and a range of innovative features.</p>', N'/Images/products/Samsung-Galaxy-S22-Ultra.jpg', 19490000, 0.1, 3, 5, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (25, N'Samsung Galaxy Z Flip4 - 256GB', N'<ul>
<li><strong>The Samsung Galaxy Z Flip4</strong> is a cutting-edge smartphone with 256GB of storage.</li>
<li>It features a unique folding design that allows you to conveniently fold and unfold the device for a compact and stylish form factor.</li>
<li>With its ample storage capacity, you can store a significant amount of photos, videos, apps, and other files.</li>
</ul>', N'<p>The Samsung Galaxy Z Flip4 is a cutting-edge smartphone with 256GB of storage. It features a unique folding design that allows you to conveniently fold and unfold the device for a compact and stylish form factor. With its ample storage capacity, you can store a significant amount of photos, videos, apps, and other files.</p>', N'/Images/products/SamsungGalaxyZFlip4.jpg', 21210000, 0, 3, 5, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (26, N'Samsung Galaxy Z Fold4 - 256GB', N'<p>The Samsung Galaxy Z Fold4 is an innovative smartphone with a foldable display and 256GB of storage. It offers a unique and versatile user experience by transforming from a compact phone to a larger tablet-like device. With its ample storage capacity, you can store a vast amount of photos, videos, apps, and other content.</p>', N'<p>The Samsung Galaxy Z Fold4 is an innovative smartphone with a foldable display and 256GB of storage. It offers a unique and versatile user experience by transforming from a compact phone to a larger tablet-like device. With its ample storage capacity, you can store a vast amount of photos, videos, apps, and other content.</p>', N'/Images/products/SamsungGalaxyZFold4.png', 29990000, 0.1, 3, 5, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (27, N'Redmi Note 12 Pro 5G (8GB/256GB)', N'<p>The Redmi Note 12 Pro 5G is a feature-packed smartphone with 8GB of RAM and 256GB of storage. It offers high-speed 5G connectivity for fast internet access and seamless multimedia streaming. The Redmi Note 12 Pro 5G boasts a powerful processor, allowing for smooth multitasking and gaming performance.</p>', N'<p>The Redmi Note 12 Pro 5G is a feature-packed smartphone with 8GB of RAM and 256GB of storage. It offers high-speed 5G connectivity for fast internet access and seamless multimedia streaming. The Redmi Note 12 Pro 5G boasts a powerful processor, allowing for smooth multitasking and gaming performance.</p>', N'/Images/products/Xiaomi-Redmi-Note-12.jpg', 8990000, 0.2, 3, 6, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (28, N'Xiaomi 12T (16GB/256GB)', N'<p>The Xiaomi 12T is a high-performance smartphone with 16GB of RAM and 256GB of storage. It offers a seamless and powerful user experience with its advanced features and specifications. The Xiaomi 12T boasts a powerful processor, allowing for smooth multitasking and gaming.</p>', N'<p>The Xiaomi 12T is a high-performance smartphone with 16GB of RAM and 256GB of storage. It offers a seamless and powerful user experience with its advanced features and specifications. The Xiaomi 12T boasts a powerful processor, allowing for smooth multitasking and gaming.</p>', N'/Images/products/Xiaomi12T.jpg', 9900000, 0.1, 3, 6, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (29, N'True Wireless Sony WF-1000XM4', N'<ul>
<li>The Sony WF-1000XM4 is a true wireless earbuds offering from Sony.</li>
<li>These earbuds provide a truly immersive and high-quality audio experience with their advanced noise-canceling technology.</li>
<li>They are designed to deliver exceptional sound clarity and deep bass, making them ideal for music enthusiasts.</li>
</ul>', N'<p>The Sony WF-1000XM4 is a true wireless earbuds offering from Sony. These earbuds provide a truly immersive and high-quality audio experience with their advanced noise-canceling technology. They are designed to deliver exceptional sound clarity and deep bass, making them ideal for music enthusiasts.</p>', N'/Images/products/TrueWireLessSony.jpg', 6490000, 0, 4, 7, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (30, N'Sony WH-1000XM5', N'<ul>
<li>Designed for comfort and convenience, the<strong> Sony WH-1000XM5 Pro</strong> boast a sleek and ergonomic design that fits perfectly in your ears.</li>
<li>They come with a wireless charging case, ensuring that your earbuds are always ready to use whenever you need them.</li>
</ul>', N'<p>Designed for comfort and convenience, the Sony WH-1000XM5 Pro boast a sleek and ergonomic design that fits perfectly in your ears. They come with a wireless charging case, ensuring that your earbuds are always ready to use whenever you need them.</p>', N'/Images/products/SonyWH.jpg', 7890000, 0, 4, 7, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (31, N'AirPods Pro 2', N'<ul>
<li><strong>The AirPods 2 </strong>Pro deliver an immersive and crystal-clear sound experience, allowing you to truly immerse yourself in your favorite music, podcasts, and more.</li>
<li>With active noise cancellation technology, you can block out distractions and focus on the music you love.</li>
</ul>', N'<p>The AirPods 2 Pro deliver an immersive and crystal-clear sound experience, allowing you to truly immerse yourself in your favorite music, podcasts, and more. With active noise cancellation technology, you can block out distractions and focus on the music you love.</p>', N'/Images/products/AIRPOD.jpg', 7990000, 0.1, 4, 1, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (32, N'Soundbar Samsung HW-B450/XV', N'<p>The Samsung HW-B450/XV features a built-in subwoofer and multiple audio drivers, delivering immersive and room-filling sound. Whether you''re watching your favorite movies or enjoying your favorite music, this soundbar ensures rich and dynamic audio.</p>', N'<p>The Samsung HW-B450/XV features a built-in subwoofer and multiple audio drivers, delivering immersive and room-filling sound. Whether you''re watching your favorite movies or enjoying your favorite music, this soundbar ensures rich and dynamic audio.</p>', N'/Images/products/Soundbar.jpg', 3990000, 0.1, 4, 5, N'Stocking')
INSERT [dbo].[Product] ([product_id], [product_name], [sub_description], [description], [image], [list_price], [discount], [category_id], [brand_id], [status]) VALUES (33, N'DELL GAMING G15 5520', N'<ul>
<li>CPU: <strong>7 12700H</strong></li>
<li>RAM: <strong>16GB RAM</strong></li>
<li>SSD: <strong>512GB SSD.</strong></li>
<li>RTX3060 6G</li>
<li>Size: <strong>15.6 INCH FHD 165HZ.</strong></li>
</ul>', N'<p>- The Dell Gaming G15 5520 is equipped with an Intel Core i7 12700H processor, providing blazing-fast performance and smooth multitasking capabilities. With 16GB of RAM, you can expect seamless gameplay and efficient task handling. The 512GB SSD offers ample storage space for your games, files, and multimedia content. </p>
<ul>
<li>7 12700H/16GB RAM/ 512GB SSD.</li>
<li>RTX3060 6G/15.6 INCH FHD 165HZ.</li>
</ul>', N'/Images/products/DELLGAMING.jpg', 37349000, 0.1, 1, 2, N'Stocking')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Warranty] ON 

INSERT [dbo].[Warranty] ([warranty_id], [orderdetail_id], [product_id], [customer_id], [image_product], [product_status], [warranty_date], [warranty_status], [warranty_quantity], [product_status_admin], [image_product_admin], [warranty_date_admin], [status]) VALUES (1, 1, 1, 1, N'/Images/warranties/test.png', N'OS error', CAST(N'2024-02-13' AS Date), N'Still Valid', 1, N'<p>OS Error</p>', N'/Images/warranties/15.png', N'29/02/2024', N'Process')
SET IDENTITY_INSERT [dbo].[Warranty] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Customer]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Admin] FOREIGN KEY([createdby])
REFERENCES [dbo].[Admin] ([admin_id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Admin]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_News_group] FOREIGN KEY([newsgroup_id])
REFERENCES [dbo].[News_group] ([newsgroup_id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_News_group]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD  CONSTRAINT [FK_Warranty_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Warranty] CHECK CONSTRAINT [FK_Warranty_Customer]
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD  CONSTRAINT [FK_Warranty_Order_detail] FOREIGN KEY([orderdetail_id])
REFERENCES [dbo].[Order_detail] ([orderdetail_id])
GO
ALTER TABLE [dbo].[Warranty] CHECK CONSTRAINT [FK_Warranty_Order_detail]
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD  CONSTRAINT [FK_Warranty_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Warranty] CHECK CONSTRAINT [FK_Warranty_Product]
GO
