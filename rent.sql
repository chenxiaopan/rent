 ˵��:���� 
 imp system/123@ORCL  file=D:\rent.dmp  fromuser=sqb touser=cxp



select *from house;
select * from users order by userid;
select * from types;
select *from street;
select * from district;

--seq_id  house
select seq_id.nextval from dual;
--seq_uid  users
select seq_uid.currval from dual;

create sequence seq_uid
start with 1003;


create sequence seq_id
start with 4;

select seq_id.nextval from dual;


insert into users(id,name,password,telephone,username) 
values(seq_uid.nextval,'fsd','123','132134','zdfa');

delete from users where id>1009;

--������ֵ�
select * from street where district_id=1004;

select * from street where district_id=1006;


select * from house;

--��ϸ��Ϣ
select * from vw_my;


grant create view to cxp;

--pubdateΪ��������,���Ƿ���֤����
create or replace  view vw_my
as
select  t.name tname,h.title,h.price, h.pubdate,h.floorage, h.description,h.contact,dt.name disname,
st.name strname
from house h,types t,street st,district dt
where h.type_id=t.id and h.street_id=st.id and st.district_id = dt.id;


 select em.* from( select e.* ,rownum r from( select * from vw_my  order by pubdate) e where rownum<=5) em where r>0;


    select
        house0_.ID as ID1_1_,
        house0_.TYPE_ID as TYPE_ID2_1_,
        house0_.STREET_ID as STREET_I3_1_,
        house0_.USER_ID as USER_ID4_1_,
        house0_.TITLE as TITLE5_1_,
        house0_.DESCRIPTION as DESCRIPT6_1_,
        house0_.PRICE as PRICE7_1_,
        house0_.PUBDATE as PUBDATE8_1_,
        house0_.FLOORAGE as FLOORAGE9_1_,
        house0_.CONTACT as CONTACT10_1_ 
    from
        CXP.HOUSE house0_ 
    where
        (
            house0_.PRICE between 0 and 100000
        ) 
       and (
            house0_.STREET_ID like null
        )
        
       select
        house0_.ID as ID1_1_,
        house0_.TYPE_ID as TYPE_ID2_1_,
        house0_.STREET_ID as STREET_I3_1_,
        house0_.USER_ID as USER_ID4_1_,
        house0_.TITLE as TITLE5_1_,
        house0_.DESCRIPTION as DESCRIPT6_1_,
        house0_.PRICE as PRICE7_1_,
        house0_.PUBDATE as PUBDATE8_1_,
        house0_.FLOORAGE as FLOORAGE9_1_,
        house0_.CONTACT as CONTACT10_1_ 
    from
        CXP.HOUSE house0_ cross 
    join
        CXP.STREET street1_ cross 
    join
        CXP.TYPES types2_ 
    where
        house0_.STREET_ID=street1_.ID 
        and house0_.TYPE_ID=types2_.ID 
        and (
            house0_.PRICE between 0 and 100000
        ) 
        and (
            street1_.NAME like  '%%'
        )      
        
        
