
create table USERINFO
(
  U_ID  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  UNAME VARCHAR2(20) not null,
  UPWD  VARCHAR2(20),
  PRIMARY KEY (U_ID)
)

insert into USERINFO (U_ID, UNAME, UPWD)
values (null, 'admin', 'admin');
commit;

create table TOPIC
(
  TID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  TNAME NVARCHAR2(100) not null,
  PRIMARY KEY (TID)
)
;

insert into TOPIC (TID, TNAME)
values (null, '�Ƽ�');
insert into TOPIC (TID, TNAME)
values (null, '����');
insert into TOPIC (TID, TNAME)
values (null, '����');
insert into TOPIC (TID, TNAME)
values (null, '����');
insert into TOPIC (TID, TNAME)
values (null, '����');
insert into TOPIC (TID, TNAME)
values (null, '����');
insert into TOPIC (TID, TNAME)
values (null, '����');
insert into TOPIC (TID, TNAME)
values (null, '��ѧ');
commit;

create table NEWS
(
  NID         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  NTID        NUMBER not null,
  NTITLE      VARCHAR2(500) not null,
  NAUTHOR     CHAR(50) not null,
  NCREATEDATE CHAR(50),
  NPICPATH    VARCHAR2(255),
  NCONTENT    VARCHAR2(4000),
  NMODIFYDATE CHAR(50),
  NSUMMARY    VARCHAR2(4000) not null,
  PRIMARY KEY (NID)
)
;

insert into NEWS (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values (null, 4, '����-aaaaa', '��Ѷ����', '2016-03-01', null, '���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���aaaaaaa����������������������������', '2016-03-02', '���Բ��Բ���');
insert into NEWS (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values (null, 4, '2015̨������չ����ǰհ', '��������', '2015-6-2', null, '̨������չ��ȫ��PCҵ������չ��֮һ���ڹ�ģ�Ͻ����ڵ¹���CeBITչ�������COMPUTEX 2015����6��2��-6��6�վ��У���ʱӢ�ض���΢��AMD��Ӣΰ���PC����Ӳ�����̾���Я�Լ����²�Ʒ���ࡣС������ѵ���̨����δ�����콫Ϊ��Ҵ�����һ�ֵı�����̨������չ��ȫ��PCҵ������չ��֮һ���ڹ�ģ�Ͻ����ڵ¹���CeBITչ�������COMPUTEX 2015����6��2��-6��6�վ��У���ʱӢ�ض���΢��AMD��Ӣΰ���PC����Ӳ�����̾���Я�Լ����²�Ʒ���ࡣС������ѵ���̨����δ�����콫Ϊ��Ҵ�����һ�ֵı�����̨������չ��ȫ��PCҵ������չ��֮һ���ڹ�ģ�Ͻ����ڵ¹���CeBITչ�������COMPUTEX 2015����6��2��-6��6�վ��У���ʱӢ�ض���΢��AMD��Ӣΰ���PC����Ӳ�����̾���Я�Լ����²�Ʒ���ࡣС������ѵ���̨����δ�����콫Ϊ��Ҵ�����һ�ֵı�����', 'Tue Jun 02 01:10:43 CST 2015', '̨������չ��ȫ��PCҵ������չ��֮һ���ڹ�ģ�Ͻ����ڵ¹���CeBITչ�������COMPUTEX 2015����6��2��-6��6�վ��У���ʱӢ�ض���΢��AMD��Ӣΰ���PC����Ӳ�����̾���Я�Լ����²�Ʒ���ࡣС������ѵ���̨����δ�����콫Ϊ��Ҵ�����һ�ֵı�����');
insert into NEWS (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values (null, 2, '"���ѧϰ"�о������ٴ����ǽ����˹�����ʱ��', '����', '2015-6-2', null, '��ΪFacebook AI �о�����ͷ�ˣ�LeCun����������ʶ��ͼƬ���ճ��������Ե��Ӵ������硱��������Ĺ����������ڹȸ谲׿�ֻ��Ͻ�������ʶ����΢��Skype���ṩ��ʱ���룬����������ͨ��������ѧϰ��ʵ������๦�ܡ�������һ�����ڶദ������ɵ�������ģ����������ڲ�������ʽ����Щ�����������������ĳЩ���泬����������ԡ������ڿ�ѧ����־����Ȼ���ϣ�ŦԼ��ѧ���������LeCun������λѧ�߹�ͬ�������£���ϸ�����ˡ����ѧϰ������Ŀǰ�ķ�չ״����������ϸ�����˽������㷺Ӧ�õ����ѧϰ��������������������������������㷺�Ļ��������������¶�������������Լ��ڽ���������������Ӱ�����ǵ����', 'Tue Jun 02 00:51:40 CST 2015', '��ΪFacebook AI �о�����ͷ�ˣ�LeCun����������ʶ��ͼƬ���ճ��������Ե��Ӵ������硱��');
commit;

create table COMMENTINFO
(
  CID      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  CNID     NUMBER not null,
  CCONTENT VARCHAR2(4000),
  CDATE    DATE,
  CIP      VARCHAR2(15),
  CAUTHOR  VARCHAR2(50),
  PRIMARY KEY (CID)
)
;
