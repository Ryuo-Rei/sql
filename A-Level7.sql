-- 65
SELECT
	T1.口座番号,
	T1.日付,
	T2.取引事由名,
	CASE
	WHEN T1.入金額 IS NULL THEN T1.出金額
	WHEN T1.出金額 IS NULL THEN T1.入金額
	END AS 取引金額
FROM
	取引 T1
JOIN
	取引事由 T2
ON 
	T1.取引事由ID = T2.取引事由ID
GROUP BY
	T1.口座番号
WHERE
	T1.口座番号 IN ('0311240', '1234161', '2750902')
ORDER BY
	取引番号 ASC;

-- 66
SELECT
	AS 口座情報,
	T2日付,
	T2.入金額,
	T2.出金額 取引情M
	T1.口座
INNER JOIN
	T2.取引
ON
	T1.口座番号 = T2.口座番号;
WHERE
	口座番号 = '0887132'
ORDER BY
	取引日 ASC;

-- 67
SELECT DISTINCT
	T1.口座番号,
	T1.名義,
	T1.残高
FROM
	口座 T1
JOIN
	(
	SELECT
		*
	FROM
		口座
	EXCEPT
	SELECT
		*
	FROM
		廃止口座
	) AS T2
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
	WHEN T1.口座番号 = T2.口座番号 THEN '解約済み'
	ELSE T1.名義
	END AS 名義,
	CASE
	WHEN T1.口座番号 = T2.口座番号 THEN 0
	ELSE T1.残高
	END AS 残高
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
SELECT DISTINCT
	T1.取引事由ID,
	T1.取引事由名
FROM
	取引事由 T1
JOIN
	取引 T2
ON
	T1.取引事由ID = T2.取引事由ID;

-- 71
SELECT
	'(' || 口座番号 || '、' || 名義 || '、' || 残高 || ')' AS 口座情報,
	'(' || 日付 || '、' || 入金額 || '、' || 出金額 || ')' AS 取引情報
FROM
	口座 T1
INNER JOIN
	取引 T2
ON
	T1.口座番号 = T2.口座番号;
WHERE
	T1.口座番号 = '0887132'
ORDER BY
	T2.取引日 ASC;

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
	COUNT(T2.取引番号)
FROM
	口座 T1
JOIN
	(
	SELECT
		口座番号,
		COUNT(取引番号),
		取引番号
	FROM
		取引
	GROUP BY 
		取引番号
	HAVING
		COUNT(取引番号) >= 3
	)AS T2
ON
	T1.口座番号 = T2.口座番号;

-- 75
SELECT DISTINCT
	名義,
	口座番号,
	種別,
	残高,
	更新日
FROM
	口座
ORDER BY
	名義 ASC,
	口座番号 ASC;
