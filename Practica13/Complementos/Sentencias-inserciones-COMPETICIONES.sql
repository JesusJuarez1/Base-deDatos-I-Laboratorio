CREATE TABLE REF_RANKING_CODES(
  RANKING_CODE NUMBER(2) CONSTRAINT REF_RAN_CO_PK PRIMARY KEY,
  RANKING_DESCRIPTION VARCHAR(50)
);

INSERT INTO REF_RANKING_CODES VALUES(1,'CLUB LEVEL');
INSERT INTO REF_RANKING_CODES VALUES(2,'GRANDMASTER');

CREATE TABLE CHESS_CLUBS(
  CLUB_ID NUMBER(5) CONSTRAINT CHESS_CLUB_PK PRIMARY KEY,
  CLUB_NAME VARCHAR(100),
  CLUB_ADRESS VARCHAR(100),
  OTHER_CLUB_DETAILS VARCHAR(100),
  ORGANIZER_ID NUMBER(4)
);

INSERT INTO CHESS_CLUBS VALUES(1,'CLUB 1','CIANA',NULL,1);
INSERT INTO CHESS_CLUBS VALUES(2,'CLUB 2','ALAMEDA',NULL,2);

CREATE TABLE LIST_OF_SPONSORS(
  SPONSOR_ID NUMBER(4) CONSTRAINT LI_OF_SPON_PK PRIMARY KEY,
  SPONSOR_NAME VARCHAR(50),
  SPONSOR_PHONE VARCHAR(20),
  OTHER_SPONSOR_DETAILS VARCHAR(100)
);

INSERT INTO LIST_OF_SPONSORS VALUES(1,'SPONSOR 1','4363527492',NULL);
INSERT INTO LIST_OF_SPONSORS VALUES(2,'SPONSOR 2','1742766328',NULL);
INSERT INTO LIST_OF_SPONSORS VALUES(3,'SPONSOR 3','6483635264',NULL);

CREATE TABLE TOURNAMENT_ORGANIZERS(
  ORGANIZER_ID NUMBER(8) CONSTRAINT TURNAMENT_ORGANIZER_PK PRIMARY KEY,
  CLUB_ID NUMBER(5) CONSTRAINT TUR_ORG_CLUB_NN NOT NULL,
  ORGANIZER_NAME VARCHAR(50),
  ORGANIZER_DETAILS VARCHAR(100),
  CONSTRAINT CH_CLUB_TUR_OR_FK FOREIGN KEY (CLUB_ID) REFERENCES CHESS_CLUBS(CLUB_ID)
);

INSERT INTO TOURNAMENT_ORGANIZERS VALUES(1,1,'ORGANIZER 1',NULL);
INSERT INTO TOURNAMENT_ORGANIZERS VALUES(2,2,'ORGANIZER 2',NULL);

CREATE TABLE TOURNAMENTS(
  TOURNAMENT_ID NUMBER(8) CONSTRAINT TOURNAMENT_PK PRIMARY KEY,
  ORGANIZER_ID NUMBER(8) CONSTRAINT TOU_ORG_NN NOT NULL,
  TOURNAMENT_START_DATE DATE,
  TOURNAMENT_END_DATE DATE,
  TOURNAMENT_NAME VARCHAR(50),
  TOURNAMENT_DETAILS VARCHAR(150),
  CONSTRAINT ORG_TOUR_TOUR_FK FOREIGN KEY (ORGANIZER_ID) REFERENCES TOURNAMENT_ORGANIZERS(ORGANIZER_ID)
);

INSERT INTO TOURNAMENTS VALUES(1,1,'15/01/14','15/02/14','TOURNAMENT 1',NULL);
INSERT INTO TOURNAMENTS VALUES(2,2,'16/01/15','16/02/15','TOURNAMENT 2',NULL);

CREATE TABLE ACTUAL_TOURNAMENT_SPONSORS(
  TOURNAMENT_ID NUMBER(8),
  SPONSOR_ID NUMBER(4),
  CONSTRAINT ACTUAL_TOURNAMENT_SPONSOR_PK PRIMARY KEY (TOURNAMENT_ID,SPONSOR_ID),
  CONSTRAINT TOUR_ACT_TOUR_SPO_FK FOREIGN KEY (TOURNAMENT_ID) REFERENCES TOURNAMENTS(TOURNAMENT_ID),
  CONSTRAINT LI_OF_SPO_ACT_TOUR_SPO_FK FOREIGN KEY (SPONSOR_ID) REFERENCES LIST_OF_SPONSORS(SPONSOR_ID)
);

