-- 65
SELECT
	T1.口座番号,
	T1.日付,
	T2.取引事由名,
	CASE
	WHEN T1.入金額 IS NULL THEN T1.出金額
	END AS 取引金額
FROM
	取引 T1
JOIN
	取引事由 T2
ON 
	T1.取引事由ID = T2.取引事由ID
WHERE
	T1.口座番号 IN ('0311240', '1234161', '2750902')
ORDER BY
	取引番号 ASC;

-- 66
SELECT
	T1.口座番号,
	T1.名義,
	T1.残高,
	T2.日付,
	T2.入金額,
	T2.出金額
FROM
	口座 T1
INNER JOIN
	取引 T2
ON
	T1.口座番号 = T2.口座番号
WHERE
	T1.口座番号 = '0887132'
ORDER BY
	日付 ASC;

-- 67
SELECT DISTINCT
	T1.口座番号,
	T1.名義,
	T1.残高
FROM
	口座 T1
JOIN
	廃止口座 T2
ON
	T1.口座番号 = T2.口座番号
JOIN
	取引 T3
ON
	T1.口座番号 = T3.口座番号
WHERE
	T3.日付 = '2016-03-01';

-- 68
SELECT DISTINCT
	T1.口座番号,
	CASE
	WHEN T2.口座番号 IS NOT NULL  THEN '解約済み'
	ELSE T1.名義
	END AS 名義,
	CASE
	WHEN T2.口座番号 IS NOT NULL THEN 0
	ELSE T1.残高
	END AS 残高
FROM
	口座 T1
LEFT OUTER JOIN
	廃止口座 T2
ON
	T1.口座番号 = T2.口座番号
JOIN
	取引 T3
ON
	T1.口座番号 = T3.口座番号
WHERE
	T3.日付 = '2016-03-01';

-- 69
SELECT
	T1.取引番号,
	T2.取引事由ID || ':' || 取引事由名 AS 取引事由,
	T1.日付,
	T1.口座番号,
	T1.入金額,
	T1.出金額
FROM
	取引 T1
JOIN
	取引事由 T2
ON
	T1.取引事由ID = T2.取引事由ID;

-- 70
SELECT
	T1.取引事由ID,
	T1.取引事由名
FROM
	取引事由 T1
LEFT OUTER JOIN
	取引 T2
ON
	T1.取引事由ID = T2.取引事由ID
WHERE
	T1.取引事由ID IS NOT NULL;

-- 71
SELECT
	T1.口座番号,
	T1.名義,
	T1.残高,
	T2.日付,
	T2.入金額,
	T2.出金額,
	T3.取引事由名
FROM
	口座 T1
INNER JOIN
	取引 T2
ON
	T1.口座番号 = T2.口座番号
JOIN
	取引事由 T3
ON
	T2.取引事由ID = T3.取引事由ID
WHERE
	T1.口座番号 = '0887132'
ORDER BY
	T2.日付 ASC;

-- 72
SELECT
	T1.口座番号,
	T1.名義,
	T1.残高,
	T2.日付 AS 取引の日付,
	T2.取引事由ID,
	T2.入金額,
	T2.出金額
FROM
	口座 T1, 取引 T2
WHERE
	T1.口座番号 = T2.口座番号
AND
	T1.残高 >= 5000000
AND
	T2.日付 > '2017-12-31'
AND
	(
	T2.入金額 > 1000000
	OR
	T2.出金額 > 1000000
	);

-- 73
SELECT
	T1.口座番号,
	T1.名義,
	T1.残高,
	T2.日付 AS 取引の日付,
	T2.取引事由ID,
	T2.入金額,
	T2.出金額
FROM
	口座 T1
JOIN
	(
	SELECT
		日付,
		取引事由ID,
		入金額,
		出金額
	FROM
		取引
	WHERE
		T2.日付 > '2017-12-31'
	AND
		(
		T2.入金額 > 1000000
		OR
		T2.出金額 > 1000000
		)
	) AS T2
ON
	T1.口座番号 = T2.口座番号
WHERE
	T1.残高 >= 5000000;

-- 74
SELECT
	T1.名義,
	T2.口座番号,
	T2.取引数
FROM
	口座 T1
JOIN
	(
	SELECT
		口座番号,
		COUNT(取引番号) AS 取引数,
		日付
	FROM
		取引
	GROUP BY 
		口座番号,
		日付
	HAVING
		COUNT(取引番号) >= 3
	)AS T2
ON
	T1.口座番号 = T2.口座番号;

-- 75
SELECT
	T1.名義,
	T1.口座番号,
	T1.種別,
	T1.残高,
	T1.更新日
FROM
	口座 T1
JOIN
	(
	SELECT
		名義
	FROM
		口座
	GROUP BY
		名義
	HAVING
		COUNT(口座番号) >= 2
	) AS T2
ON
	T1.名義 = T2.名義;