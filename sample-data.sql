--Inserts
insert into zip (zipcode, city) values
('2620', 'Neunkirchen'),
('1010', 'Wien'),
('8010', 'Graz'),
('5020', 'Salzburg'),
('6020', 'Innsbruck'),
('2700', 'Wr. Neustadt'),
('1020', 'Wien'),
('1060', 'Wien');

insert into guest (
    firstname, lastname, birthdate, email, phonenumber, street, housenumber, zipcode
) values
('Leon', 'Gruber', '1985-04-12', 'leon.g@mail.at', '0664111111', 'Hauptstraße', '12', '2620'),
('Marie', 'Hofer', '2002-11-28', 'marie.h@mail.at', '0664222222', 'Ringstraße', '5', '1010'),
('Lukas', 'Steiner', '1978-07-05', 'lukas.s@mail.at', '0664333333', 'Bahnhofstraße', '8', '8010'),
('Sarah', 'Wagner', '1996-01-19', 'sarah.w@mail.at', '0664444444', 'Alpenweg', '22', '5020'),
('Paul', 'Moser', '2005-09-14', 'paul.m@mail.at', '0664555555', 'Dorfplatz', '3', '6020'),
('Nina', 'Bauer', '1989-10-31', 'nina.b@mail.at', '0664666666', 'Seestraße', '17', '2700'),
('Anna', 'Fischer', '1967-03-08', 'anna.f@mail.at', '0664777777', 'Parkgasse', '14', '1020'),
('David', 'Novak', '1991-12-22', 'david.n@mail.at', '0664888888', 'Favoritenstraße', '31', '1010'),
('Julia', 'Pichler', '2007-06-03', 'julia.p@mail.at', '0664999999', 'Herrengasse', '9', '8010'),
('Markus', 'Kern', '1981-02-17', 'markus.k@mail.at', '0664123456', 'Mariahilfer Straße', '88', '1060');

insert into room (
    room_id, roomnumber, category, pricepernight_eur
) values
('R101', 101, 'Standard', 89.00),
('R102', 102, 'Standard', 92.00),
('R103', 103, 'Standard', 95.00),
('R201', 201, 'Deluxe', 129.00),
('R202', 202, 'Deluxe', 135.00),
('R203', 203, 'Deluxe', 140.00),
('R301', 301, 'Suite', 210.00),
('R302', 302, 'Suite', 220.00),
('R303', 303, 'Suite', 230.00);


insert into reservation (
    guest_id, checkindate, checkoutdate, status
) values
('G1001', '2026-05-04', '2026-05-11', 'checked-out'),
('G1002', '2026-05-15', '2026-05-18', 'checked-out'),
('G1003', '2026-05-18', '2026-05-25', 'checked-in'),
('G1004', '2026-05-20', '2026-06-01', 'checked-in'),
('G1005', '2026-05-22', '2026-05-28', 'checked-in'),
('G1006', '2026-05-24', '2026-06-05', 'checked-in'),
('G1007', '2026-06-12', '2026-06-15', 'checked-in'),
('G1002', '2026-08-03', '2026-08-10', 'booked'),
('G1003', '2026-08-12', '2026-08-17', 'cancelled'),
('G1005', '2026-08-21', '2026-08-23', 'booked'),
('G1010', '2026-08-25', '2026-09-05', 'cancelled');

insert into room_reservation (
    reservation_id, room_id
) values
('R2026-001', 'R101'),
('R2026-001', 'R102'),
('R2026-002', 'R201'),
('R2026-003', 'R301'),
('R2026-003', 'R302'),
('R2026-004', 'R103'),
('R2026-005', 'R202'),
('R2026-006', 'R203'),
('R2026-007', 'R101'),
('R2026-008', 'R102'),
('R2026-010', 'R201');

insert into invoice (
    reservation_id, invoicedate, totalamount_eur, paymentstatus
) values
('R2026-001', '2026-05-11', 684.00, 'paid'),
('R2026-002', '2026-05-18', 733.00, 'paid');

