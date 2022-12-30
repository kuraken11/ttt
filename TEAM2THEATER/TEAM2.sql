SELECT * FROM MEMBER;
SELECT * FROM MOVIE;
SELECT * FROM THEATER;
SELECT * FROM RESERVATION;
SELECT * FROM COMMENTS;
SELECT * FROM COMMENTLIKE;
SELECT * FROM MOVIEPOST;
SELECT * FROM MOVIELIKE;


--영화 정보
CREATE TABLE MOVIE(
MV_NAME         NVARCHAR2(20)   PRIMARY KEY, --영화 이름
MV_HEAD         NVARCHAR2(50) NOT NULL, --진하게 표기되는 소개글
MV_CONTENT      NVARCHAR2(500)  NOT NULL,   --나머지 소개글
MV_DIRECTOR     NVARCHAR2(20)   NOT NULL,   --감독
MV_ACTOR        NVARCHAR2(100)   NOT NULL,   --배우
MV_TYPE     NVARCHAR2(100)   NOT NULL,   --2D,3D,4D
MV_GENRE        NVARCHAR2(100)   NOT NULL,   --로맨스, 공포, 추리, 만화 장르
MV_REVIEW       NVARCHAR2(500)   NOT NULL,   -- 영화 예고편 아이프레임의 주소
MV_AGE      NVARCHAR2(20)   NOT NULL,   -- 영화등급, 연령별
MV_RES      NUMBER   NOT NULL,    -- 예매율
MV_AUD      NUMBER   NOT NULL,  --실제 누적 관객수, 예매할 때마다 추가
MV_TIME     NUMBER   NOT NULL,  --실제 상영 시간
MV_POINT    NUMBER     NOT NULL,    --영화 평점 회원들의 평점
MV_OPENDAY      DATE   NOT NULL,    --영화 개봉 일자
MV_LIKE     NUMBER,                 -- 회원들의 좋아요 수
MV_NOTICE   NUMBER     NOT NULL,     -- 박스오피스: 1/ 상영예정작: 0
MV_POSTERNAME   NVARCHAR2(50) NOT NULL   -- 영화 포스터 파일 이름
);
--회원 정보
create table MEMBER(
    MEMID NVARCHAR2(20) PRIMARY KEY, -- 회원 아이디
    MEMPW       NVARCHAR2(100) not null,        -- 회원 비밀번호
    MEMNAME     NVARCHAR2(20) not null,     -- 회원 이름
    MEMBIRTH       DATE not null,       -- 회원 생년월일
    MEMPHONE    NVARCHAR2(11)   not null,       -- 회원 연락처
    MEMEMAIL    NVARCHAR2(30)   not null,       -- 회원 이메일
    MEMTHEATER1 NVARCHAR2(20),      -- 회원 선호하는 영화관1
    MEMTHEATER2 NVARCHAR2(20)       -- 회원 선호하는 영화관2
);
--상영 정보
CREATE TABLE THEATER(
THE_CODE NVARCHAR2(30) PRIMARY KEY,  -- 상영정보의 고유 코드
THE_TYPE    NVARCHAR2(20) NOT NULL, -- 영화 타입
THE_LOC2    NVARCHAR2(20) NOT NULL, -- 극장 지역에 속한 실제 영화관
THE_THEATER NVARCHAR2(20) NOT NULL, -- 영화 상영관
THE_NAME    NVARCHAR2(20) NOT NULL, -- 영화 이름
THE_SEET    NUMBER NOT NULL,        -- 여분 좌석 = 상영 좌석 - 예매자
THE_DAY     NVARCHAR2(20) NOT NULL, -- 관람 일자
THE_START   NVARCHAR2(50) NOT NULL, -- 관람 시작 시간
THE_END     NVARCHAR2(50) NOT NULL, -- 관람 끝나는 시간
THE_ALLSEET NUMBER NOT NULL,        -- 상영관 전체 좌석
THE_AGE     NVARCHAR2(20),          -- 관람가
THE_POSTERNAME NVARCHAR2(50)        -- 영화 포스터 이름
);
--예매자 목록
CREATE TABLE RESERVATION(
RES_SEQ     NUMBER PRIMARY KEY,    -- 예매 테이블 시퀀스
RES_ID      NVARCHAR2(20) NOT NULL,     -- 예매한 회원 아이디
RES_MVNAME  NVARCHAR2(20) NOT NULL,     -- 예매한 영화 이름
RES_TYPE    NVARCHAR2(2) NOT NULL,      -- 예매한 영화 타입
RES_SEET    NVARCHAR2(20) NOT NULL,       -- 예매한 좌석
RES_DAY    NVARCHAR2(20) NOT NULL,     -- 관람 일자
RES_THEATER    NVARCHAR2(20) NOT NULL,     -- 상영관
RES_LOC2    NVARCHAR2(20) NOT NULL,     -- 극장 지역
RES_START   NVARCHAR2(20) NOT NULL,     -- 관람 시작 시간
RES_END     NVARCHAR2(20) NOT NULL,    --관람이 끝나는 시간
RES_PERSON  NUMBER,        -- 전체 인원 수
RES_ADULT  NUMBER,        -- 성인 수
RES_YOUTH  NUMBER,        -- 청소년 수
RES_CHILD  NUMBER,        -- 어린이 수
RES_PRICE   NUMBER     --결재 금액
);
--RES_SEQ
CREATE SEQUENCE RES_SEQ INCREMENT BY 1 START WITH 1;

