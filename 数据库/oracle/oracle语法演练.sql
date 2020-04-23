--创建表空间
create tablespace wateros
datafile 'C:\oracle\tablespaces\wateros.dbf'
size 30m
autoextend on next 5m;

--创建用户
create user water identified by water default tablespace wateros;

--权限
grant dba to water;

--创建业主类型表
--varchar2后面必须指定长度
create table t_ownertype(
id number primary key,
name varchar2(30)
);

--创建业主表
create table t_owners(
id number primary key,
name varchar2(30),
addressid number,
housenuber varchar2(30),
watermeter varchar2(30),
adddate date,
ownertypeid number
);

--添加字段
create table myuser(id number primary key);
alter table myuser add(name varchar2(30));

--修改字段类型
alter table myuser modify(name number);

--修改字段名
alter table myuser rename column name to age;

--删除字段
alter table myuser drop column name;
alter table myuser drop(name ,age);

--删除表
DROP TABLE MYUSER;

--添加主键约束
alter table myuser add primary key(id);

--添加外键约束
alter table myuser add foreign key(id) references myuser(id))

--非空约束
alter table myuser modify name not null;

--唯一约束
alter table myuser modify name unique;

--检查约束
alter table myuser modify name check(name is null)

--查询表
select * from t_ownertype;
select * from t_owners;

--往表里面添加数据 (对表进行增删该都需要提交commit)
insert into myuser values(1,1);
commit;

--修改表数据
update myuser set name=?,id=? where id=? and ? or ?

--删除表数据
delete from myuser where taojian

--比较delete和truncate实现数据删除的不同
--delete删除的数据可以rollback
--delete删除可能产生碎片，并且不释放空间
--truncate是先摧毁表结构，再重新新建表结构
truncate table myuser;
--sysdate系统时间
--对表进行修改的时候必须提交commit


--伪表  虚表  dual
--oracle
select 3+2 from dual;
--mysql
select 3+2;

drop table t_ownertype;
drop table t_owners;

--建立价格区间表
create  table t_pricetable
(
id number primary key,
price number(10,2),
ownertypeid number,
minnum number,
maxnum number
);


--业主类型
create table t_ownertype
(
id number primary key,
name varchar2(30)
);

--业主表
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



--区域表
create table t_area
(
id number,
name varchar2(30)
);

--收费员表
create table t_operator
(
id number,
name varchar2(30)
);


--地址表
create table t_address
(
id number primary key,
name varchar2(100),
areaid number,
operatorid number
);


--账务表--
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

--业主类型
insert into t_ownertype values(1,'居民');
insert into t_ownertype values(2,'行政事业单位');
insert into t_ownertype values(3,'商业');
select * from t_ownertype;

--地址信息--
insert into t_address values( 1,'明兴花园',1,1);
insert into t_address values( 2,'鑫源秋墅',1,1);
insert into t_address values( 3,'华龙苑南里小区',2,2);
insert into t_address values( 4,'河畔花园',2,2);
insert into t_address values( 5,'霍营',2,2);
insert into t_address values( 6,'回龙观东大街',3,2);
insert into t_address values( 7,'西二旗',3,2);
select * from t_address;

