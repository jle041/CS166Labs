--Count how many parts in NYC have more than 70 parts on_hand
SELECT COUNT(*)
FROM part_nyc NYC
WHERE on_hand > 70;

--Count how many total parts on_hand, in both NYC and SFO, are Red
SELECT SUM(
(SELECT COUNT(NYC.on_hand)
FROM part_nyc NYC, color C
WHERE NYC.color = C.color_id AND C.color_name = 'Red')
+
(SELECT COUNT(SFO.on_hand)
FROM part_sfo SFO, color C
WHERE SFO.color = C.color_id AND C.color_name = 'Red'))
AS sum_red;

--List all the suppliers that have more total on_hand parts in NYC than they do in SFO
SELECT S.supplier_id, S.supplier_name
FROM supplier S
WHERE
(SELECT SUM(NYC.on_hand)
FROM part_nyc NYC
WHERE S.supplier_id = NYC.supplier)
>
(SELECT SUM(SFO.on_hand)
FROM part_sfo SFO
WHERE S.supplier_id = SFO.supplier)
ORDER BY S.supplier_id;

--List all suppliers that supply parts in NYC that aren't supplied by anyone in SFO
SELECT DISTINCT S.supplier_id, S.supplier_name
FROM supplier S, part_nyc NYC
WHERE S.supplier_id = NYC.supplier AND NYC.part_number IN
	(SELECT NYC1.part_number
	FROM supplier S, part_nyc NYC1
	WHERE S.supplier_id = NYC1.supplier
	EXCEPT
	SELECT SFO.part_number
	FROM supplier S, part_sfo SFO
	WHERE S.supplier_id = SFO.supplier)
ORDER BY S.supplier_id;


--Update all of the NYC on_hand values to on_hand - 10
UPDATE part_nyc
SET on_hand = on_hand - 10;

--Delete all parts from NYC which have less than 30 parts on_hand
DELETE FROM part_nyc
WHERE on_hand < 30;

