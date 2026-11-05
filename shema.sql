--Drop
drop table if exists event_staff_allocation;
drop table if exists event_registration;
drop table if exists event;
drop table if exists service_booking;
drop table if exists maintenance;
drop table if exists service;
drop table if exists staff;
drop table if exists invoice;
drop table if exists room_reservation;
drop table if exists reservation;
drop table if exists room;
drop table if exists guest;
drop table if exists zip;

drop sequence if exists guest_seq;
drop sequence if exists reservation_seq;
drop sequence if exists invoice_seq;
drop sequence if exists staff_seq;
drop sequence if exists service_seq;
drop sequence if exists servicebooking_seq;
drop sequence if exists maintenance_seq;
drop sequence if exists event_seq;

--Sequence
create sequence guest_seq start with 1001 increment by 1;
create sequence reservation_seq start with 1 increment by 1;
create sequence invoice_seq start with 1 increment by 1;
create sequence staff_seq start with 1 increment by 1;
create sequence service_seq start with 1 increment by 1;
create sequence servicebooking_seq start with 1 increment by 1;
create sequence maintenance_seq start with 1 increment by 1;
create sequence event_seq start with 1 increment by 1;

--tables
create table zip (
    zipcode varchar (10) primary key,
    city varchar(100) not null
);

create table guest (
    guest_id varchar(10) primary key
        default ('G' || nextval('guest_seq')::text),
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    birthdate date not null,
    email varchar(100)  not null,
    phonenumber varchar(30),
    street varchar(100),
    housenumber varchar(10),
    zipcode varchar(10) not null references zip(zipcode)

);

create table room (
    room_id varchar(10) primary key,
    roomnumber int not null unique,
    category varchar(20) not null,
    pricepernight_eur decimal(8,2) not null,

    check (category in ('Standard', 'Deluxe', 'Suite')),
    check (pricepernight_eur > 0)
);

create table reservation (
    reservation_id varchar(20) primary key
        default ('R2026-' || lpad(nextval('reservation_seq')::text, 3, '0')),
    guest_id varchar(10) not null references guest(guest_id),
    checkindate date not null,
    checkoutdate date not null,
    status varchar(20) not null default 'booked'
        check (status in ('booked', 'checked-in', 'checked-out', 'cancelled')),
    check (checkoutdate > checkindate)
);

 create table room_reservation (
    reservation_id varchar(20) not null references reservation(reservation_id),
    room_id varchar(10) not null references room(room_id),

    primary key (reservation_id, room_id)
 );

create table invoice (
    invoice_id varchar(20) primary key
        default ('I2026-' || lpad(nextval('invoice_seq')::text, 3, '0')),
    reservation_id varchar(20) not null unique references reservation(reservation_id),
    invoicedate date not null,
    totalamount_eur decimal(10,2) not null check (totalamount_eur >= 0),
    paymentstatus varchar(20) not null default 'open'
        check (paymentstatus in ('open', 'overdue', 'paid', 'cancelled'))
);

create table staff (
    staff_id varchar(10) primary key
        default ('P' || lpad(nextval('staff_seq')::text, 3, '0')),
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(100) not null unique,
    phonenumber varchar(30),
    role varchar(50) not null
);

create table service (
    service_id varchar(10) primary key
        default ('D' || lpad(nextval('service_seq')::text, 2, '0')),
    name varchar(100) not null,
    description varchar(255),
    price_eur decimal(8,2) not null check (price_eur >= 0)
);

create table service_booking (
    servicebooking_id varchar(20) primary key
        default ('SB2026-' || nextval('servicebooking_seq')::text),
    reservation_id varchar(20) not null references reservation(reservation_id),
    service_id varchar(10) not null references service(service_id),
    staff_id varchar(10) references staff(staff_id),
    bookingdate date not null,
    quantity int not null check (quantity > 0)
);

create table maintenance (
    maintenance_id varchar(10) primary key
        default ('M' || lpad(nextval('maintenance_seq')::text, 3, '0')),
    staff_id varchar(10) not null references staff(staff_id),
    room_id varchar(10) not null references room(room_id),    
    maintenance_date date not null,
    description varchar(255) not null,
    status varchar(20) not null default 'open'
        check (status in ('open', 'completed'))
);

create table event (
    event_id varchar(10) primary key
        default ('E' || lpad(nextval('event_seq')::text, 3, '0')),
    title varchar(100) not null,
    event_date date not null,
    min_participants int not null check (min_participants > 0),
    status varchar(20) not null default 'planned'
        check (status in ('planned', 'confirmed', 'cancelled', 'completed'))
);
create table event_registration (
    guest_id varchar(10) not null references guest(guest_id),
    event_id varchar(10) not null references event(event_id),

    primary key (guest_id, event_id)
);

create table event_staff_allocation (
    staff_id varchar(10) not null references staff(staff_id),
    event_id varchar(10) not null references event(event_id),

    primary key (staff_id, event_id)
);
