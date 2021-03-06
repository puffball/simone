CREATE TABLE ATOM_FEED  (   FEED_ID BIGINT NOT NULL 
,   NEXT_FEED_ID BIGINT
,   PREV_FEED_ID BIGINT
,   FEED_XML XML);


ALTER TABLE ATOM_FEED
        ADD PRIMARY KEY
                (FEED_ID);



CREATE TABLE ATOM_ENTRY  (
					ENTRY_ID char(16) for bit data NOT NULL,
                  ENTRY_CONTENT_TYPE VARCHAR(100) NOT NULL ,
                  SUBMITTED TIMESTAMP NOT NULL ,
                  ENTRY_XML XML ,
                  FEED_ID BIGINT );

ALTER TABLE ATOM_ENTRY
        ADD PRIMARY KEY
                (ENTRY_ID);

CREATE TABLE ATOM_CATEGORY (
ENTRY_ID char(16) for bit data NOT NULL,
				  TERM VARCHAR(255) NOT NULL,
				  LABEL VARCHAR(255) NOT NULL
				
                      
);

ALTER TABLE ATOM_CATEGORY
		ADD PRIMARY KEY
			(ENTRY_ID,
			TERM, 
			 LABEL 
		 	 );



ALTER TABLE ATOM_ENTRY
        ADD CONSTRAINT FK_ATOM_FEED FOREIGN KEY
                (FEED_ID)
        REFERENCES ATOM_FEED
                (FEED_ID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
        ENFORCED;

ALTER TABLE ATOM_CATEGORY
		ADD CONSTRAINT FK_ATOM_ENTRY FOREIGN KEY
			(ENTRY_ID)
		REFERENCES ATOM_ENTRY
			(ENTRY_ID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
        ENFORCED;        