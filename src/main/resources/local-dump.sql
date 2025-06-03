-- buildings
INSERT INTO buildings (name, image)
VALUES ('FER - D zgrada',
        'https://imgs.search.brave.com/ScBlCgWrxqVp0oqsgnPCzP1IsvjoJRsmMZCAFLtsQKc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/c3JlZG5qYS5oci9h/cHAvdXBsb2Fkcy8y/MDE2LzAyL0Zha3Vs/dGV0LWVsZWt0cm90/ZWhuaWtlLWktcmEl/QzQlOER1bmFyc3R2/YV9JdmFuLUtsaW5k/aSVDNCU4Ny0zLmpw/Zw');

-- floors
INSERT INTO floors (building_id, index)
VALUES (1, 0);
INSERT INTO floors (building_id, index)
VALUES (1, 1);
INSERT INTO floors (building_id, index)
VALUES (1, 2);

-- rooms
INSERT INTO rooms (floor_id, name)
VALUES (1, 'Bijela vijećnica');
INSERT INTO rooms (floor_id, name)
VALUES (1, 'Siva vijećnica');
INSERT INTO rooms (floor_id, name)
VALUES (1, 'WC');

-- room visualizations
INSERT INTO room_visualizations (room_id, start_row, start_col, rowspan, colspan)
VALUES (1, 0, 0, 2, 2);
INSERT INTO room_visualizations (room_id, start_row, start_col, rowspan, colspan)
VALUES (2, 0, 2, 2, 2);
INSERT INTO room_visualizations (room_id, start_row, start_col, rowspan, colspan)
VALUES (3, 0, 4, 2, 1);

-- devices
INSERT INTO devices (room_id, installation_date)
VALUES (1, NOW());
INSERT INTO devices (room_id, installation_date)
VALUES (2, NOW());
INSERT INTO devices (room_id, installation_date)
VALUES (3, NOW());

-- users
INSERT INTO users (first_name, last_name, card_id)
VALUES ('Sebastian', 'Vettel', '10-11-12-13');
INSERT INTO users (first_name, last_name, card_id)
VALUES ('Lewis', 'Hamilton', '08-14-18-20');
INSERT INTO users (first_name, last_name, card_id)
VALUES ('Max', 'Verstappen', '21-22-23-24');
