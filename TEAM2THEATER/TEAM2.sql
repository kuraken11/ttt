SELECT * FROM MEMBER;
SELECT * FROM MOVIE;
SELECT * FROM THEATER;
SELECT * FROM RESERVATION;
SELECT * FROM COMMENTS;
SELECT * FROM COMMENTLIKE;
SELECT * FROM MOVIEPOST;
SELECT * FROM MOVIELIKE;


--��ȭ ����
CREATE TABLE MOVIE(
MV_NAME         NVARCHAR2(20)   PRIMARY KEY, --��ȭ �̸�
MV_HEAD         NVARCHAR2(50) NOT NULL, --���ϰ� ǥ��Ǵ� �Ұ���
MV_CONTENT      NVARCHAR2(500)  NOT NULL,   --������ �Ұ���
MV_DIRECTOR     NVARCHAR2(20)   NOT NULL,   --����
MV_ACTOR        NVARCHAR2(100)   NOT NULL,   --���
MV_TYPE     NVARCHAR2(100)   NOT NULL,   --2D,3D,4D
MV_GENRE        NVARCHAR2(100)   NOT NULL,   --�θǽ�, ����, �߸�, ��ȭ �帣
MV_REVIEW       NVARCHAR2(500)   NOT NULL,   -- ��ȭ ������ ������������ �ּ�
MV_AGE      NVARCHAR2(20)   NOT NULL,   -- ��ȭ���, ���ɺ�
MV_RES      NUMBER   NOT NULL,    -- ������
MV_AUD      NUMBER   NOT NULL,  --���� ���� ������, ������ ������ �߰�
MV_TIME     NUMBER   NOT NULL,  --���� �� �ð�
MV_POINT    NUMBER     NOT NULL,    --��ȭ ���� ȸ������ ����
MV_OPENDAY      DATE   NOT NULL,    --��ȭ ���� ����
MV_LIKE     NUMBER,                 -- ȸ������ ���ƿ� ��
MV_NOTICE   NUMBER     NOT NULL,     -- �ڽ����ǽ�: 1/ �󿵿�����: 0
MV_POSTERNAME   NVARCHAR2(50) NOT NULL   -- ��ȭ ������ ���� �̸�
);
--ȸ�� ����
create table MEMBER(
    MEMID NVARCHAR2(20) PRIMARY KEY, -- ȸ�� ���̵�
    MEMPW       NVARCHAR2(100) not null,        -- ȸ�� ��й�ȣ
    MEMNAME     NVARCHAR2(20) not null,     -- ȸ�� �̸�
    MEMBIRTH       DATE not null,       -- ȸ�� �������
    MEMPHONE    NVARCHAR2(11)   not null,       -- ȸ�� ����ó
    MEMEMAIL    NVARCHAR2(30)   not null,       -- ȸ�� �̸���
    MEMTHEATER1 NVARCHAR2(20),      -- ȸ�� ��ȣ�ϴ� ��ȭ��1
    MEMTHEATER2 NVARCHAR2(20)       -- ȸ�� ��ȣ�ϴ� ��ȭ��2
);
--�� ����
CREATE TABLE THEATER(
THE_CODE NVARCHAR2(30) PRIMARY KEY,  -- �������� ���� �ڵ�
THE_TYPE    NVARCHAR2(20) NOT NULL, -- ��ȭ Ÿ��
THE_LOC2    NVARCHAR2(20) NOT NULL, -- ���� ������ ���� ���� ��ȭ��
THE_THEATER NVARCHAR2(20) NOT NULL, -- ��ȭ �󿵰�
THE_NAME    NVARCHAR2(20) NOT NULL, -- ��ȭ �̸�
THE_SEET    NUMBER NOT NULL,        -- ���� �¼� = �� �¼� - ������
THE_DAY     NVARCHAR2(20) NOT NULL, -- ���� ����
THE_START   NVARCHAR2(50) NOT NULL, -- ���� ���� �ð�
THE_END     NVARCHAR2(50) NOT NULL, -- ���� ������ �ð�
THE_ALLSEET NUMBER NOT NULL,        -- �󿵰� ��ü �¼�
THE_AGE     NVARCHAR2(20),          -- ������
THE_POSTERNAME NVARCHAR2(50)        -- ��ȭ ������ �̸�
);
--������ ���
CREATE TABLE RESERVATION(
RES_SEQ     NUMBER PRIMARY KEY,    -- ���� ���̺� ������
RES_ID      NVARCHAR2(20) NOT NULL,     -- ������ ȸ�� ���̵�
RES_MVNAME  NVARCHAR2(20) NOT NULL,     -- ������ ��ȭ �̸�
RES_TYPE    NVARCHAR2(2) NOT NULL,      -- ������ ��ȭ Ÿ��
RES_SEET    NVARCHAR2(20) NOT NULL,       -- ������ �¼�
RES_DAY    NVARCHAR2(20) NOT NULL,     -- ���� ����
RES_THEATER    NVARCHAR2(20) NOT NULL,     -- �󿵰�
RES_LOC2    NVARCHAR2(20) NOT NULL,     -- ���� ����
RES_START   NVARCHAR2(20) NOT NULL,     -- ���� ���� �ð�
RES_END     NVARCHAR2(20) NOT NULL,    --������ ������ �ð�
RES_PERSON  NUMBER,        -- ��ü �ο� ��
RES_ADULT  NUMBER,        -- ���� ��
RES_YOUTH  NUMBER,        -- û�ҳ� ��
RES_CHILD  NUMBER,        -- ��� ��
RES_PRICE   NUMBER     --���� �ݾ�
);
--RES_SEQ
CREATE SEQUENCE RES_SEQ INCREMENT BY 1 START WITH 1;

