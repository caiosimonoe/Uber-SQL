/* Consultando a base*/
SELECT * 

FROM ride_bookings_new rbn;


/* Consulta do total de viagens realizadas */
SELECT 
	COUNT (*) as total_bookings
	
FROM ride_bookings_new rbn

-- Resultado -> 150.000 

/* Consulta dos resultados das corridas */

SELECT booking_status, 
	COUNT (*) as total
	
FROM ride_bookings_new rbn
GROUP BY booking_status;

-- Resultado:
--		Cancelled by Customer = 10.500
--		Cancelled by Driver = 27.500
--		Completed = 93.000
--		Incomplete = 9.000
--		No Driver Found = 10.500

/* Consulta das corridas por mês */

SELECT 
    STRFTIME('%Y-%m', Date) AS ano_mes,   -- extrai ano-mês no formato YYYY-MM
    COUNT(*) AS total_viagens
FROM ride_bookings_new
GROUP BY ano_mes
ORDER BY ano_mes asc;

-- Resultados
	-- 	Janeiro = 12861
	--	Fevereiro =	11927
	--	Março = 12719
	--	Abril = 12199
	--	Maio = 12778
	--  Junho = 12440
	--  Julho =	12897
	--	Agosto = 12636
	--	Setembro = 12248
	--	Outrubro = 12651
	--	Novembro = 12394
	--	Dezembro = 12250

/* Consulta por tipo de veículo */

SELECT Vehicle_Type,
		COUNT (*) as Total_Booking_Vehicle,
		SUM (Booking_value) as Total_Booking_value,
		ROUND(AVG (Booking_value), 2) as Avg_Booking_value,
		SUM(Ride_Distance) as Total_Distance,
		ROUND(AVG(Ride_Distance), 2) as Avg_Distance

FROM ride_bookings_new
WHERE Booking_status = 'Completed'
GROUP BY Vehicle_Type;

-- Resultados:
	-- Auto -> 23.155 corridas com um valor médio de 506,48 e uma distância média percorrida de 25,99 km
	-- Bike -> 14.034 corridas com um valor médio de 509,11 e uma distância média percorrida de 26 km
	-- Go Mini -> 18.549 corridas com um valor médio de 507,38 e uma distãncia média percorrida de 25,99 km
	-- Go Sedan -> 16.676 corridas com um valor médio de 512,03 e uma distância média percorrida de 25,98 km
	-- Premier Sedan -> 11.252 corridas com um valor médio de 509,57 e uma distância média percorrida de 25,95
	-- Uber XL -> 2.783 corridas com um valor médio de 505,3 e uma distância média percorrida de 25,72
	-- eBike -> 6.551 corridas com um valor médio de 503,46 e uma distância média percorrida de 26,34

/* Consulta por tipo de método de pagamento */