--관람평 목록
CREATE TABLE COMMENTS(
CMT_ID     NVARCHAR2(20),   -- 코멘트 단 회원 아이디
CMT_COMMENT NVARCHAR2(500) NOT NULL,     -- 관람평
CMT_MVNAME  NVARCHAR2(20) NOT NULL,     -- 코멘트 단 영화 이름
CMT_LIKE    NUMBER NOT NULL,        -- 작성자 외 회원이 이용할 수 있는 좋아요
CMT_POINT   NUMBER NOT NULL,     -- 영화 평점 (1~5)
CMT_TIME    DATE NOT NULL       -- 댓글 작성 시간(SYSDATE)
);

--무비포스트
CREATE TABLE MOVIEPOST(
MP_SEQ  NUMBER PRIMARY KEY,     -- 시퀀스, 포스터 번호(여러개 작성 가능)
MP_ID           NVARCHAR2(20) NOT NULL, -- 회원 아이디
MP_POSTERNAME    NVARCHAR2(50),     -- 작성자 포스터 파일 이름
MP_CONTENT   NVARCHAR2(500) NOT NULL,   -- 작성자 글
MP_MVNAME    NVARCHAR2(20) NOT NULL,    --영화 제목
MP_LIKE NUMBER,       -- 포스터에 대한 다른 회원의 좋아요
MP_TIME    DATE NOT NULL,    -- 작성 시간 (SYSDATE)
MP_TITLE NVARCHAR2(50)
);

--MP_SEQ
CREATE SEQUENCE MP_SEQ INCREMENT BY 1 START WITH 1;

CREATE TABLE MOVIELIKE(
--영화제목
ML_MOVIE NVARCHAR2(50),
--좋아요 누른 아이디
ML_ID NVARCHAR2(20)
);
-- 댓글 좋아요 누른 아이디
CREATE TABLE COMMENTLIKE(
-- 댓글 단 아이디
CL_CmtId    NVARCHAR2(20),
--영화에 쓴 댓글 영화제목
CL_MOVIE NVARCHAR2(50),
--좋아요 누른 아이디
CL_ID NVARCHAR2(20)
);
COMMIT;
insert into THEATER values('아바타1','3D','강남','1관','아바타:물의길','100','2022-12-19','21:00','24:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타2','2D','강남','1관','아바타:물의길','100','2022-12-20','12:00','15:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타3','3D','강남','2관','아바타:물의길','100','2022-12-20','15:30','18:30','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타4','2D','강남','2관','아바타:물의길','100','2022-12-20','19:00','22:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타5','2D','강남','1관','아바타:물의길','100','2022-12-21','12:00','15:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타6','3D','강남','2관','아바타:물의길','100','2022-12-21','15:30','18:30','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타7','2D','강남','2관','아바타:물의길','100','2022-12-21','19:00','22:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타8','3D','동대문','4관','아바타:물의길','100','2022-12-22','12:00','15:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타9','2D','동대문','2관','아바타:물의길','100','2022-12-22','15:30','18:30','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타10','3D','동대문','3관','아바타:물의길','100','2022-12-22','19:00','22:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타11','2D','목동','1관','아바타:물의길','100','2022-12-23','12:00','15:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타12','2D','목동','2관','아바타:물의길','100','2022-12-23','15:30','18:30','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');
insert into THEATER values('아바타13','3D','목동','3관','아바타:물의길','100','2022-12-23','19:00','22:00','100','12세이상','아바타 물의길_메인포스터_NONIMAX.jpg');

