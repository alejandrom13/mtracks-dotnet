CREATE PROCEDURE AddArtist 
@ArtistName VARCHAR(100), 
@biography VARCHAR(MAX),
@imageURL VARCHAR(500),
@heroURL VARCHAR(500) 
AS
INSERT INTO Artist(title, biography, imageURL, heroURL)
VALUES(@ArtistName, @biography, @imageURL, @heroURL)


SELECT * FROM Artist WHERE title = 'Rihanna'

DROP PROC AddArtist