--业主信息
insert into t_owners values(1,'范冰',1,'1-1','30406',to_date('2015-04-12','yyyy-MM-dd'),1 );
insert into t_owners values(2,'王强',1,'1-2','30407',to_date('2015-02-14','yyyy-MM-dd'),1 );
insert into t_owners values(3,'马腾',1,'1-3','30408',to_date('2015-03-18','yyyy-MM-dd'),1 );
insert into t_owners values(4,'林小玲',2,'2-4','30409',to_date('2015-06-15','yyyy-MM-dd'),1);
insert into t_owners values(5,'刘华',2,'2-5','30410',to_date('2013-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(6,'刘东',2,'2-2','30411',to_date('2014-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(7,'周健',3,'2-5','30433',to_date('2016-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(8,'张哲',4,'2-2','30455',to_date('2016-09-11','yyyy-MM-dd'),1 );
insert into t_owners values(9,'昌平区中西医结合医院',5,'2-2','30422',to_date('2016-10-11','yyyy-MM-dd'),2 );
insert into t_owners values(10,'美廉美超市',5,'4-2','30423',to_date('2016-10-12','yyyy-MM-dd'),3 );
select * from t_owners;

--操作员
insert into t_operator values(1,'马小云');
insert into t_operator values(2,'李翠花');
select * from t_operator;


--地区--
insert into t_area values(1,'海淀');
insert into t_area values(2,'昌平');
insert into t_area values(3,'西城');
insert into t_area values(4,'东城');
insert into t_area values(5,'朝阳');
insert into t_area values(6,'玄武');
select * from t_area;


--价格表--

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


--账务表--
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


--求和
select sum(money) from t_account;

--平均数
select avg(money) from t_account;

--最大
select max(money) from t_account;

--最小
select min(money) from t_account;

--总记录
select count(*) from t_account;

--分组聚合
select areaid,count(*) from T_ADDRESS  group by areaid;

--使用rownum进行分页查询
select * from (select rownum r,ac.* from t_account ac where rownum<=5) where r>3;

--查询数据库的编码格式
select * from nls_database_parameters where parameter ='NLS_CHARACTERSET';

--oracle客户端编码
select * from nls_instance_parameters where parameter='NLS_LANGUAGE';

select userenv('language') from dual;
select trunc(sysdate,'dd')-24*365 from dual;

select to_char(sysdate,'yyyy')||'年'||to_char(sysdate,'mm')||'月'||to_char(sysdate,'dd')||'日' from dual;


select 年份,count(年),雇员 from emp where 区域id=区域id group by 年份
select 月份,count(月),雇员 from emp where 区域id=区域id group by 区域ID



select * from myuser
insert into myuser values(2,3)
update myuser set age=4 where id=2
delete from myuser where id=2
--索引
create table index_test(id number,name varchar2(64));
--创建一个存储过程PL/SQL语句
--循环
begin
  --for循环条件
  for i in 1..10000000
    --循环
    loop
      insert into index_test values(i,'AAA'||i);
      --结束循环
    end loop;
    --增删改都要提交
    commit;
end;
--创建唯一索引
create unique index index_index_test on index_test(name)

select * from index_test where id=8000000

select * from index_test where name='AAA8000000'

--PL/SQL测试
declare
 --赋值()使用   :=  组合进行赋值(也可以直接进行赋值)
 v_price number(10,2):=1.12;
 --t_account.id%type(引用某个表中的某个字段的类型)这就是动态定义类型
 v_num t_account.id%type;
 v_ton number(10,2);
 v_money number(10,2);
begin
  v_price:=2.14;
  v_num:=9889;
  v_ton:=round(v_num/1000,2);
  v_money:=round(v_price*v_ton,2);
  --打印输出（打印到output控制台）
  dbms_output.put_line('收费金额：'||v_money);
end;

create table num_test(num1 number,num2 number);

insert into num_test values(5,3);

declare
 v_num number:=3;
 --记录型参数（返回的是一张表的某一行数据）
 v_num_test num_test%rowtype;
begin
  --select count(*) into v_num from t_account;
  
  --select num1-num2 into v_num from num_test;
  --  select * into v_num_test from num_test where num1=1;
  select * into v_num_test from num_test where num1=5;
  dbms_output.put_line('v_num='||v_num_test.num2);
  --定义异常
  exception when no_data_found
    then dbms_output.put_line('没有找到这一行');
end;

--自定义异常
declare
  a number:=0;
  b number:=1;
  e  exception;
begin
  if  true then
    raise e;
  end if;
  exception when e then
     dbms_output.put_line('语法错误~~');
end;

--条件语句
declare
  v_num number:=40;
begin
  if v_num<=30
    then dbms_output.put_line('不合格');
  elsif v_num<=60
    then dbms_output.put_line('合格');
  else
    dbms_output.put_line('优秀');
  end if;
end;

--游标
declare 
  --声明游标
  cursor demo1 is select * from myuser;
  v_user myuser%rowtype;
begin
        --打开游标
  open demo1;
  --开始loop循环
  loop
    --把查询到的结果放到变量
    fetch demo1 into v_user;
    --当找不到下一个时结束
    exit when demo1%notfound;
    dbms_output.put('第一个：'||v_user.id);
    dbms_output.put_line('第二个：'||v_user.age);
    --结束loop循环
  end loop;
  --关闭游标
  close demo1;
end;
select * from myuser;
insert into myuser values(2,23)
--带参游标
declare 
   --带参游标参数只能给类型不能设置长度
  cursor demo2(id number) is select * from myuser where id=id;
begin
  for v_user in demo2(2)
  loop
    dbms_output.put('第一个：'||v_user.id);
    dbms_output.put_line('第二个：'||v_user.age);
  end loop;
end;




--创建存储函数
/*
create [or replace] 名称(参数  类型) return 结果类型
is
声明 接收值类型( 参数 类型)
begin
  sql语句
  return 结果;
  [exception异常处理部分]
 end;
*/

create or replace function fn_demo1(id number) return number
is
v_user number;
begin
  select age into v_user from myuser where id=id;
  return v_user;
end;


--调用存储函数
select fn_demo1(2) from dual;

create table myuser(id number,age number,name varchar2(32));

--创建存储过程
/*
create [or replace] procedure 名称(参数 [in|out|in out] 类型,...)
is|as
begin
  逻辑  sql语句
end;
in  传入参数 默认缺省
out 传出参数，用于返回结果     
in out传入传出参数
*/

create procedure pro_demo1(id number,age number,name varchar2)
is
begin
  insert into myuser values(id,age,name);
  commit;
end;

select * from myuser
--调用存储过程
call pro_demo1(1,2,'卢少华');
begin
  pro_demo1(2,3,'asd');
end;
create sequence seq_myuser start with 10;
--传出参数
create or replace procedure pro_demo2(v_id out number,age number,name varchar2)
is
begin
  select seq_myuser.nextval into v_id from dual;
  insert into myuser values(v_id,age,name);
  commit;
end;
--调用
declare 
  v_id number;
begin
  pro_demo2(v_id,6,'asdasd');
 dbms_output.put_line(v_id);
end;

--触发器
/*
create [or replce] trigger 名称
before|after
[insert|delete|update] of 列 on 表
for each row [when 条件]
declare   ....
begin
  PL/SQL块
end;

       |     :old               |            :new
——————————————————————————————————————————————————————
insert |  所有字段都是空        |      将要插入的字段
delete |  删除以前该字段的值    |      更新后的值
update |  更新以前该列的值      |      所有字段都是空  
*/

--前置触发器
create or replace trigger tri_demo1
before
update of age on myuser
for each row
declare 
begin
  :new.id:=:old.id+10;
end; 


--后置触发器
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



