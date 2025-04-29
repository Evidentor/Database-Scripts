-- liquibase formatted sql

-- changeset evidentor:00
CREATE TABLE auth_users
(
    user_id  SERIAL PRIMARY KEY,
    email    TEXT UNIQUE NOT NULL,
    password TEXT        NOT NULL,
    deleted  BOOLEAN             NOT NULL DEFAULT FALSE
);

CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name  TEXT NOT NULL,
    card_id    VARCHAR[15]  NOT NULL,
    deleted    BOOLEAN      NOT NULL DEFAULT FALSE
);

CREATE TABLE buildings
(
    id      SERIAL PRIMARY KEY,
    name    TEXT UNIQUE NOT NULL,
    image   TEXT,
    deleted BOOLEAN        NOT NULL DEFAULT FALSE
);

CREATE TABLE floors
(
    id          SERIAL PRIMARY KEY,
    building_id INTEGER NOT NULL,
    index       INTEGER NOT NULL,
    deleted     BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE rooms
(
    id       BIGSERIAL PRIMARY KEY,
    floor_id INTEGER      NOT NULL,
    name     TEXT NOT NULL,
    deleted  BOOLEAN      NOT NULL DEFAULT FALSE
);

CREATE TABLE room_visualizations
(
    room_id   BIGINT PRIMARY KEY,
    start_row SMALLINT NOT NULL,
    start_col SMALLINT NOT NULL,
    rowspan   SMALLINT NOT NULL,
    colspan   SMALLINT NOT NULL,
    deleted   BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE devices
(
    id                SERIAL PRIMARY KEY,
    room_id           BIGINT   NOT NULL,
    installation_date TIMESTAMP NOT NULL,
    deleted           BOOLEAN   NOT NULL DEFAULT FALSE
);

CREATE TABLE telemetry
(
    user_id   INTEGER   NOT NULL,
    device_id INTEGER   NOT NULL,
    room_id   BIGINT   NOT NULL,
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
