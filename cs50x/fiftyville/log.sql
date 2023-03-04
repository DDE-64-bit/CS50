
SELECT description
FROM crime_scene_reports
WHERE month = 7 AND day = 28 AND street = 'Chamberlin Street';

SELECT day, month, year, name, transcript FROM interviews
WHERE transcript LIKE '%courthouse%' AND day = 28 AND month = 7 AND year = 2020;

SELECT hour, minute, activity, license_plate FROM courthouse_security_logs
WHERE year = 2020 AND month = 7 AND day = 28 AND hour = 10;
SELECT account_number FROM atm_transactions
WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = 'Fifer Street' AND transaction_type = 'withdraw';

SELECT caller, receiver, duration FROM phone_calls
WHERE year = 2020 AND month = 7 AND day = 28;
SELECT caller, receiver, duration FROM phone_calls
WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60;
SELECT full_name, city FROM airports
WHERE city = 'Fiftyville';
SELECT full_name, abbreviation  FROM airports
WHERE city != 'Fiftyville';

SELECT * FROM flights
JOIN airports
ON flights.origin_airport_id = airports.id
WHERE year = 2020 AND month = 7 AND day = 29
ORDER BY hour, minute;

SELECT passport_number FROM passengers
WHERE flight_id = 43;


SELECT name FROM people
WHERE id IN (
SELECT person_id FROM bank_accounts
WHERE account_number IN (
SELECT account_number FROM atm_transactions
WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = 'Fifer Street' AND transaction_type = 'withdraw'));

SELECT name FROM people
WHERE license_plate IN (
SELECT license_plate FROM courthouse_security_logs
WHERE year = 2020 AND month = 7 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <= 30 AND activity = 'exit');

SELECT name FROM people
WHERE phone_number IN (
SELECT caller FROM phone_calls
WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60);

SELECT name FROM people
WHERE passport_number IN (
SELECT passport_number FROM passengers
WHERE flight_id = 36);

SELECT name FROM people
WHERE name IN (
SELECT name FROM people
WHERE id IN (
SELECT person_id FROM bank_accounts
WHERE account_number IN (
SELECT account_number FROM atm_transactions
WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = 'Fifer Street' AND transaction_type = 'withdraw'))
INTERSECT
SELECT name FROM people
WHERE license_plate IN (
SELECT license_plate FROM courthouse_security_logs
WHERE year = 2020 AND month = 7 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <= 30 AND activity = 'exit')
INTERSECT
SELECT name FROM people
WHERE passport_number IN (
SELECT passport_number FROM passengers
WHERE flight_id = 36)
INTERSECT
SELECT name FROM people
WHERE phone_number IN (
SELECT caller FROM phone_calls
WHERE year = 2020 AND month = 7 AND day = 28 AND duration  < 60)
);

SELECT name
FROM people
JOIN phone_calls
ON people.phone_number = phone_calls.receiver
WHERE  year = 2020 AND month = 7 AND day = 28 AND duration  < 60 AND caller = (
SELECT phone_number FROM people
WHERE name = 'Ernest'
);