INSERT INTO MOVIE VALUES('아바타:물의길','<아바타: 물의 길>은 판도라 행성에서','"제이크 설리"와 "네이티리"가 이룬 가족이 겪게 되는 무자비한 위협과
살아남기 위해 떠나야 하는 긴 여정과 전투,
그리고 견뎌내야 할 상처에 대한 이야기를 그렸다.','제임스 카메론','조 샐다나, 샘 워싱턴, 시고니 위버',
'2D ATMOS(자막), 2D(자막), 3D ATMOS(자막), 3D Dolby(자막), 3D(자막)','SF, 스릴러, 액션, 어드벤처',
'https://www.youtube.com/watch?v=kihrFxwdMb4','12세이상',80,2681411,192,4.9,TO_DATE('2022/12/14','YYYY/MM/DD'),
0,1,'아바타 물의길_메인포스터_NONIMAX.jpg');

INSERT INTO MOVIE VALUES('올빼미' , '맹인이지만 뛰어난 침술 실력을 지닌 ‘경수’는' , '어의 이형익에게 그 재주를 인정받아 궁으로 들어간다. 그 무렵, 청에 인질로 끌려갔던 ‘소현세자’가 8년 만에 귀국하고, 인조는 아들을 향한 반가움도 잠시 정체 모를 불안감에 휩싸인다. 그러던 어느 밤, 어둠 속에서는 희미하게 볼 수 있는 ‘경수’가 소현세자의 죽음을 목격하게 되고 진실을 알리려는 찰나 더 큰 비밀과 음모가 드러나며 목숨마저 위태로운 상황에 빠진다.',
'안태진 ' , '류준열, 유해진, 최무성, 조성하, 박명훈, 김성철, 안은진, 조윤서' , '2D' , '스릴러' , 'https://youtu.be/n1pgWks2TVI' , '15세이상' , 2 ,1976109 , 128 , 9 , '20221123' , 1 , 1 ,'올빼미_2차 포스터_절찬.jpg');

INSERT INTO MOVIE VALUES('세계에서 이 사랑이 사라진다 해도','카미야 토루에 대해 잊지 말 ' ,'자고 일어나면 전날의 기억을 잃는 선행성 기억상실증에 걸린 소녀 마오리 내일의 마오리도 내가 즐겁게 해줄 거야 누구에게도 기억되지 않는 무색무취의 평범한 소년 토루 매일 밤 사랑이 사라지는 세계, 그럼에도 불구하고, 다음 날 서로를 향한 애틋한 고백을 반복하는 두 소년, 소녀의 가장 슬픈 청춘담',
'미키 타카히로 ' , '미치에다 슌스케, 후쿠모토 리코, 후루카와 코토네, 마츠모토 호노카' , '2D' , '로맨스' , 'https://youtu.be/dKWbgcKkn20' , '12세이상' , 3 , 83179 , 131 , 8.8 , '20221130' ,1 , 1 ,'오늘밤_.jpg');

