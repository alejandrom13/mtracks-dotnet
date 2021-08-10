CREATE PROCEDURE SearchArtistByName @ArtistName VARCHAR(60)
AS
SELECT * FROM Artist WHERE Artist.title LIKE '%'+@ArtistName+'%'


EXEC SearchArtistByName @ArtistName = "lake"