INSERT INTO ACTUAL_TOURNAMENT_SPONSORS VALUES(1,1);
INSERT INTO ACTUAL_TOURNAMENT_SPONSORS VALUES(2,2);
INSERT INTO ACTUAL_TOURNAMENT_SPONSORS VALUES(2,1);

CREATE TABLE PLAYERS(
  PLAYER_ID NUMBER(8) CONSTRAINT PLAYER_PK PRIMARY KEY,
  CLUB_ID NUMBER(5),
  RANKING_CODE NUMBER(2) CONSTRAINT PLA_RA_CO_NN NOT NULL,
  FRIST_NAME VARCHAR(50),
  LAST_NAME VARCHAR(50),
  ADRESS VARCHAR(100),
  PHONE_NUMBER VARCHAR(20),
  EMAIL_ADRESS VARCHAR(100),
  OTHER_PLAYER_DETAILS VARCHAR(100),
  CONSTRAINT RAN_CO_PLA_FK FOREIGN KEY (RANKING_CODE) REFERENCES REF_RANKING_CODES(RANKING_CODE),
  CONSTRAINT CH_CLUB_PLA_FK FOREIGN KEY (CLUB_ID) REFERENCES CHESS_CLUBS(CLUB_ID)
);

INSERT INTO PLAYERS VALUES(1,1,1,'JUAN','FERNANDEZ','ZAC','3658463875','JUANFER@GMAIL.COM',NULL);
INSERT INTO PLAYERS VALUES(2,2,2,'VANESSA','HERMOSILLO','VALPA','2647453629','VANESSA@GMAIL.COM',NULL);
INSERT INTO PLAYERS VALUES(3,2,2,'VICTOR','RODRIGUEZ','ZAC','7645389876','VICTOR@GMAIL.COM',NULL);

CREATE TABLE PLAYER_TOURNAMENT_PARTI(
  PLAYER_ID NUMBER(8),
  TOURNAMENT_ID NUMBER(8),
  FINAL_RESULT VARCHAR(50),
  CONSTRAINT PLAYER_TOURNAMENT_PARTI_PK PRIMARY KEY (PLAYER_ID,TOURNAMENT_ID),
  CONSTRAINT PLA_PLA_TO_PA_FK FOREIGN KEY (PLAYER_ID) REFERENCES PLAYERS(PLAYER_ID),
  CONSTRAINT TOUR_PLA_TO_PA_FK FOREIGN KEY (TOURNAMENT_ID) REFERENCES TOURNAMENTS(TOURNAMENT_ID)
);

INSERT INTO PLAYER_TOURNAMENT_PARTI VALUES(1,1,'FINAL 1');
INSERT INTO PLAYER_TOURNAMENT_PARTI VALUES(2,2,'FINAL 2');

CREATE TABLE REF_RESULT_CODES(
  RESULT_CODE NUMBER(1) CONSTRAINT REF_RES_COD_PK PRIMARY KEY,
  RESULT_DESCRIPTION VARCHAR(20)
);

INSERT INTO REF_RESULT_CODES VALUES(1,'WIN');
INSERT INTO REF_RESULT_CODES VALUES(2,'LOSS');
INSERT INTO REF_RESULT_CODES VALUES(3,'DRAW');


CREATE TABLE MATCHES(
  TOURNAMENT_ID NUMBER(8),
  PLAYER_ID_1 NUMBER(8),
  PLAYER_ID_2 NUMBER(8),
  MATCH_START_DATETIME DATE,
  RESULT_CODE NUMBER(1) CONSTRAINT MAT_RES_NN NOT NULL,
  MATCH_END_DATE_TIME DATE,
  CONSTRAINT MATCHES_PK PRIMARY KEY (TOURNAMENT_ID,PLAYER_ID_1,PLAYER_ID_2,MATCH_START_DATETIME),
  CONSTRAINT PLA_MAT_FK FOREIGN KEY (PLAYER_ID_1,TOURNAMENT_ID) REFERENCES PLAYER_TOURNAMENT_PARTI(PLAYER_ID,TOURNAMENT_ID),
  CONSTRAINT REF_RES_CO_MET_FK FOREIGN KEY (RESULT_CODE) REFERENCES REF_RESULT_CODES(RESULT_CODE)
);

INSERT INTO MATCHES VALUES(1,1,2,'23/05/11',1,'23/05/11');
INSERT INTO MATCHES VALUES(1,1,3,'23/05/13',1,'23/05/13');
INSERT INTO MATCHES VALUES(2,2,1,'23/05/12',2,'23/05/12');

COMMIT;