INSERT INTO MOVIE VALUES('원피스 필름 레드','오직 목소리 하나로 전 세계를 사로잡은 디바 ‘우타’.' ,'그녀가 모습을 드러내는 첫 라이브 콘서트가 음악의 섬 ‘엘레지아’에서 열리고 ‘루피’가 이끄는 밀짚모자 해적단과 함께 수많은 ‘우타’ 팬들로 공연장은 가득 찬다. 그리고 이 콘서트를 둘러싼 해적들과 해군들의 수상한 움직임이 시작되는데… ',
'타니구치 고로' , ' ' , '2D ATMOS(자막)' , '애니메이션 ' , 'https://youtu.be/d59iRSlkeaY' , '12세이상' , 4 , 132621 , 115 , 8.3 , '20221130' ,1 , 1 ,'원피스_.jpg');

INSERT INTO MOVIE VALUES('신비아파트 차원도깨비와 7개의세계' ,'열려라! 차원의 문!','평화롭던 7개의 평행 세계가 새로운 악당 ‘어나더’의 등장으로 위험에 처했다. 차원도깨비 ‘키비’는 평행 세계의 질서를 거스르는 ‘어나더’를 막기 위해 ‘하리’와 ‘신비’에게 도움을 요청한다',
'변영규  ' , '김영은(하리), 김채하(두리), 신용우(강림), 조현정(신비), 양정화(금비), 강새봄(키비)' , '2D ' , '애니메이션  ' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/18/be5d80bf22f28c0d312c2c24b2629ced_W.mp4' , '전체' , 14, 1023, 103 ,1.2 , '20221214' ,0 , 0 ,'신비아파트_.jpg');

INSERT INTO MOVIE VALUES('라 비 앙 로즈' ,'1915년 12월 19일, 프랑스의 한 빈민가에서 태어난 작은 참새 에디트 피아프.','불우한 만큼 처절했던 과거 기억을 오직 노래, 하나로 견딘 그녀의 개화부터 장밋빛 인생이 지는 마지막 순간까지를 담아낸 사랑의 찬가.',
'올리비에 다한' , '마리옹 꼬띠아르, 장 피에르 마틴', '2D ' , '드라마' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/15/8a47d85002379904c1a12c2a880c905b_W.mp4' , '12세이상' , 0, 111300, 140 , 0 , '20221214' ,0 , 0 ,'라비앙 로즈_.jpg');

INSERT INTO MOVIE VALUES('나나' ,'독립과 함께 정치적 격랑에 휩싸인 인도네시아 자바의 한 순다족 마을.','나나(해피 살마)가 젖먹이를 안고 황급히 숲속을 도망친다. 남편은 전쟁 중 행방불명 되고 아버지는 토벌대에게 죽임을 당했다. 이후 나이 많은 대지주와 재혼한 나나는 가정을 이루고 안락한 삶을 누리지만 과거의 상처는 밤마다 꿈에 나타나고 남편에게서는 다른 여자의 흔적이 느껴진다.',
' ' , ' ', '2D(자막)' , '드라마' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/15/ce56d68836891e8a39a1edb15d2ecf5d_W.mp4' , '15세이상 ' , 0, 0 , 103 , 0 , '20221215' ,0 , 0 ,'나나_.jpg');

INSERT INTO MOVIE VALUES('뮤직 by SIA' ,'할머니의 갑작스러운 죽음 후, 술과 마약으로부터 벗어나기 위해 고군분투하던 언니 주는 자','폐 환자 이복동생 뮤직과 재회한다. 매일 달걀 프라이 2개로 아침을 시작하고, 정해진 루트에 따라 준비한 후 산책을 나가는 등 일정한 패턴을 가진 뮤직. 어쩔 수없이 그의 유일한 보호자가 된 주는 뮤직을 돌보기 위해 이웃 에보와 조지로부터 많은 도움을 받지만, 아직까지 배워야 할 것이 많다.',
' ' , '케이트 허드슨, 레슬리 오덤 주니어', '2D(자막)' , '드라마, 뮤지컬' , 'https://s3550.smartucc.kr/encodeFile/3550/2022/11/24/132f7c66bf3e9d60014e072b9d165c08_W.mp4' , '15세이상' , 0, 126, 107 , 0 , '20221215' ,0 , 0 ,'뮤직BY_.jpg');


commit;