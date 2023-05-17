-- 테이블 및 시퀀스 생성
-- 멤버
CREATE TABLE member (
	member_id VARCHAR2(13) 
        CONSTRAINT member_id_pk PRIMARY KEY,
	phone_number VARCHAR2(13) 
        CONSTRAINT phone_number_nn NOT NULL 
        CONSTRAINT phone_number_uniq unique,
	member_password VARCHAR2(6) 
        CONSTRAINT member_password_nn NOT NULL,
	date_of_birth date 
        CONSTRAINT date_of_birth_nn NOT NULL,
	remain_time number(10) DEFAULT 0 
        CONSTRAINT remain_time_chk CHECK (remain_time >= 0) 
        CONSTRAINT remain_time_nn NOT NULL,
    remain_date date
        CONSTRAINT remain_date_nn NOT NULL,
	locker_number varchar2(5),
	locker_password	VARCHAR2(6)
);

create sequence member_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;
-- 좌석
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
-- 스터디룸
CREATE TABLE studyroom (
	studyroom_id varchar2(10) 
        CONSTRAINT studyroom_id_pk PRIMARY KEY,
	studyroom_category varchar2(20)
        CONSTRAINT studyroom_category NOT NULL,
	studyroom_state varchar2(20) 
        CONSTRAINT studyroom_state_nn NOT NULL
);
-- 좌석 예약
CREATE TABLE seat_reservation (
	seat_reservation_id varchar(10) 
        CONSTRAINT seat_reservation_id_pk PRIMARY KEY,
	seat_id number(3) 
        CONSTRAINT seat_id_nn NOT NULL
        CONSTRAINT seat_id_fk references seat(seat_id),
	member_id varchar2(13) 
        CONSTRAINT member_id_nn NOT NULL
        CONSTRAINT member_id_fk references member(member_id),
	seat_reservation_start_time DATE 
        CONSTRAINT seat_reservation_start_time_nn NOT NULL,
	seat_reservation_end_time DATE
);

create sequence seat_reservation_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;
-- 스터디룸 예약
CREATE TABLE studyroom_reservation (
	studyroom_reservation_id varchar(10) 
        CONSTRAINT studyroom_reservation_id_pk PRIMARY KEY,
	studyroom_id varchar2(10) NOT NULL
        CONSTRAINT studyroom_id_fk2 references studyroom(studyroom_id),
	member_id varchar2(13) NOT NULL
        CONSTRAINT member_id_fk2 references member(member_id),
    studyroom_start_time DATE 
        CONSTRAINT studyroom_start_time_nn NOT NULL,
	studyroom_end_time DATE
        CONSTRAINT studyroom_end_time_nn NOT NULL
);

create sequence studyroom_reservation_id_seq
increment by 1
start with 1
minvalue 1
maxvalue 99999999
CYCLE;
-- 이용권
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
	ticket_value varchar2(10)
        CONSTRAINT ticket_value_nn NOT NULL,
	ticket_usable_time number(2)
        CONSTRAINT ticket_usable_time_chk CHECK (ticket_usable_time >= 0)
);
-- 주문
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
-- 결제
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
select * from member;
-- 멤버 추가
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1111-1111', '000000', '2000/01/01', 200,'2023/08/30', 'L-'|| 1, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1112-1112', '000000', '2000/01/02', 200,'2023/08/30', 'L-'|| 2, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1113-1113', '000000', '2000/01/03', 200,'2023/08/30', 'L-'|| 3, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1114-1114', '000000', '2000/01/04', 200,'2023/08/30', 'L-'|| 4, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1115-1115', '000000', '2000/01/05', 200,'2023/08/30', 'L-'|| 5, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1116-1116', '000000', '2000/01/06', 200,'2023/08/30', 'L-'|| 6, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1117-1117', '000000', '2000/01/07', 200,'2023/08/30', 'L-'|| 7, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1118-1118', '000000', '2000/01/08', 200,'2023/08/30', 'L-'|| 8, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1119-1119', '000000', '2000/01/09', 200,'2023/08/30', 'L-'|| 9, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1120-1120', '000000', '2000/01/10', 200,'2023/08/30', 'L-'|| 10, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1111-1121', '000000', '2000/01/11', 200,'2023/08/30', 'L-'|| 11, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1112-1123', '000000', '2000/02/02', 200,'2023/08/30', 'L-'|| 12, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1113-1124', '000000', '2000/03/03', 200,'2023/08/30', 'L-'|| 13, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1114-1125', '000000', '2000/04/04', 200,'2023/08/30', 'L-'|| 14, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1115-1126', '000000', '2000/05/05', 200,'2023/08/30', 'L-'|| 15, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1116-1127', '000000', '2000/06/06', 200,'2023/08/30', 'L-'|| 16, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1117-1128', '000000', '2000/07/07', 200,'2023/08/30', 'L-'|| 17, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1118-1129', '000000', '2000/08/08', 200,'2023/08/30', 'L-'|| 18, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1119-1130', '000000', '2000/09/09', 200,'2023/08/30', 'L-'|| 19, '000000');
INSERT INTO member VALUES('M-'|| member_id_seq.nextval, '010-1120-1131', '000000', '2000/10/10', 200,'2023/08/30', 'L-'|| 20, '000000');

