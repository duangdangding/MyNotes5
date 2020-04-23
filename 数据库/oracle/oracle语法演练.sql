--������ռ�
create tablespace wateros
datafile 'C:\oracle\tablespaces\wateros.dbf'
size 30m
autoextend on next 5m;

--�����û�
create user water identified by water default tablespace wateros;

--Ȩ��
grant dba to water;

--����ҵ�����ͱ�
--varchar2�������ָ������
create table t_ownertype(
id number primary key,
name varchar2(30)
);

--����ҵ����
create table t_owners(
id number primary key,
name varchar2(30),
addressid number,
housenuber varchar2(30),
watermeter varchar2(30),
adddate date,
ownertypeid number
);

--����ֶ�
create table myuser(id number primary key);
alter table myuser add(name varchar2(30));

--�޸��ֶ�����
alter table myuser modify(name number);

--�޸��ֶ���
alter table myuser rename column name to age;

--ɾ���ֶ�
alter table myuser drop column name;
alter table myuser drop(name ,age);

--ɾ����
DROP TABLE MYUSER;

--�������Լ��
alter table myuser add primary key(id);

--������Լ��
alter table myuser add foreign key(id) references myuser(id))

--�ǿ�Լ��
alter table myuser modify name not null;

--ΨһԼ��
alter table myuser modify name unique;

--���Լ��
alter table myuser modify name check(name is null)

--��ѯ��
select * from t_ownertype;
select * from t_owners;

--��������������� (�Ա������ɾ�ö���Ҫ�ύcommit)
insert into myuser values(1,1);
commit;

--�޸ı�����
update myuser set name=?,id=? where id=? and ? or ?

--ɾ��������
delete from myuser where taojian

--�Ƚ�delete��truncateʵ������ɾ���Ĳ�ͬ
--deleteɾ�������ݿ���rollback
--deleteɾ�����ܲ�����Ƭ�����Ҳ��ͷſռ�
--truncate���ȴݻٱ�ṹ���������½���ṹ
truncate table myuser;
--sysdateϵͳʱ��
--�Ա�����޸ĵ�ʱ������ύcommit


--α��  ���  dual
--oracle
select 3+2 from dual;
--mysql
select 3+2;

drop table t_ownertype;
drop table t_owners;

--�����۸������
create  table t_pricetable
(
id number primary key,
price number(10,2),
ownertypeid number,
minnum number,
maxnum number
);


--ҵ������
create table t_ownertype
(
id number primary key,
name varchar2(30)
);

--ҵ����
create table t_owners
(
id number primary key,
name varchar2(30),
addressid number,
housenumber varchar2(30),
watermeter varchar2(30),
adddate date,
ownertypeid number
);



--�����
create table t_area
(
id number,
name varchar2(30)
);

--�շ�Ա��
create table t_operator
(
id number,
name varchar2(30)
);


--��ַ��
create table t_address
(
id number primary key,
name varchar2(100),
areaid number,
operatorid number
);


--�����--
create table t_account 
(
id number primary key,
owneruuid number,
ownertype number,
areaid number,
year char(4),
month char(2),
num0 number,
num1 number,
usenum number,
meteruser number,
meterdate date,
money number(10,2),
isfee char(1),
feedate date,
feeuser number
);




create sequence seq_account;

--ҵ������
insert into t_ownertype values(1,'����');
insert into t_ownertype values(2,'������ҵ��λ');
insert into t_ownertype values(3,'��ҵ');
select * from t_ownertype;

--��ַ��Ϣ--
insert into t_address values( 1,'���˻�԰',1,1);
insert into t_address values( 2,'��Դ����',1,1);
insert into t_address values( 3,'����Է����С��',2,2);
insert into t_address values( 4,'���ϻ�԰',2,2);
insert into t_address values( 5,'��Ӫ',2,2);
insert into t_address values( 6,'�����۶����',3,2);
insert into t_address values( 7,'������',3,2);
select * from t_address;

