USE multitracks_db;

CREATE TABLE dbo.Artist
(
	artistID INT PRIMARY KEY IDENTITY (1, 1),
	dateCreation SMALLDATETIME NOT NULL DEFAULT GETDATE(),
	title VARCHAR(100) NOT NULL,
	biography VARCHAR(MAX) NOT NULL,
	imageURL VARCHAR(500) NOT NULL,
	heroURL VARCHAR(500) NOT NULL
)



CREATE TABLE dbo.Album
(
	albumID INT PRIMARY KEY IDENTITY (1, 1),
	dateCreation SMALLDATETIME NOT NULL DEFAULT GETDATE(),
	artistID INT NOT NULL,
	title VARCHAR(255) NOT NULL,
	imageURL VARCHAR(500) NOT NULL,
	[year] INT NOT NULL,
	FOREIGN KEY (artistID) REFERENCES Artist(artistID)
)


CREATE TABLE dbo.Song
(
	songID INT PRIMARY KEY IDENTITY (1, 1),
	dateCreation SMALLDATETIME NOT NULL DEFAULT GETDATE(),
	albumID INT NOT NULL,
	artistID INT NOT NULL,
	title VARCHAR(255) NOT NULL,
	bpm DECIMAL(6, 2) NOT NULL, 
	timeSignature VARCHAR(10) NOT NULL,
	multitracks BIT NOT NULL,
	customMix BIT NOT NULL,
	chart BIT NOT NULL,
	rehearsalMix BIT NOT NULL,
	patches BIT NOT NULL,
	songSpecificPatches BIT NOT NULL,
	proPresenter BIT NOT NULL,
	FOREIGN KEY (albumID) REFERENCES Album(albumID),
	FOREIGN KEY (artistID) REFERENCES Artist(artistID)
)

CREATE TABLE dbo.AssessmentSteps
(
	stepID INT PRIMARY KEY IDENTITY (1, 1),
	[text] VARCHAR(250) NOT NULL
)
