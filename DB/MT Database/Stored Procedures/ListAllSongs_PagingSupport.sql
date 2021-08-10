CREATE PROCEDURE ListAllSongs @PageNumber INT, @PageSize AS INT
AS
SELECT * FROM Song
ORDER BY dateCreation
OFFSET (@PageNumber-1)*@PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY


