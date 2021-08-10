CREATE PROCEDURE GetAllArtistAlbums @Id INT
AS
SELECT Album.albumID, Album.artistID, Album.title AS AlbumTitle, Album.imageURL, Album.[year], Artist.title AS ArtistName
FROM Album
INNER JOIN Artist ON Album.artistID = Artist.artistID AND Album.artistID = @Id

EXEC GetTopArtistAlbums @Id = '5';

