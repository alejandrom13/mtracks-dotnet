CREATE PROCEDURE GetArtistDetails @Id INT
AS
BEGIN
    SELECT * FROM Artist WHERE artistID = @Id

    /*SELECT TOP 3 SONGS*/
    SELECT TOP 3 Song.artistID, Song.songID, Song.albumID, Song.title AS SongTitle, Song.bpm, Song.timeSignature,
            Album.title AS AlbumTitle, Album.imageURL, Song.multitracks, Song.customMix, Song.chart, Song.rehearsalMix, Song.patches, Song.songSpecificPatches, Song.proPresenter
    FROM Song
    INNER JOIN Album ON Song.albumID = Album.albumID AND Song.artistID = @Id

    /*SELECT TOP 6 ALBUMS*/
    SELECT TOP 6 Album.albumID, Album.artistID, Album.title AS AlbumTitle, Album.imageURL, Album.[year], Artist.title AS ArtistName
    FROM Album
    INNER JOIN Artist ON Album.artistID = Artist.artistID AND Album.artistID = @Id
END

EXEC GetArtistInfo @Id = '5'

DROP PROC GetTopArtistAlbums