--������ ���
CREATE TABLE COMMENTS(
CMT_ID     NVARCHAR2(20),   -- �ڸ�Ʈ �� ȸ�� ���̵�
CMT_COMMENT NVARCHAR2(500) NOT NULL,     -- ������
CMT_MVNAME  NVARCHAR2(20) NOT NULL,     -- �ڸ�Ʈ �� ��ȭ �̸�
CMT_LIKE    NUMBER NOT NULL,        -- �ۼ��� �� ȸ���� �̿��� �� �ִ� ���ƿ�
CMT_POINT   NUMBER NOT NULL,     -- ��ȭ ���� (1~5)
CMT_TIME    DATE NOT NULL       -- ��� �ۼ� �ð�(SYSDATE)
);

--��������Ʈ
CREATE TABLE MOVIEPOST(
MP_SEQ  NUMBER PRIMARY KEY,     -- ������, ������ ��ȣ(������ �ۼ� ����)
MP_ID           NVARCHAR2(20) NOT NULL, -- ȸ�� ���̵�
MP_POSTERNAME    NVARCHAR2(50),     -- �ۼ��� ������ ���� �̸�
MP_CONTENT   NVARCHAR2(500) NOT NULL,   -- �ۼ��� ��
MP_MVNAME    NVARCHAR2(20) NOT NULL,    --��ȭ ����
MP_LIKE NUMBER,       -- �����Ϳ� ���� �ٸ� ȸ���� ���ƿ�
MP_TIME    DATE NOT NULL,    -- �ۼ� �ð� (SYSDATE)
MP_TITLE NVARCHAR2(50)
);

--MP_SEQ
CREATE SEQUENCE MP_SEQ INCREMENT BY 1 START WITH 1;

CREATE TABLE MOVIELIKE(
--��ȭ����
ML_MOVIE NVARCHAR2(50),
--���ƿ� ���� ���̵�
ML_ID NVARCHAR2(20)
);
-- ��� ���ƿ� ���� ���̵�
CREATE TABLE COMMENTLIKE(
-- ��� �� ���̵�
CL_CmtId    NVARCHAR2(20),
--��ȭ�� �� ��� ��ȭ����
CL_MOVIE NVARCHAR2(50),
--���ƿ� ���� ���̵�
CL_ID NVARCHAR2(20)
);
COMMIT;
insert into THEATER values('�ƹ�Ÿ1','3D','����','1��','�ƹ�Ÿ:���Ǳ�','100','2022-12-19','21:00','24:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ2','2D','����','1��','�ƹ�Ÿ:���Ǳ�','100','2022-12-20','12:00','15:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ3','3D','����','2��','�ƹ�Ÿ:���Ǳ�','100','2022-12-20','15:30','18:30','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ4','2D','����','2��','�ƹ�Ÿ:���Ǳ�','100','2022-12-20','19:00','22:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ5','2D','����','1��','�ƹ�Ÿ:���Ǳ�','100','2022-12-21','12:00','15:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ6','3D','����','2��','�ƹ�Ÿ:���Ǳ�','100','2022-12-21','15:30','18:30','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ7','2D','����','2��','�ƹ�Ÿ:���Ǳ�','100','2022-12-21','19:00','22:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ8','3D','���빮','4��','�ƹ�Ÿ:���Ǳ�','100','2022-12-22','12:00','15:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ9','2D','���빮','2��','�ƹ�Ÿ:���Ǳ�','100','2022-12-22','15:30','18:30','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ10','3D','���빮','3��','�ƹ�Ÿ:���Ǳ�','100','2022-12-22','19:00','22:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ11','2D','��','1��','�ƹ�Ÿ:���Ǳ�','100','2022-12-23','12:00','15:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ12','2D','��','2��','�ƹ�Ÿ:���Ǳ�','100','2022-12-23','15:30','18:30','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');
insert into THEATER values('�ƹ�Ÿ13','3D','��','3��','�ƹ�Ÿ:���Ǳ�','100','2022-12-23','19:00','22:00','100','12���̻�','�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');

