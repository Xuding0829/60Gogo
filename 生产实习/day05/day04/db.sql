#������
create database emp charset=utf8;
#�����
use emp;
#������Ա��
create table t_emp(
 id int primary key auto_increment,
 name varchar(25),
 salary decimal(10,2),
 job  varchar(25)
);
#�������
INSERT INTO t_emp VALUES(null,'tom',31000,'manager');
  alter table t_emp add pwd varchar(25);
  update t_emp set pwd='123'