SELECT a.ArtistId, SUM(a.Name) 
FROM artists a
GROUP BY a.name;

SELECT COUNT(*)
FROM artists art 
WHERE a.ArtistId ;

SELECT *
FROM albums alm 
INNER JOIN artists art ON alm.ArtistId = art.ArtistId 
WHERE alm.Title = "Voodoo Lounge";

SELECT alm.Title , art.Name 
FROM albums alm
INNER JOIN artists art ON alm.ArtistId = art.ArtistId 
WHERE alm.Title = "Voodoo Lounge";

SELECT art.Name , alm.Title 
FROM artists art
INNER JOIN albums alm ON art.ArtistId = alm.ArtistId 
WHERE art.Name = "Ozzy Osbourne";

SELECT COUNT(t.TrackId) AS total_canciones
FROM artists a 
JOIN albums alm ON a.ArtistId = alm.ArtistId
JOIN tracks t ON alm.AlbumId = t.AlbumId 
WHERE a.Name = "Red Hot Chili Peppers";

SELECT Name, Milliseconds
FROM tracks t 
ORDER BY Milliseconds DESC 
LIMIT 3;

SELECT g.Name AS Genero, t.name AS Cancion, t.Bytes
FROM tracks t 
JOIN genres g ON t.GenreId = g.GenreId 
ORDER BY t.Bytes ASC 
LIMIT 1;

SELECT g.Name AS Genero, COUNT(t.TrackId) AS Total_Canciones
FROM tracks t
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Total_Canciones DESC
LIMIT 1;

SELECT a.Name AS Artista, COUNT(t.TrackId) AS Total_Canciones
FROM artists a
JOIN albums al ON a.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
GROUP BY a.Name
ORDER BY Total_Canciones DESC
LIMIT 10;

SELECT
   e.FirstName || ' ' || e.LastName AS Empleado,
   COUNT(i.InvoiceId) AS Total_Invoices
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY Total_Invoices DESC;

SELECT
   t.Name AS Cancion,
   COUNT(*) AS veces_en_playlist
FROM playlist_track pt
JOIN tracks t ON pt.TrackId = t.TrackId
GROUP BY pt.TrackId
ORDER BY veces_en_playlist DESC 
LIMIT 1;