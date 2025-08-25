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
	COUNT (*) as total,
	ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS perc_booking_status
	
FROM ride_bookings_new rbn
GROUP BY booking_status
ORDER BY perc_booking_status DESC;

-- Resultado:

	-- Completed = 93.000 (62%)
	-- Cancelled by Driver = 27.500 (18%)
	-- Cancelled by Customer = 10.500 (7%)
	-- No Driver Found = 10.500 (7%)
    -- Incomplete = 9.000 (6%)




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

SELECT Payment_Method,
		COUNT (*) as Total_Payment_Method,
		ROUND (COUNT(*) * 100.0 / SUM (COUNT(*)) OVER (), 2) as perc_payment_method

FROM ride_bookings_new
WHERE Booking_status = 'Completed'
GROUP BY Payment_Method
ORDER BY perc_payment_method desc;

-- Resultados:
	-- UPI = 41.834 (44,98%) 
	-- Cash = 23.114 (24,85%)
	-- Uber Wallet = 11.206 (12,5%)
	-- Credit Card = 9.320 (10,02%)
	-- Debit Card = 7.526 (8,09%)


/* TOP Customers */

SELECT Customer_ID,
		COUNT (*) as Total_Bookings_Customer,
		SUM (Booking_value) as total_booking_value,
		AVG (Booking_value) as avg_booking_value,
		MAX (Booking_value) as max_booking_value,
		MIN (Booking_value) as min_booking_value
		
		
FROM ride_bookings_new
WHERE Booking_status = 'Completed'
GROUP BY Customer_ID
ORDER BY total_booking_Value DESC;

-- Resultados
	-- O Cliente "CID2674107" foi o que mais gastou 4.987 em 2 corridas

/* Percentual de cancelamento */

SELECT 
    ROUND(SUM(CASE WHEN Booking_status IN ('Cancelled by Driver', 'Cancelled by Customer') THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancellation_rate
FROM ride_bookings_new;

-- Resultado -: 25%

/* Motivos do cancelamento pelo cliente */

SELECT Reason_for_Cancelling_by_Customer,
		COUNT (*) as total_reason_cancelling_customer,
		ROUND (COUNT (*) * 100.00 / SUM (COUNT(*)) OVER (), 2) as perc_reason_cancelling_customer

FROM ride_bookings_new
WHERE Reason_for_Cancelling_by_Customer != 'null'
GROUP BY Reason_for_Cancelling_by_Customer
ORDER BY perc_reason_cancelling_customer DESC;

-- Resultados
	-- Wrong Address= 22,5%
	-- Change of plans = 22,41%
	-- Driver is not moving towards pickup location = 22,24%
	-- Driver asked to cancel = 21,86%
	-- AC is not working = 11%


/* Motivos do cancelamento pelo Driver */

SELECT Driver_Cancellation_Reason,
		COUNT (*) as total_reason_cancelling_driver,
		ROUND (COUNT (*) * 100.00 / SUM (COUNT(*)) OVER (), 2) as perc_reason_cancelling_driver

FROM ride_bookings_new
WHERE Driver_Cancellation_Reason != 'null'
GROUP BY Driver_Cancellation_Reason
ORDER BY perc_reason_cancelling_driver DESC;

-- Resultados
	-- Customer related issue = 25,35%
	-- The customer was coughing/sick = 25%
	-- Personal & Car related issues = 24,91%
	-- More than permitted people in there = 24,76%

/* Média das notas dos cliente e por tipo de veículo */
SELECT  Vehicle_Type,
		ROUND (AVG (Customer_Rating),3) as AVG_Customer_Rating

FROM ride_Bookings_new rbn
WHERE Booking_status = 'Completed'
GROUP BY Vehicle_Type
ORDER BY AVG_Customer_Rating DESC;

-- Resultados
	-- Go Sedan = 4,41
	-- Uber XL = 4,405
	-- eBike = 4,404
	-- Go Mini = 4,404
	-- Bike = 4,404
	-- Premier Sedan = 4,403
	-- Auto = 4,402

/* Média das notas dos motoristas e por tipo de veículo */
SELECT  Vehicle_Type,
		ROUND (AVG (Driver_Ratings),3) as AVG_Driver_Rating

FROM ride_Bookings_new rbn
WHERE Booking_status = 'Completed'
GROUP BY Vehicle_Type
ORDER BY AVG_Driver_Rating DESC;

-- Resultados
	-- Uber XL = 4,238
	-- Premier Sedan = 4,235
	-- Go Sedan = 4,232
	-- Auto = 4,232
	-- Bike = 4,23
	-- Go Mini = 4,228
	-- eBike = 4,226



