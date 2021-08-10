CREATE PROCEDURE [dbo].[GetArtistDetails]
	@Id int
AS
	SELECT * FROM Artist WHERE artistID = @Id