INSERT INTO MOVIE VALUES('�ƹ�Ÿ:���Ǳ�','<�ƹ�Ÿ: ���� ��>�� �ǵ��� �༺����','"����ũ ����"�� "����Ƽ��"�� �̷� ������ �ް� �Ǵ� ���ں��� ������
��Ƴ��� ���� ������ �ϴ� �� ������ ����,
�׸��� �ߵ����� �� ��ó�� ���� �̾߱⸦ �׷ȴ�.','���ӽ� ī�޷�','�� ���ٳ�, �� ������, �ð�� ����',
'2D ATMOS(�ڸ�), 2D(�ڸ�), 3D ATMOS(�ڸ�), 3D Dolby(�ڸ�), 3D(�ڸ�)','SF, ������, �׼�, ��庥ó',
'https://www.youtube.com/watch?v=kihrFxwdMb4','12���̻�',80,2681411,192,4.9,TO_DATE('2022/12/14','YYYY/MM/DD'),
0,1,'�ƹ�Ÿ ���Ǳ�_����������_NONIMAX.jpg');

INSERT INTO MOVIE VALUES('�û���' , '���������� �پ ħ�� �Ƿ��� ���� ���������' , '���� �����Ϳ��� �� ���ָ� �����޾� ������ ����. �� ����, û�� ������ �������� ���������ڡ��� 8�� ���� �ͱ��ϰ�, ������ �Ƶ��� ���� �ݰ��� ��� ��ü �� �ҾȰ��� �۽��δ�. �׷��� ��� ��, ��� �ӿ����� ����ϰ� �� �� �ִ� ��������� ���������� ������ ����ϰ� �ǰ� ������ �˸����� ���� �� ū ��а� ���� �巯���� ������� ���·ο� ��Ȳ�� ������.',
'������ ' , '���ؿ�, ������, �ֹ���, ������, �ڸ���, �輺ö, ������, ������' , '2D' , '������' , 'https://youtu.be/n1pgWks2TVI' , '15���̻�' , 2 ,1976109 , 128 , 9 , '20221123' , 1 , 1 ,'�û���_2�� ������_����.jpg');

INSERT INTO MOVIE VALUES('���迡�� �� ����� ������� �ص�','ī�̾� ��翡 ���� ���� �� ' ,'�ڰ� �Ͼ�� ������ ����� �Ҵ� ���༺ ��������� �ɸ� �ҳ� ������ ������ �������� ���� ��̰� ���� �ž� �������Ե� ������ �ʴ� ���������� ����� �ҳ� ��� ���� �� ����� ������� ����, �׷����� �ұ��ϰ�, ���� �� ���θ� ���� ��ƶ�� ����� �ݺ��ϴ� �� �ҳ�, �ҳ��� ���� ���� û���',
'��Ű Ÿī���� ' , '��ġ���� ������, ������� ����, �ķ�ī�� �����, �������� ȣ��ī' , '2D' , '�θǽ�' , 'https://youtu.be/dKWbgcKkn20' , '12���̻�' , 3 , 83179 , 131 , 8.8 , '20221130' ,1 , 1 ,'���ù�_.jpg');

