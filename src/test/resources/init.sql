CREATE TABLE IF NOT EXISTS Chat (
                                    id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                    name VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS users_chat (
                                          id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                          user_id BIGINT,
                                          chat_id BIGINT,
                                          FOREIGN KEY (user_id) REFERENCES users(id),
                                          FOREIGN KEY (chat_id) REFERENCES chat(id),
                                          CONSTRAINT UC_UsersChat UNIQUE (user_id, chat_id)
);


CREATE TABLE IF NOT EXISTS users (
                                     id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                     username VARCHAR(255) UNIQUE NOT NULL,
                                     birth_date DATE,
                                     firstname VARCHAR(255),
                                     lastname VARCHAR(255),
                                     role VARCHAR(50),
                                     company_id BIGINT,
                                     FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE IF NOT EXISTS company (
                                       id INT PRIMARY KEY AUTO_INCREMENT,
                                       name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS company_locales (
                                               company_id INT NOT NULL,
                                               lang VARCHAR(10) NOT NULL,
                                               description VARCHAR(255),
                                               PRIMARY KEY (company_id, lang),
                                               FOREIGN KEY (company_id) REFERENCES company(id)
);


CREATE TABLE IF NOT EXISTS payment (
                                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                       amount INT,
                                       receiver_id BIGINT,
                                       FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS revision (
                                        id INT PRIMARY KEY AUTO_INCREMENT,
                                        timestamp BIGINT
);
