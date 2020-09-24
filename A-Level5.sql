-- 49
SELECT
	SUM(残高),
	MAX(残高),
	MIN(残高),
	AVG(残高),
	COUNT(残高)
FROM
	口座;

-- 50
SELECT
	COUNT(*)
FROM
	口座
WHERE
	種別 = <> '1'
AND
	残高 >= 1000000
AND
	更新日 < '2018-01-01';

-- 51
SELECT
	COUNT(*) - COUNT(更新日)
FROM
	口座;

-- 52
SELECT
	MAX(名義),
	MIN(名義)
FROM
	口座;

-- 53
SELECT
	MAX(更新日),
	MIN(更新日)
FROM
	口座;

-- 54
SELECT
	種別,
	SUM(残高) AS 種別ごとの残高合計,
	MAX(残高) AS 種別ごとの最大残高,
	MIN(残高) AS 種別ごとの最小残高,
	AVG(残高) AS 種別ごとの平均残高,
	COUNT(残高) AS 種別ごとの登録されているデータ件数
FROM
	口座
GROUP BY
	種別;

-- 55
SELECT
	RIGHT(口座番号, 1) AS 口座番号,
	COUNT(口座番号) AS データ件数
FROM
	口座
GROUP BY
	1
ORDER BY
	2 DESC;

-- 56
SELECT
	CASE
	WHEN 更新日 IS NULL THEN 'XXXX年'
	ELSE SUBSTRING(CAST(更新日 AS VARCHAR), 1, 4) || '年' 
	END AS 更新日の年,
	SUM(残高) AS 更新日の年ごとの残高合計,
	MAX(残高) AS 更新日の年ごとの最大残高,
	MIN(残高) AS 更新日の年ごとの最小残高,
	AVG(残高) AS 更新日の年ごとの平均残高,
	COUNT(残高) AS 更新日の年ごとの登録されているデータ件数
FROM
	口座
GROUP BY
	更新日;

-- 57
SELECT
	種別,
	SUM(残高) AS 種別ごとの残高合計,
	COUNT(残高) AS 種別ごとの登録されているデータ件数
FROM
	口座
GROUP BY
	種別
HAVING
	SUM(残高) > 3000000;

-- 58
SELECT
	LEFT(名義, 1) AS 名義,
	COUNT(名義) AS データ件数,
	AVG(LENGTH(TRIM(名義))) AS 名義文字数の平均
FROM
	口座
GROUP BY
	1
HAVING
	COUNT(名義) >= 10
AND
	AVG(LENGTH(TRIM(名義))) > 5;