--ҵ����Ϣ
insert into t_owners values(1,'����',1,'1-1','30406',to_date('2015-04-12','yyyy-MM-dd'),1 );
insert into t_owners values(2,'��ǿ',1,'1-2','30407',to_date('2015-02-14','yyyy-MM-dd'),1 );
insert into t_owners values(3,'����',1,'1-3','30408',to_date('2015-03-18','yyyy-MM-dd'),1 );
insert into t_owners values(4,'��С��',2,'2-4','30409',to_date('2015-06-15','yyyy-MM-dd'),1);
insert into t_owners values(5,'����',2,'2-5','30410',to_date('2013-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(6,'����',2,'2-2','30411',to_date('2014-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(7,'�ܽ�',3,'2-5','30433',to_date('2016-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(8,'����',4,'2-2','30455',to_date('2016-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(9,'��ƽ������ҽ���ҽԺ',5,'2-2','30422',to_date('2016-10-11','yyyy-MM-dd'),2 );
insert into t_owners values(10,'����������',5,'4-2','30423',to_date('2016-10-12','yyyy-MM-dd'),3 );
select * from t_owners;

--����Ա
insert into t_operator values(1,'��С��');
insert into t_operator values(2,'��仨');
select * from t_operator;


--����--
insert into t_area values(1,'����');
insert into t_area values(2,'��ƽ');
insert into t_area values(3,'����');
insert into t_area values(4,'����');
insert into t_area values(5,'����');
insert into t_area values(6,'����');
select * from t_area;


--�۸��--

insert into t_pricetable values(1,2.45,1,0,5);
insert into t_pricetable values(2,3.45,1,5,10);
insert into t_pricetable values(3,4.45,1,10,null);

insert into t_pricetable values(4,3.87,2,0,5);
insert into t_pricetable values(5,4.87,2,5,10);
insert into t_pricetable values(6,5.87,2,10,null);

insert into t_pricetable values(7,4.36,3,0,5);
insert into t_pricetable values(8,5.36,3,5,10);
insert into t_pricetable values(9,6.36,3,10,null);
select * from t_pricetable;


--�����--
insert into t_account values( seq_account.nextval,1,1,1,'2012','01',30203,50123,0,1,sysdate,34.51,'1',to_date('2012-02-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','02',50123,60303,0,1,sysdate,23.43,'1',to_date('2012-03-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','03',60303,74111,0,1,sysdate,45.34,'1',to_date('2012-04-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','04',74111,77012,0,1,sysdate,52.54,'1',to_date('2012-05-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','05',77012,79031,0,1,sysdate,54.66,'1',to_date('2012-06-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','06',79031,80201,0,1,sysdate,76.45,'1',to_date('2012-07-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','07',80201,88331,0,1,sysdate,65.65,'1',to_date('2012-08-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','08',88331,89123,0,1,sysdate,55.67,'1',to_date('2012-09-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','09',89123,90122,0,1,sysdate,112.54,'1',to_date('2012-10-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','10',90122,93911,0,1,sysdate,76.21,'1',to_date('2012-11-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','11',93911,95012,0,1,sysdate,76.25,'1',to_date('2012-12-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,1,1,1,'2012','12',95012,99081,0,1,sysdate,44.51,'1',to_date('2013-01-14','yyyy-MM-dd'),2 );

insert into t_account values( seq_account.nextval,2,1,3,'2012','01',30334,50433,0,1,sysdate,34.51,'1',to_date('2013-02-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','02',50433,60765,0,1,sysdate,23.43,'1',to_date('2013-03-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','03',60765,74155,0,1,sysdate,45.34,'1',to_date('2013-04-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','04',74155,77099,0,1,sysdate,52.54,'1',to_date('2013-05-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','05',77099,79076,0,1,sysdate,54.66,'1',to_date('2013-06-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','06',79076,80287,0,1,sysdate,76.45,'1',to_date('2013-07-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','07',80287,88432,0,1,sysdate,65.65,'1',to_date('2013-08-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','08',88432,89765,0,1,sysdate,55.67,'1',to_date('2013-09-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','09',89765,90567,0,1,sysdate,112.54,'1',to_date('2013-10-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','10',90567,93932,0,1,sysdate,76.21,'1',to_date('2013-11-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','11',93932,95076,0,1,sysdate,76.25,'1',to_date('2013-12-14','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,2,1,3,'2012','12',95076,99324,0,1,sysdate,44.51,'1',to_date('2014-01-14','yyyy-MM-dd'),2 );

insert into t_account values( seq_account.nextval,100,1,3,'2012','12',95076,99324,0,1,sysdate,44.51,'1',to_date('2014-01-01','yyyy-MM-dd'),2 );
insert into t_account values( seq_account.nextval,101,1,3,'2012','12',95076,99324,0,1,sysdate,44.51,'1',to_date('2015-01-01','yyyy-MM-dd'),2 );

select * from t_account;


update t_account set usenum=num1-num0;
update t_account set money=usenum*2.45;
commit;


--���
select sum(money) from t_account;

--ƽ����
select avg(money) from t_account;

--���
select max(money) from t_account;

--��С
select min(money) from t_account;

--�ܼ�¼
select count(*) from t_account;

--����ۺ�
select areaid,count(*) from T_ADDRESS  group by areaid;

--ʹ��rownum���з�ҳ��ѯ
select * from (select rownum r,ac.* from t_account ac where rownum<=5) where r>3;

--��ѯ���ݿ�ı����ʽ
select * from nls_database_parameters where parameter ='NLS_CHARACTERSET';

--oracle�ͻ��˱���
select * from nls_instance_parameters where parameter='NLS_LANGUAGE';

select userenv('language') from dual;
select trunc(sysdate,'dd')-24*365 from dual;

select to_char(sysdate,'yyyy')||'��'||to_char(sysdate,'mm')||'��'||to_char(sysdate,'dd')||'��' from dual;


select ���,count(��),��Ա from emp where ����id=����id group by ���
select �·�,count(��),��Ա from emp where ����id=����id group by ����ID



select * from myuser
insert into myuser values(2,3)
update myuser set age=4 where id=2
delete from myuser where id=2
--����
create table index_test(id number,name varchar2(64));
--����һ���洢����PL/SQL���
--ѭ��
begin
  --forѭ������
  for i in 1..10000000
    --ѭ��
    loop
      insert into index_test values(i,'AAA'||i);
      --����ѭ��
    end loop;
    --��ɾ�Ķ�Ҫ�ύ
    commit;
end;
--����Ψһ����
create unique index index_index_test on index_test(name)

select * from index_test where id=8000000

select * from index_test where name='AAA8000000'

--PL/SQL����
declare
 --��ֵ()ʹ��   :=  ��Ͻ��и�ֵ(Ҳ����ֱ�ӽ��и�ֵ)
 v_price number(10,2):=1.12;
 --t_account.id%type(����ĳ�����е�ĳ���ֶε�����)����Ƕ�̬��������
 v_num t_account.id%type;
 v_ton number(10,2);
 v_money number(10,2);
begin
  v_price:=2.14;
  v_num:=9889;
  v_ton:=round(v_num/1000,2);
  v_money:=round(v_price*v_ton,2);
  --��ӡ�������ӡ��output����̨��
  dbms_output.put_line('�շѽ�'||v_money);
end;

create table num_test(num1 number,num2 number);

insert into num_test values(5,3);

declare
 v_num number:=3;
 --��¼�Ͳ��������ص���һ�ű��ĳһ�����ݣ�
 v_num_test num_test%rowtype;
begin
  --select count(*) into v_num from t_account;
  
  --select num1-num2 into v_num from num_test;
  --  select * into v_num_test from num_test where num1=1;
  select * into v_num_test from num_test where num1=5;
  dbms_output.put_line('v_num='||v_num_test.num2);
  --�����쳣
  exception when no_data_found
    then dbms_output.put_line('û���ҵ���һ��');
end;

--�Զ����쳣
declare
  a number:=0;
  b number:=1;
  e  exception;
begin
  if  true then
    raise e;
  end if;
  exception when e then
     dbms_output.put_line('�﷨����~~');
end;

--�������
declare
  v_num number:=40;
begin
  if v_num<=30
    then dbms_output.put_line('���ϸ�');
  elsif v_num<=60
    then dbms_output.put_line('�ϸ�');
  else
    dbms_output.put_line('����');
  end if;
end;

--�α�
declare 
  --�����α�
  cursor demo1 is select * from myuser;
  v_user myuser%rowtype;
begin
        --���α�
  open demo1;
  --��ʼloopѭ��
  loop
    --�Ѳ�ѯ���Ľ���ŵ�����
    fetch demo1 into v_user;
    --���Ҳ�����һ��ʱ����
    exit when demo1%notfound;
    dbms_output.put('��һ����'||v_user.id);
    dbms_output.put_line('�ڶ�����'||v_user.age);
    --����loopѭ��
  end loop;
  --�ر��α�
  close demo1;
end;
select * from myuser;
insert into myuser values(2,23)
--�����α�
declare 
   --�����α����ֻ�ܸ����Ͳ������ó���
  cursor demo2(id number) is select * from myuser where id=id;
begin
  for v_user in demo2(2)
  loop
    dbms_output.put('��һ����'||v_user.id);
    dbms_output.put_line('�ڶ�����'||v_user.age);
  end loop;
end;




--�����洢����
/*
create [or replace] ����(����  ����) return �������
is
���� ����ֵ����( ���� ����)
begin
  sql���
  return ���;
  [exception�쳣������]
 end;
*/

create or replace function fn_demo1(id number) return number
is
v_user number;
begin
  select age into v_user from myuser where id=id;
  return v_user;
end;


--���ô洢����
select fn_demo1(2) from dual;

create table myuser(id number,age number,name varchar2(32));

--�����洢����
/*
create [or replace] procedure ����(���� [in|out|in out] ����,...)
is|as
begin
  �߼�  sql���
end;
in  ������� Ĭ��ȱʡ
out �������������ڷ��ؽ��     
in out���봫������
*/

create procedure pro_demo1(id number,age number,name varchar2)
is
begin
  insert into myuser values(id,age,name);
  commit;
end;

select * from myuser
--���ô洢����
call pro_demo1(1,2,'¬�ٻ�');
begin
  pro_demo1(2,3,'asd');
end;
create sequence seq_myuser start with 10;
--��������
create or replace procedure pro_demo2(v_id out number,age number,name varchar2)
is
begin
  select seq_myuser.nextval into v_id from dual;
  insert into myuser values(v_id,age,name);
  commit;
end;
--����
declare 
  v_id number;
begin
  pro_demo2(v_id,6,'asdasd');
 dbms_output.put_line(v_id);
end;

--������
/*
create [or replce] trigger ����
before|after
[insert|delete|update] of �� on ��
for each row [when ����]
declare   ....
begin
  PL/SQL��
end;

       |     :old               |            :new
������������������������������������������������������������������������������������������������������������
insert |  �����ֶζ��ǿ�        |      ��Ҫ������ֶ�
delete |  ɾ����ǰ���ֶε�ֵ    |      ���º��ֵ
update |  ������ǰ���е�ֵ      |      �����ֶζ��ǿ�  
*/

--ǰ�ô�����
create or replace trigger tri_demo1
before
update of age on myuser
for each row
declare 
begin
  :new.id:=:old.id+10;
end; 


--���ô�����
create trigger myuser_log
after
update of age on myuser
for each row
  declare
  begin
    insert into update_log values(sysdate,:old.id,:new.id);
  end;

create table update_log(updatetime date,usid number,oid number);

update myuser set age=12 where id=11;

select*from update_log;



