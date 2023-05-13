show user;
SELECT * FROM tab; 
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME ='ticket';
SELECT * FROM user_constraints;

SELECT * FROM user_sequences;

--member
CREATE TABLE member (
	member_id varchar2(13) 
        CONSTRAINT member_id_pk PRIMARY KEY,
	phone_number varchar2(13) 
        CONSTRAINT phone_number_nn NOT NULL 
        CONSTRAINT phone_number_uniq unique,
	member_password number(6) 
        CONSTRAINT member_password_nn NOT NULL,
	date_of_birth date 
        CONSTRAINT date_of_birth_nn NOT NULL,
	mileage number(8) DEFAULT 0  
        CONSTRAINT mileage_chk CHECK (mileage >= 0)
        CONSTRAINT mileage_nn NOT NULL,
	remain_time number(10) DEFAULT 0 
        CONSTRAINT remain_time_chk CHECK (remain_time >= 0) 
        CONSTRAINT remain_time_nn NOT NULL,
	locker_number varchar2(3),
	locker_password	number(6)
);

create sequence member_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

INSERT INTO member(member_id) VALUES ('M-'|| prime_seq.nextval);


-- ticket_order
CREATE TABLE ticket_order (
	order_id varchar2(13) 
        CONSTRAINT order_id_pk PRIMARY KEY,
	member_id varchar2(13) NOT NULL 
        CONSTRAINT member_id_fk3 references member(member_id),
	ticket_id varchar2(8) 
        CONSTRAINT ticket_id_nn NOT NULL
        CONSTRAINT ticket_id_fk references ticket(ticket_id),
	pay_id varchar2(10) 
        CONSTRAINT pay_id_nn NOT NULL 
        CONSTRAINT pay_id_fk references payment(pay_id),
    order_date date 
        CONSTRAINT order_date_nn NOT NULL
);


create sequence order_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

INSERT INTO ticket_order(order_id) VALUES ('O-'|| prime_seq.nextval);
        
-- ticket ¿Ï·á
CREATE TABLE ticket(
	ticket_id varchar2(8)
        CONSTRAINT ticket_id_pk PRIMARY KEY,
	ticket_category varchar2(30) 
        CONSTRAINT ticket_category_nn NOT NULL,
	ticket_name varchar2(30)
        CONSTRAINT ticket_name_nn NOT NULL,
	ticket_price number(10) 
        CONSTRAINT ticket_price_nn NOT NULL
        CONSTRAINT ticket_price_chk CHECK (ticket_price >= 0),
	ticket_value number(5)
        CONSTRAINT ticket_value_chk CHECK (ticket_value >= 0),
	ticket_usable_time number(2)
        CONSTRAINT ticket_usable_time_chk CHECK (ticket_usable_time >= 0)
);


create sequence ticket_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

INSERT INTO ticket(ticket_id) VALUES ('T-'|| prime_seq.nextval);


-- seat_reservation
CREATE TABLE seat_reservation (
	seat_reservation_id varchar(10) 
        CONSTRAINT seat_reservation_id_pk PRIMARY KEY,
	seat_id number(3) 
        CONSTRAINT seat_id_nn NOT NULL
        CONSTRAINT seat_id_fk references seat(seat_id),
	member_id varchar2(13) 
        CONSTRAINT member_id_nn NOT NULL
        CONSTRAINT member_id_fk references member(member_id),
	seat_reservation_start_time VARCHAR2(10) 
        CONSTRAINT seat_reservation_start_time_nn NOT NULL,
	seat_reservation_end_time VARCHAR2(10)
);


create sequence seat_reservation_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

INSERT INTO member(member_id) VALUES ('SRI-'|| prime_seq.nextval);

--payment
CREATE TABLE payment (
	pay_id varchar2(10) 
        CONSTRAINT pay_id_pk PRIMARY KEY,
	pay_type varchar2(10) 
        CONSTRAINT pay_type_nn NOT NULL,
	pay_date date 
        CONSTRAINT pay_date_nn NOT NULL,
	pay_money number(10)
    CONSTRAINT pay_money_chk CHECK (pay_money >= 0)
    CONSTRAINT pay_money_nn NOT NULL,
	pay_state varchar2(20) 
    CONSTRAINT pay_state_nn NOT NULL
);

create sequence pay_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

INSERT INTO payment(pay_id) VALUES ('PI-'|| prime_seq.nextval);

-- seat
CREATE TABLE seat (
	seat_id number(3) 
        CONSTRAINT seat_id_pk PRIMARY KEY,
	seat_category varchar2(20) 
        CONSTRAINT seat_category_nn NOT NULL,
	seat_state varchar2(20)	
        CONSTRAINT seat_state_nn NOT NULL,
    seat_usable varchar2(20) 
        CONSTRAINT seat_usable_nn NOT NULL
);


create sequence seat_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

-- manager
CREATE TABLE manager (
	mgr_id number(10) 
        CONSTRAINT mgr_id_pk PRIMARY KEY,
	mgr_pw number(6) 
        CONSTRAINT mgr_pw_nn NOT NULL
);

create sequence mgr_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

-- studyroom
CREATE TABLE studyroom (
	studyroom_id varchar2(10) 
        CONSTRAINT studyroom_id_pk PRIMARY KEY,
	studyroom_category varchar2(20)
        CONSTRAINT studyroom_category NOT NULL,
	studyroom_state varchar2(20) 
        CONSTRAINT studyroom_state_nn NOT NULL
);

create sequence studyroom_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

INSERT INTO studyroom(studyroom_id) VALUES ('SI-'|| prime_seq.nextval);

-- studyroom_reservation
CREATE TABLE studyroom_reservation (
	studyroom_reservation_id varchar(10) 
        CONSTRAINT studyroom_reservation_id_pk PRIMARY KEY,
	studyroom_id varchar2(10) NOT NULL
        CONSTRAINT studyroom_id_fk2 references studyroom(studyroom_id),
	member_id varchar2(13) NOT NULL
        CONSTRAINT member_id_fk2 references member(member_id),
    studyroom_reservation_date DATE 
        CONSTRAINT studyroom_reservation_date_nn NOT NULL,
    study_room_start_time VARCHAR2(10)
        CONSTRAINT study_room_start_time_nn NOT NULL,
	study_room_end_time VARCHAR2(10)
        CONSTRAINT study_room_end_time_nn NOT NULL
);



create sequence studyroom_reservation_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;

INSERT INTO studyroom_reservation(studyroom_reservation_id) VALUES ('SR-'|| prime_seq.nextval);


