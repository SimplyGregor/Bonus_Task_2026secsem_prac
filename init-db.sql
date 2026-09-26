-- Очистка таблиц, если они уже существовали
DROP TABLE IF EXISTS passwords;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS banks;

-- Создание таблицы пользователей
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) UNIQUE NOT NULL,
    money_amount NUMERIC(10, 2) NOT NULL,
    card_number VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL -- 'active' или 'inactive'
);

-- Создание таблицы паролей
CREATE TABLE passwords (
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE banks (
    user_id INTEGER PRIMARY KEY,
    bank_name TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Заполнение таблицы пользователей (минимум 5 пользователей: 3 активных, 2 неактивных)
INSERT INTO users (id, login, money_amount, card_number, status) VALUES
(1, 'admin', 1500.50, '4000 1234 5678 9010', 'active'),
(2, 'alice', 450.00, '4111 2222 3333 4444', 'active'),
(3, 'bob', 120.30, '5200 8888 9999 1111', 'active'),
(4, 'charlie', 0.00, '5399 0000 1111 2222', 'inactive'),
(5, 'dave', 50.10, '4222 3333 4444 5555', 'inactive');

-- Заполнение таблицы паролей для каждого пользователя
INSERT INTO passwords (user_id, password) VALUES
(1, 'AdminSuperSecret2026!'),
(2, 'alice_secure_pass_99'),
(3, 'bob_qwerty_123'),
(4, 'charlie_old_2024'),
(5, 'dave_guest_pwd');

INSERT INTO banks (user_id, bank_name) VALUES
(1, 'Sberbank'),
(2, 'Tinkoff'),
(3, 'Alfa-Bank'),
(4, 'VTB'),
(5, 'Gazprombank'),
(6, 'Raiffeisen');