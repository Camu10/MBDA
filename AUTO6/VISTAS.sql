CREATE OR REPLACE VIEW TIEMPO AS
SELECT DISTINCT staff.name
FROM teaches , event, staff
WHERE event.id = teaches.event AND teaches.staff = staff.id AND event.duration > 1.5288;
