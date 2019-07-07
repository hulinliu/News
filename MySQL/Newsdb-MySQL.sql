
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
values (null, '科技');
insert into TOPIC (TID, TNAME)
values (null, '体育');
insert into TOPIC (TID, TNAME)
values (null, '娱乐');
insert into TOPIC (TID, TNAME)
values (null, '数码');
insert into TOPIC (TID, TNAME)
values (null, '旅游');
insert into TOPIC (TID, TNAME)
values (null, '房产');
insert into TOPIC (TID, TNAME)
values (null, '汽车');
insert into TOPIC (TID, TNAME)
values (null, '文学');
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
values (null, 4, '测试-aaaaa', '腾讯娱乐', '2016-03-01', null, '测试测试测试测试测试测试测试测试测试aaaaaaa啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2016-03-02', '测试测试测试');
insert into NEWS (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values (null, 4, '2015台北电脑展看点前瞻', '网易数码', '2015-6-2', null, '台北电脑展是全球PC业界最大的展会之一，在规模上仅次于德国的CeBIT展，今年的COMPUTEX 2015定于6月2日-6月6日举行，届时英特尔、微软、AMD、英伟达等PC届软硬件厂商均会携自家最新产品亮相。小编今天已到达台北，未来几天将为大家带来第一手的报道。台北电脑展是全球PC业界最大的展会之一，在规模上仅次于德国的CeBIT展，今年的COMPUTEX 2015定于6月2日-6月6日举行，届时英特尔、微软、AMD、英伟达等PC届软硬件厂商均会携自家最新产品亮相。小编今天已到达台北，未来几天将为大家带来第一手的报道。台北电脑展是全球PC业界最大的展会之一，在规模上仅次于德国的CeBIT展，今年的COMPUTEX 2015定于6月2日-6月6日举行，届时英特尔、微软、AMD、英伟达等PC届软硬件厂商均会携自家最新产品亮相。小编今天已到达台北，未来几天将为大家带来第一手的报道。', 'Tue Jun 02 01:10:43 CST 2015', '台北电脑展是全球PC业界最大的展会之一，在规模上仅次于德国的CeBIT展，今年的COMPUTEX 2015定于6月2日-6月6日举行，届时英特尔、微软、AMD、英伟达等PC届软硬件厂商均会携自家最新产品亮相。小编今天已到达台北，未来几天将为大家带来第一手的报道。');
insert into NEWS (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values (null, 2, '"深度学习"研究将加速带我们进入人工智能时代', '测试', '2015-6-2', null, '作为Facebook AI 研究的领头人，LeCun负责监管用于识别图片和日常人类语言的庞大“神经网络”。神经网络的工作还包括在谷歌安卓手机上进行语音识别，在微软Skype中提供即时翻译，它在网络上通过“自主学习”实现了诸多功能。他们用一个由众多处理器组成的网络来模拟人类大脑内部工作方式，这些神经网络的能力甚至在某些方面超过了人类大脑。本周在科学类杂志《自然》上，纽约大学计算机教授LeCun和另两位学者共同发表文章，详细描述了“深度学习”技术目前的发展状况。文章详细描述了近年来广泛应用的深度学习技术，向人们描述了这项技术如何在日益广泛的互联网领域内重新定义了网络服务，以及在将来它会怎样继续影响我们的生活。', 'Tue Jun 02 00:51:40 CST 2015', '作为Facebook AI 研究的领头人，LeCun负责监管用于识别图片和日常人类语言的庞大“神经网络”。');
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
