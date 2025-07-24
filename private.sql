CREATE TABLE triplets(
    sentence_number NUMBER,
    character_number NUMBER,
    message_length NUMBER

);

INSERT INTO triplets VALUES(14,	98,	4);
INSERT INTO triplets VALUES(114,	3,	5);
INSERT INTO  triplets VALUES(618,	72,	9);
INSERT INTO triplets VALUES(630,	7,	3);
INSERT INTO triplets VALUES(932,	12,	5);
INSERT INTO triplets VALUES(2230,	50,	7);
INSERT INTO triplets VALUES(2346,	44,	10);
INSERT INTO triplets VALUES(3041,	14,	5);


CREATE VIEW message
AS SELECT substr(sentence,character_number,message_length) AS phrase FROM triplets
JOIN sentences ON triplets.sentence_number = sentences.id;
