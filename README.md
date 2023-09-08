# practice4
### 골프연습장 회원관리 프로그램






📌강사 테이블 생성

    create table tbl_teacher(
    
          tcode char(03) not null,
          tname varchar2(15),
          classname varchar2(20),
          classprice  varchar2(08),
          teachdate varchar2(08),
          primary key(tcode)
    
    );

📌회원 테이블 생성

    create table tbl_member(
    
          cno char(05) not null,
          cname varchar2(15),
          phone varchar2(11),
          address varchar2(50),
          grade varchar2(06),
          primary key(cno)
    
    );


📌수강 테이블 생성

    create table tbl_class(
    
          month varchar2(06) not null,
          cno char(05) not null,
          area varchar2(15),
          tuition number(08),
          tcode char(03),
          primary key(month, cno)
    
    );

📌강사 데이터 저장


    insert into tbl_teacher values('100','이초급','초급반','100000','20220101');
    insert into tbl_teacher values('200','김중급','중급반','200000','20220102');
    insert into tbl_teacher values('300','박고급','고급반','300000','20220103');
    insert into tbl_teacher values('400','정심화','심화반','400000','20220104');


📌회원 데이터 저장 

    insert into tbl_member values('10001','홍길동','01011112222','서울강남','일반');
    insert into tbl_member values('10002','장발장','01011113333','성남분당','일반');
    insert into tbl_member values('10003','임꺽정','01011114444','대전유성','일반');
    insert into tbl_member values('20001','성춘향','01011115555','부산서구','VIp');
    insert into tbl_member values('20002','이몽룡','01011116666','대구북구','VIP');




📌수강 데이터 저장 


    insert into tbl_class values('202203','10001','서울본원','100000','100');
    insert into tbl_class values('202203','10002','성남분원','100000','100');
    insert into tbl_class values('202203','10003','대전분원','200000','200');
    insert into tbl_class values('202203','20001','부산분원','150000','300');
    insert into tbl_class values('202203','20002','대구분원','200000','400');

    commit;

📌테이블 조회

    select c.month,m.cno, m.cname,t.classname,c.area,t.classprice,m.grade from tbl_teacher t, tbl_member m, tbl_class c where t.tcode=c.tcode and m.cno=c.cno;












