-- liquibase formatted sql

-- changeset liquibase:1
CREATE TABLE auth_users
(
    user_id  INTEGER PRIMARY KEY,
    email    VARCHAR[255] UNIQUE NOT NULL,
    password VARCHAR[255]        NOT NULL,
    deleted  BOOLEAN             NOT NULL DEFAULT FALSE
);

CREATE TABLE users
(
    id         INTEGER PRIMARY KEY,
    first_name VARCHAR[255] NOT NULL,
    last_name  VARCHAR[255] NOT NULL,
    card_id    VARCHAR[15]  NOT NULL,
    deleted    BOOLEAN      NOT NULL DEFAULT FALSE
);

CREATE TABLE buildings
(
    id      INTEGER PRIMARY KEY,
    name    VARCHAR UNIQUE NOT NULL,
    image   VARCHAR,
    deleted BOOLEAN        NOT NULL DEFAULT FALSE
);

CREATE TABLE floors
(
    id          INTEGER PRIMARY KEY,
    building_id INTEGER NOT NULL,
    index       INTEGER NOT NULL,
    deleted     BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE rooms
(
    id       INTEGER PRIMARY KEY,
    floor_id INTEGER      NOT NULL,
    name     VARCHAR[255] NOT NULL,
    deleted  BOOLEAN      NOT NULL DEFAULT FALSE
);

CREATE TABLE room_visualizations
(
    room_id   INTEGER PRIMARY KEY,
    start_row INTEGER NOT NULL,
    start_col INTEGER NOT NULL,
    rowspan   INTEGER NOT NULL,
    colspan   INTEGER NOT NULL,
    deleted   BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE devices
(
    id                INTEGER PRIMARY KEY,
    room_id           INTEGER   NOT NULL,
    installation_date TIMESTAMP NOT NULL,
    deleted           BOOLEAN   NOT NULL DEFAULT FALSE
);

CREATE TABLE telemetry
(
    user_id   INTEGER   NOT NULL,
    device_id INTEGER   NOT NULL,
    room_id   INTEGER   NOT NULL,
    scan_time TIMESTAMP NOT NULL,
    deleted   BOOLEAN   NOT NULL DEFAULT FALSE,
    PRIMARY KEY (user_id, device_id, room_id, scan_time)
);

ALTER TABLE auth_users
    ADD FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE floors
    ADD FOREIGN KEY (building_id) REFERENCES buildings (id);

ALTER TABLE rooms
    ADD FOREIGN KEY (floor_id) REFERENCES floors (id);

ALTER TABLE room_visualizations
    ADD FOREIGN KEY (room_id) REFERENCES rooms (id);

ALTER TABLE devices
    ADD FOREIGN KEY (room_id) REFERENCES rooms (id);

ALTER TABLE telemetry
    ADD FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE telemetry
    ADD FOREIGN KEY (device_id) REFERENCES devices (id);

ALTER TABLE telemetry
    ADD FOREIGN KEY (room_id) REFERENCES rooms (id);
