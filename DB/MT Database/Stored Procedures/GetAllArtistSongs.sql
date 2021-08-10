CREATE PROCEDURE GetAllArtistSongs @Id INT
AS
SELECT Song.artistID, Song.songID, Song.albumID, Song.title AS SongTitle, Song.bpm, Song.timeSignature,
            Album.title AS AlbumTitle, Album.imageURL, Song.multitracks, Song.customMix, Song.chart, Song.rehearsalMix, Song.patches, Song.songSpecificPatches, Song.proPresenter
    FROM Song
    INNER JOIN Album ON Song.albumID = Album.albumID AND Song.artistID = @Id
