-- Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT T.Name 
FROM Track T
Where T.UnitPrice >= 1

-- Listar las pistas de más de 4 minutos de duración
SELECT T.Name 
FROM Track T 
Where T.Milliseconds > 24000

-- Listar las pistas que tengan entre 2 y 3 minutos de duración
SELECT T.Name 
FROM Track T 
Where T.Milliseconds Between 120000 AND 180000

-- Listar las pistas que uno de sus compositores (columna Composer) sea Mercury
SELECT T.Name, T.Composer 
FROM Track T 
Where T.Composer LIKE '%Mercury%'

-- Calcular la media de duración de las pistas (Track) de la plataforma
SELECT AVG(T.Milliseconds) AS 'Average Running Time' 
FROM Track T 

-- Listar los clientes (tabla Customer) de USA, Canada y Brazil
SELECT C.FirstName, C.Country 
FROM Customer C 
Where C.Country in ('USA', 'Canada', 'Brazil')

-- Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen')
SELECT T.Name
FROM Track T
INNER JOIN LemonMusic.dbo.Album Al
	ON T.AlbumId = Al.AlbumId
INNER JOIN LemonMusic.dbo.Artist Ar
	ON Al.ArtistId = Ar.ArtistId
WHERE Ar.Name = 'Queen'

-- Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie
SELECT T.Name
FROM Track T
INNER JOIN LemonMusic.dbo.Album Al
	ON T.AlbumId = Al.AlbumId
INNER JOIN LemonMusic.dbo.Artist Ar
	ON Al.ArtistId = Ar.ArtistId
WHERE Ar.Name = 'Queen' AND T.Composer LIKE '%David Bowie%'

-- Listar las pistas de la playlist 'Heavy Metal Classic'
SELECT T.Name, P.Name
FROM PlaylistTrack PT
INNER JOIN LemonMusic.dbo.Track T
	ON PT.TrackID = T.TrackId
INNER JOIN LemonMusic.dbo.Playlist P
	ON P.PlaylistId = PT.PlaylistId
WHERE P.Name = 'Heavy Metal Classic'

-- Listar las playlist junto con el número de pistas que contienen
SELECT P.Name, COUNT(PT.TrackId)
FROM PlaylistTrack PT
INNER JOIN LemonMusic.dbo.Playlist P
	ON P.PlaylistId = PT.PlaylistId
GROUP BY P.Name

-- Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC
SELECT P.Name
FROM  Playlist P
INNER JOIN LemonMusic.dbo.PlaylistTrack PT
	ON PT.PlaylistId = P.PlaylistId
INNER JOIN LemonMusic.dbo.Track T
	ON T.AlbumId = PT.TrackId
INNER JOIN LemonMusic.dbo.Album Al
	ON T.AlbumId = Al.AlbumId
INNER JOIN LemonMusic.dbo.Artist Ar
	ON Al.ArtistId = Ar.ArtistId
Group By P.Name

-- Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen
SELECT P.Name as Playlist, COUNT(T.Name) as 'Track Count'
FROM  Playlist P
INNER JOIN LemonMusic.dbo.PlaylistTrack PT
	ON PT.PlaylistId = P.PlaylistId
INNER JOIN LemonMusic.dbo.Track T
	ON T.TrackId = PT.TrackId
INNER JOIN LemonMusic.dbo.Album Al
	ON T.AlbumId = Al.AlbumId
INNER JOIN LemonMusic.dbo.Artist Ar
	ON Al.ArtistId = Ar.ArtistId
Where Ar.Name = 'Queen'
Group BY P.Name

-- Listar las pistas que no están en ninguna playlist


-- Listar los artistas que no tienen album


-- Listar los artistas con el número de albums que tienen
SELECT Ar.Name as Artist, COUNT(T.AlbumId) as 'Album Count'
FROM Artist Ar
INNER JOIN Album Al
	ON Al.ArtistId = Ar.ArtistId
INNER JOIN Track T
on t.AlbumId = Al.AlbumId
Group BY Ar.Name

-- Para saber si está bien, asegurate que algunos de los artistas de la query anterior (artistas sin album) aparecen en este listado con 0 albums