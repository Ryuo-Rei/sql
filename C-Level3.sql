-- 23
SELECT DISTINCT
	状態コード
FROM
	パーティー;

-- 24
SELECT
	ID,
	名称
FROM
	パーティー
ORDER BY
	ID ASC;

-- 25
SELECT
	名称,
	職業コード
FROM
	パーティー
ORDER BY
	名称 DESC;

-- 26
SELECT
	名称,
	HP,
	状態コード
FROM
	パーティー
ORDER BY
	状態コード ASC,
	HP DESC;

-- 27
SELECT
	タイプ,
	イベント番号,
	イベント名称,
	前提イベント番号,
	後続イベント番号
FROM
	イベント
ORDER BY
	3 ASC,
	2 ASC;

-- 28
SELECT DISTINCT
	*
FROM
	パーティー
ORDER BY
	HP DESC
FETCH FIRST 10 ROWS ONLY;

-- 29
SELECT DISTINCT
	MP
FROM
	パーティー
ORDER BY
	MP DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY;

-- 30
SELECT
	CASE
	WHEN 職業コード LIKE '1%' THEN 'S'
	WHEN 職業コード LIKE '2%' THEN 'M'
	ELSE 'A'
	END AS 職業区分,
	職業コード,
	ID,
	名称
FROM
	パーティー

ORDER BY
	職業コード ASC;

-- 31
SELECT
	イベント番号
FROM
	イベント
EXCEPT
SELECT
	イベント番号
FROM
	経験イベント
ORDER BY
	イベント番号 ASC;

-- 32
SELECT 
	イベント番号
FROM
	イベント
INTERSECT
SELECT
	イベント番号
FROM
	経験イベント
WHERE
	タイプ = '2';

