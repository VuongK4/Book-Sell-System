USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'bss')
BEGIN
    ALTER DATABASE bss SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE bss;
END
GO

CREATE DATABASE bss;
GO

USE bss;

CREATE TABLE users(
    id INT IDENTITY(1,1) PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	password_hash VARCHAR(255) NOT NULL,
    full_name NVARCHAR(255),
    gender NVARCHAR(10),
    mobile VARCHAR(20),
	avatar NTEXT,
	[address] NTEXT,
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    description NTEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    category NVARCHAR(100),
    image_url NTEXT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    is_featured BIT NOT NULL DEFAULT 0
);
GO

INSERT INTO users (email, password_hash, full_name, gender, mobile, avatar, [address], created_at, updated_at)
VALUES 
    ('admin@bss.com', 'admin123', N'Admin', N'Male', '0123456789', NULL, N'Hanoi', GETDATE(), GETDATE()),
    ('user1@bss.com', 'user123', N'Nguyen Van A', N'Male', '0987654321', NULL, N'Hanoi', GETDATE(), GETDATE()),
    ('user2@bss.com', 'user123', N'Tran Thi B', N'Female', '0912345678', NULL, N'Da Nang', GETDATE(), GETDATE()),
    ('user3@bss.com', 'user123', N'Le Van C', N'Male', '0932145678', NULL, N'Hai Phong', GETDATE(), GETDATE()),
    ('user4@bss.com', 'user123', N'Pham Thi D', N'Female', '0908765432', NULL, N'Can Tho', GETDATE(), GETDATE());

GO

INSERT INTO products (name, description, price, stock_quantity, category, image_url, created_at, updated_at, is_featured)
VALUES 
    (N'The Alchemist', N'A philosophical novel about following dreams by Paulo Coelho.', 15.99, 50, N'Fiction', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1654371463i/18144590.jpg', GETDATE(), GETDATE(), 0),
    (N'1984', N'George Orwell''s dystopian novel about totalitarianism.', 12.50, 30, N'Fiction', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1657781256i/61439040.jpg', GETDATE(), GETDATE(), 1), -- Ví d?: ??t 1984 là featured
    (N'To Kill a Mockingbird', N'Harper Lee''s classic on justice and morality.', 14.75, 40, N'Fiction', 'https://m.media-amazon.com/images/I/81O7u0dGaWL._SY342_.jpg', GETDATE(), GETDATE(), 0),
    (N'Pride and Prejudice', N'Jane Austen''s romantic novel about love and society.', 10.99, 25, N'Romance', 'https://i.ebayimg.com/images/g/ToUAAeSw~gJodZu5/s-l960.webp', GETDATE(), GETDATE(), 0),
    (N'Sapiens', N'Yuval Noah Harari''s exploration of human history.', 18.99, 35, N'Non-Fiction', 'https://static.oreka.vn/800-800_8bdada62-25ef-4e78-9a5c-06933135c335.webp', GETDATE(), GETDATE(), 1), -- Ví d?: ??t Sapiens là featured
    (N'The Hobbit', N'J.R.R. Tolkien''s fantasy adventure.', 13.25, 45, N'Fantasy', 'https://i.ebayimg.com/images/g/2DMAAeSwwFxofpwX/s-l1600.webp', GETDATE(), GETDATE(), 0),
    (N'Atomic Habits', N'James Clear''s guide to building good habits.', 16.50, 60, N'Self-Help', 'https://cdn1.fahasa.com/media/catalog/product/9/7/9780593189641thanhly0.jpg', GETDATE(), GETDATE(), 0),
    (N'Dune', N'Frank Herbert''s epic science fiction saga.', 17.99, 20, N'Science Fiction', 'https://cdn1.fahasa.com/media/flashmagazine/images/page_images/dune/2023_03_30_10_46_34_1-390x510.jpg', GETDATE(), GETDATE(), 1), -- Ví d?: ??t Dune là featured
    (N'The Great Gatsby', N'F. Scott Fitzgerald''s tale of the American Dream.', 11.99, 30, N'Fiction', 'https://m.media-amazon.com/images/I/71V1cA2fiZL._UF1000,1000_QL80_.jpg.jpg', GETDATE(), GETDATE(), 0),
    (N'Educated', N'Tara Westover''s memoir of self-education.', 15.50, 25, N'Memoir', 'https://cdn.penguin.co.uk/dam-assets/books/9780099511021/9780099511021-jacket-large.jpg', GETDATE(), GETDATE(), 0),
    (N'The Catcher in the Rye', N'J.D. Salinger''s coming-of-age story.', 12.99, 35, N'Fiction', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjxpYMCuvMF0sh6ROPv40Z4tVaFPeU0sTIyA&s', GETDATE(), GETDATE(), 0),
    (N'Thinking, Fast and Slow', N'Daniel Kahneman''s insights on human decision-making.', 19.25, 15, N'Psychology', 'https://static01.nyt.com/images/2021/02/23/sports/23mlb-book-1/merlin_183954006_5524c977-4aea-4bb2-a26a-a8b86909b366-jumbo.jpg?quality=75&auto=webp', GETDATE(), GETDATE(), 0),
    (N'Lord of the Rings', N'J.R.R. Tolkien''s epic fantasy trilogy.', 22.99, 20, N'Fantasy', 'https://m.media-amazon.com/images/I/51uHK++IekL._SY445_SX342_.jpg', GETDATE(), GETDATE(), 0),
    (N'The Da Vinci Code', N'Dan Brown''s thriller about hidden codes.', 14.99, 40, N'Thriller', 'https://m.media-amazon.com/images/I/4182WHOHqUL._SY445_SX342_.jpgdavinci_code.jpg', GETDATE(), GETDATE(), 0),
    (N'Becoming', N'Michelle Obama''s memoir of her life and career.', 17.75, 30, N'Memoir', 'https://www.hollywoodreporter.com/wp-content/uploads/2018/11/becoming-michelle_obama-getty-h_2018.jpg?w=1296&h=730&crop=1', GETDATE(), GETDATE(), 0),
    (N'Harry Potter and the Sorcerer''s Stone', N'J.K. Rowling''s first book in the wizarding series.', 13.99, 50, N'Fantasy', 'https://m.media-amazon.com/images/I/51fLJOHOJFL._SY445_SX342_.jpg', GETDATE(), GETDATE(), 0),
    (N'The Power of Now', N'Eckhart Tolle''s guide to spiritual enlightenment.', 15.25, 25, N'Spirituality', 'https://m.media-amazon.com/images/I/410hw6Q5a9L._SY445_SX342_.jpg', GETDATE(), GETDATE(), 0),
    (N'Brave New World', N'Aldous Huxley''s dystopian vision of the future.', 12.75, 30, N'Fiction', 'https://m.media-amazon.com/images/I/71GNqqXuN3L._SY342_.jpg', GETDATE(), GETDATE(), 0),
    (N'The Subtle Art of Not Giving a F*ck', N'Mark Manson''s unconventional self-help book.', 16.99, 35, N'Self-Help', 'https://m.media-amazon.com/images/I/71QKQ9mwV7L._SY342_.jpg', GETDATE(), GETDATE(), 0),
    (N'Crime and Punishment', N'Fyodor Dostoevsky''s exploration of morality and guilt.', 14.25, 20, N'Fiction', 'https://i.ebayimg.com/images/g/CmMAAeSwKSdoeRGw/s-l960.webp', GETDATE(), GETDATE(), 0);
GO
