
CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_id BIGINT
);

CREATE TABLE vehicle_types (
    id BIGINT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

INSERT INTO vehicle_types (id, type_name) VALUES
(1, 'Electric Vehicle'),
(2, 'Hybrid Vehicle'),
(3, 'Combustion Engine Vehicle'),
(4, 'Electric Scooter'),
(5, 'Electric Bike');

CREATE TABLE vehicles (
    id BIGINT PRIMARY KEY,
    license_plate VARCHAR(255) NOT NULL,
    type_id BIGINT,
    owner_id BIGINT,
    FOREIGN KEY (type_id) REFERENCES vehicle_types(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE transactions (
    id BIGINT PRIMARY KEY,
    amount DECIMAL(19, 2) NOT NULL,
    type VARCHAR(50) NOT NULL,
    date TIMESTAMP NOT NULL,
    user_id BIGINT,
    vehicle_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);
