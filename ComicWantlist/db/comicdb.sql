USE comicdb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE comic_want_list (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    comic_title VARCHAR(255) NOT NULL,
    comic_issue VARCHAR(50),
    publisher VARCHAR(100),
    release_year INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comic_stores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    phone VARCHAR(20),
    website VARCHAR(255)
);

INSERT INTO users (username, email, password) VALUES 
('comicfan123', 'comicfan@example.com', 'securepassword');

INSERT INTO comic_want_list (user_id, comic_title, comic_issue, publisher, release_year) VALUES 
(1, 'The Amazing Spider-Man', '300', 'Marvel', 1988);

INSERT INTO comic_stores (store_name, address, city, state, zip_code, phone, website) VALUES 
('Gotham Comics', '123 Main St', 'New York', 'NY', '10001', '555-1234', 'http://gothamcomics.com');

SELECT * FROM users;
SELECT * FROM comic_want_list;
SELECT * FROM comic_stores;