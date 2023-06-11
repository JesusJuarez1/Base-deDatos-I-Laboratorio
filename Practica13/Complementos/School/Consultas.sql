--a. Indicar qu� usuario ha tenimo m�s lecciones de manejo.
SELECT * FROM CUSTOMERS WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM 
(SELECT CUSTOMER_ID,COUNT(*) AS CONT FROM LESSONS GROUP BY CUSTOMER_ID)TMP 
WHERE TMP.CONT = (SELECT MAX(CONT) FROM (SELECT CUSTOMER_ID,COUNT(*) AS CONT FROM LESSONS GROUP BY CUSTOMER_ID)TMP));


--b. Indicar qu� veh�culos son los que se han usado menos en lecciones de manejo.
SELECT * FROM VEHICLES;
SELECT * FROM VEHICLES WHERE VEHICLE_ID IN (SELECT VEHICLE_ID FROM 
(SELECT VEHICLE_ID,COUNT(*) AS TOTAL FROM LESSONS GROUP BY VEHICLE_ID)TMP 
WHERE TMP.TOTAL = (SELECT MIN(TOTAL) FROM (SELECT VEHICLE_ID,COUNT(*) AS TOTAL FROM LESSONS GROUP BY VEHICLE_ID)TMP));

--c. Indicar el listado de personal que no ha ense�ado lecciones de manejo.
SELECT * FROM STAFF WHERE STAFF_ID NOT IN (SELECT STAFF_ID FROM LESSONS);

--d. Indicar cu�les son los m�todos de pago que se han usado m�s com�nmente en las lecciones de manejo.
SELECT * FROM REF_PAYMENT_METHODS WHERE PAYMENT_METHODS_CODE IN (SELECT PAYMENT_METHODS_CODE FROM 
(SELECT PAYMENT_METHOD_CODE,COUNT(*) AS CONT FROM CUSTOMER_PAYMENTS GROUP BY PAYMENT_METHOD_CODE)TMP 
WHERE TMP.CONT = (SELECT MAX(CONT) FROM (SELECT PAYMENT_METHOD_CODE,COUNT(*) AS CONT FROM CUSTOMER_PAYMENTS GROUP BY PAYMENT_METHOD_CODE)TMP));

--e. Indicar las personas que han recibido lecciones de manejo en sus fechas de nacimiento.
SELECT * FROM LESSONS;
SELECT TO_CHAR(CU.DATE_OF_BIRTH,'MM'),TO_CHAR(L.LESSON_DATE,'MM') FROM CUSTOMERS CU,LESSONS L;
SELECT CU.* FROM CUSTOMERS CU JOIN LESSONS L ON TO_CHAR(CU.DATE_OF_BIRTH,'DD/MM') = TO_CHAR(L.LESSON_DATE,'DD/MM') 
AND CU.CUSTOMER_ID = L.CUSTOMER_ID;


--f. Indicar las ciudades de residencia en donde se han impartido lecciones de manejo.