insert into staff (
    firstname, lastname, email, phonenumber, role
) values
('Martin', 'Hofer', 'martin.hofer@hotel.at', '06642100001', 'manager'),
('Eva', 'Leitner', 'eva.leitner@hotel.at', '06642100002', 'receptionist'),
('Daniel', 'Gruber', 'daniel.gruber@hotel.at', '06642100003', 'receptionist'),
('Sarah', 'Moser', 'sarah.moser@hotel.at', '06642100004', 'service'),
('Lukas', 'Berger', 'lukas.berger@hotel.at', '06642100005', 'service'),
('Felix', 'Huber', 'felix.huber@hotel.at', '06642100006', 'service'),
('Laura', 'Eder', 'laura.eder@hotel.at', '06642100007', 'housekeeping'),
('Jonas', 'Bauer', 'jonas.bauer@hotel.at', '06642100008', 'housekeeping'),
('Theresa', 'Wallner', 'theresa.wallner@hotel.at', '06642100009', 'service'),
('Paul', 'Schmid', 'paul.schmid@hotel.at', '06642100010', 'technician');

insert into service (
    name, description, price_eur
) values
('Breakfast Buffet', 'Breakfast in the hotel restaurant', 18.00),
('Room Service', 'Food delivered directly to the room', 25.00),
('Spa Access', 'Access to sauna and pool', 35.00),
('60-Minute Massage', 'Full body massage', 65.00),
('Parking', 'Underground parking per night', 12.00),
('Late Check-out', 'Keep the room until 14:00', 20.00),
('Laundry Service', 'Cleaning of clothes', 15.00);

insert into service_booking (
    reservation_id, service_id, staff_id, bookingdate, quantity
) values
('R2026-001', 'D01', null, '2026-05-05', 2),
('R2026-001', 'D01', null, '2026-05-06', 1),
('R2026-001', 'D02', 'P004', '2026-05-06', 1),
('R2026-002', 'D03', null, '2026-05-16', 2),
('R2026-003', 'D02', 'P004', '2026-05-19', 1),
('R2026-003', 'D04', 'P009', '2026-05-20', 1),
('R2026-003', 'D01', null, '2026-05-21', 2),
('R2026-004', 'D01', null, '2026-05-21', 1),
('R2026-004', 'D06', null, '2026-05-31', 1),
('R2026-005', 'D03', null, '2026-05-23', 2),
('R2026-005', 'D02', 'P004', '2026-05-24', 1),
('R2026-006', 'D05', null, '2026-05-26', 1),
('R2026-006', 'D02', 'P004', '2026-05-27', 1),
('R2026-007', 'D04', 'P009', '2026-06-13', 1),
('R2026-007', 'D02', 'P004', '2026-06-14', 1),
('R2026-007', 'D03', null, '2026-06-15', 1);

insert into maintenance (
    staff_id, room_id, maintenance_date, description, status
) values
('P010', 'R102', '2026-05-12', 'TV no signal', 'completed'),
('P010', 'R301', '2026-05-26', 'Air conditioning faulty', 'completed'),
('P008', 'R302', '2026-05-26', 'Leaking faucet', 'completed'),
('P010', 'R103', '2026-06-02', 'Door lock jammed', 'completed'),
('P008', 'R203', '2026-06-06', 'Damaged power outlet', 'open'),
('P010', 'R101', '2026-06-18', 'Ceiling light defective', 'open');

insert into event (
    title, event_date, min_participants, status
) values
('Yoga & Meditation', '2026-05-16', 10, 'planned'),
('Italian Cooking Class', '2026-05-21', 5, 'confirmed'),
('Wine Tasting', '2026-05-24', 8, 'planned'),
('Business Workshop', '2026-06-04', 15, 'cancelled'),
('Wellness Day', '2026-06-14', 6, 'planned');

insert into event_registration (
    guest_id, event_id
) values
('G1002', 'E001'),
('G1003', 'E002'),
('G1003', 'E003'),
('G1004', 'E002'),
('G1004', 'E003'),
('G1005', 'E003'),
('G1006', 'E003'),
('G1007', 'E005');

insert into event_staff_allocation (
    staff_id, event_id
) values
('P001', 'E001'),
('P009', 'E001'),
('P007', 'E002'),
('P004', 'E002'),
('P006', 'E003'),
('P001', 'E003'),
('P009', 'E005'),
('P004', 'E005');