-- 좌석 추가(두개 번갈아 가면서 넣으세요)
INSERT INTO seat VALUES(seat_id_seq.nextval, '자유석', '사용중', '사용가능');
INSERT INTO seat VALUES(seat_id_seq.nextval, '자유석', '비어있음', '사용가능');

-- 스터디룸 추가
INSERT INTO STUDYROOM VALUES (
    'SI-1', '4인실', '사용가능'
);
INSERT INTO STUDYROOM VALUES (
    'SI-2', '4인실', '사용가능'
);

-- 좌석 지정
select * from seat_reservation;
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 1, 'M-1', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 2, 'M-2', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 3, 'M-3', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 4, 'M-4', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 9, 'M-5', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 10, 'M-6', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 11, 'M-7', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 13, 'M-8', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 15, 'M-9', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 17, 'M-10', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 18, 'M-11', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 19, 'M-12', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 21, 'M-13', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 22, 'M-14', sysdate);
 insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 29, 'M-15', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 30, 'M-16', sysdate);
insert into seat_reservation
    (seat_reservation_id, seat_id, member_id, seat_reservation_start_time)
values
    ('SR-'|| seat_reservation_id_seq.nextval, 31, 'M-17', sysdate);

-- 스터디룸 예약
insert into studyroom_reservation VALUES(
    studyroom_reservation_id_seq.nextval,
    'SI-1',
    'M-1',
    to_date('202305171500','YYYYMMDDHH24MI'),
    to_date('202305171700','YYYYMMDDHH24MI')
);
insert into studyroom_reservation VALUES(
    studyroom_reservation_id_seq.nextval,
    'SI-1',
    'M-2',
    to_date('202305181500','YYYYMMDDHH24MI'),
    to_date('202305191600','YYYYMMDDHH24MI')
);
insert into studyroom_reservation VALUES(
    studyroom_reservation_id_seq.nextval,
    'SI-2',
    'M-3',
    to_date('202305201700','YYYYMMDDHH24MI'),
    to_date('202305201800','YYYYMMDDHH24MI')
);
insert into studyroom_reservation VALUES(
    studyroom_reservation_id_seq.nextval,
    'SI-2',
    'M-4',
    to_date('202305210000','YYYYMMDDHH24MI'),
    to_date('202305210100','YYYYMMDDHH24MI')
);

-- 이용권
INSERT INTO ticket VALUES ('T-01', '일회이용권', '2시간이용권',5000,'2:00',0);
INSERT INTO ticket VALUES ('T-02', '일회이용권', '3시간이용권',6000,'3:00',0);
INSERT INTO ticket VALUES ('T-03', '일회이용권', '4시간이용권',7000,'4:00',0);
INSERT INTO ticket VALUES ('T-04', '일회이용권', '6시간이용권',9000,'6:00',0);
INSERT INTO ticket VALUES ('T-05', '일회이용권', '8시간이용권',12000,'8:00',0);
INSERT INTO ticket VALUES ('T-06', '일회이용권', '종일이용권',15000,'24:00',0);
INSERT INTO ticket VALUES ('T-07', '시간충전권', '30시간권',45000,'1800',3);
INSERT INTO ticket VALUES ('T-08', '시간충전권', '50시간권',75000,'3000',6);
INSERT INTO ticket VALUES ('T-09', '시간충전권', '100시간권',130000,'6000',6);
INSERT INTO ticket VALUES ('T-10', '시간충전권', '200시간권',240000,'12000',6);
--
commit;