Rack приложение 
отвечает на URL GET /time
с параметром строки запроса format и возвращет время в заданном формате. 

Например, GET-запрос  
/time?format=year%2Cmonth%2Cday
вернет ответ с типом text/plain и телом 1970-01-01.