INSERT INTO MOVIE VALUES('���ǽ� �ʸ� ����','���� ��Ҹ� �ϳ��� �� ���踦 ������� ��� ����Ÿ��.' ,'�׳డ ����� �巯���� ù ���̺� �ܼ�Ʈ�� ������ �� ���������ơ����� ������ �����ǡ��� �̲��� ��¤���� �����ܰ� �Բ� ������ ����Ÿ�� �ҵ�� �������� ���� ����. �׸��� �� �ܼ�Ʈ�� �ѷ��� ������� �ر����� ������ �������� ���۵Ǵµ��� ',
'Ÿ�ϱ�ġ ���' , ' ' , '2D ATMOS(�ڸ�)' , '�ִϸ��̼� ' , 'https://youtu.be/d59iRSlkeaY' , '12���̻�' , 4 , 132621 , 115 , 8.3 , '20221130' ,1 , 1 ,'���ǽ�_.jpg');

INSERT INTO MOVIE VALUES('�ź����Ʈ ����������� 7���Ǽ���' ,'������! ������ ��!','��ȭ�Ӵ� 7���� ���� ���谡 ���ο� �Ǵ� ��������� �������� ���迡 ó�ߴ�. ���������� ��Ű�񡯴� ���� ������ ������ �Ž����� ��������� ���� ���� ���ϸ����� ���ź񡯿��� ������ ��û�Ѵ�',
'������  ' , '�迵��(�ϸ�), ��ä��(�θ�), �ſ��(����), ������(�ź�), ����ȭ(�ݺ�), ������(Ű��)' , '2D ' , '�ִϸ��̼�  ' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/18/be5d80bf22f28c0d312c2c24b2629ced_W.mp4' , '��ü' , 14, 1023, 103 ,1.2 , '20221214' ,0 , 0 ,'�ź����Ʈ_.jpg');

INSERT INTO MOVIE VALUES('�� �� �� ����' ,'1915�� 12�� 19��, �������� �� ��ΰ����� �¾ ���� ���� ����Ʈ �Ǿ���.','�ҿ��� ��ŭ ó���ߴ� ���� ����� ���� �뷡, �ϳ��� �ߵ� �׳��� ��ȭ���� ��Ժ� �λ��� ���� ������ ���������� ��Ƴ� ����� ����.',
'�ø��� ����' , '������ ����Ƹ�, �� �ǿ��� ��ƾ', '2D ' , '���' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/15/8a47d85002379904c1a12c2a880c905b_W.mp4' , '12���̻�' , 0, 111300, 140 , 0 , '20221214' ,0 , 0 ,'���� ����_.jpg');

INSERT INTO MOVIE VALUES('����' ,'������ �Բ� ��ġ�� �ݶ��� �۽��� �ε��׽þ� �ڹ��� �� ������ ����.','����(���� �츶)�� �����̸� �Ȱ� Ȳ���� ������ ����ģ��. ������ ���� �� ���Ҹ� �ǰ� �ƹ����� ����뿡�� ������ ���ߴ�. ���� ���� ���� �����ֿ� ��ȥ�� ������ ������ �̷�� �ȶ��� ���� �������� ������ ��ó�� �㸶�� �޿� ��Ÿ���� �����Լ��� �ٸ� ������ ������ ��������.',
' ' , ' ', '2D(�ڸ�)' , '���' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/15/ce56d68836891e8a39a1edb15d2ecf5d_W.mp4' , '15���̻� ' , 0, 0 , 103 , 0 , '20221215' ,0 , 0 ,'����_.jpg');

INSERT INTO MOVIE VALUES('���� by SIA' ,'�ҸӴ��� ���۽����� ���� ��, ���� �������κ��� ����� ���� �������ϴ� ��� �ִ� ��','�� ȯ�� �̺����� ������ ��ȸ�Ѵ�. ���� �ް� ������ 2���� ��ħ�� �����ϰ�, ������ ��Ʈ�� ���� �غ��� �� ��å�� ������ �� ������ ������ ���� ����. ��¿ ������ ���� ������ ��ȣ�ڰ� �� �ִ� ������ ������ ���� �̿� ������ �����κ��� ���� ������ ������, �������� ����� �� ���� ����.',
' ' , '����Ʈ ��彼, ������ ���� �ִϾ�', '2D(�ڸ�)' , '���, ������' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/24/132f7c66bf3e9d60014e072b9d165c08_W.mp4' , '15���̻�' , 0, 126, 107 , 0 , '20221215' ,0 , 0 ,'����BY_.jpg');


commit;