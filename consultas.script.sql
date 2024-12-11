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


-- Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie


-- Listar las pistas de la playlist 'Heavy Metal Classic'


-- Listar las playlist junto con el número de pistas que contienen


-- Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC


-- Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen


-- Listar las pistas que no están en ninguna playlist


-- Listar los artistas que no tienen album


-- Listar los artistas con el número de albums que tienen


-- Para saber si está bien, asegurate que algunos de los artistas de la query anterior (artistas sin album) aparecen en este listado con 0 albums