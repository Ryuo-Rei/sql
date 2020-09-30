-- 61
SELECT
	T1.注文番号,
	T1.注文枝番,
	T1.商品コード,
	T2.商品名,
	T1.数量
FROM
	(
	SELECT
		注文番号,
		注文枝番,
		商品コード,
		数量
	FROM
		注文
	WHERE
		注文番号 = '201801130115'
	) AS T1
JOIN
	商品 T2
ON
	T1.商品コード = T2.商品コード
ORDER BY
	注文番号 ASC,
	注文枝番 ASC;

-- 62
SELECT
	注文日,
	注文番号,
	注文枝番,
	数量,
	単価 * 数量 AS 注文金額
FROM
	注文 T1,
	廃番商品 T2
WHERE
	T1.商品コード = T2.商品コード
AND
	T1.注文日 > T2.廃番日
AND
	T1.商品コード = 'A0009';

-- 63
SELECT
	T1.商品コード,
	T1.商品名,
	T1.単価,
	T2.注文日,
	T2.注文番号,
	T2.数量,
	単価 * 数量 AS 注文金額
FROM
	(
	SELECT
		商品コード,
		商品名,
		単価
	FROM
		商品
	WHERE
		商品コード = 'S0604'
	) AS T1
JOIN
	注文 T2
ON
	T1.商品コード = T2.商品コード
ORDER BY
	注文日 ASC;

-- 64
SELECT DISTINCT
	T1.商品コード,
	T1.商品名
FROM
	商品 T1
JOIN
	(
	SELECT
		商品コード
	FROM
		注文
	WHERE
		注文日
	BETWEEN '2016-08-01' AND '2016-08-31'
	) AS T2
ON
	T1.商品コード = T2.商品コード;

-- 65
SELECT DISTINCT
	T1.商品コード,
	CASE
	WHEN T2.商品名 IS NOT NULL THEN '廃番'
	ELSE T1.商品名
	END AS 商品名
FROM
	商品 T1
LEFT JOIN
	廃番商品 T2
ON
	T1.商品コード = T2.商品コード
JOIN
	(
	SELECT
		商品コード
	FROM
		注文
	WHERE
		注文日
	BETWEEN '2016-08-01' AND '2016-08-31'
	) AS T3
ON
	T1.商品コード = T3.商品コード;

-- 66
SELECT
	T2.注文日,
	T1.商品コード || ':' || T1.商品名 AS 商品,
	CASE
	WHEN T2.数量 IS NOT NULL THEN 0
	ELSE T2.数量
	END AS 数量
FROM
	(
	SELECT
		商品コード,
		商品名
	FROM
		商品
	WHERE
		商品区分 = '3'
	) AS T1
LEFT JOIN
	注文 T2
ON
	T1.商品コード = T2.商品コード;

-- 67
SELECT
	T1.注文日,
	T2.商品コード || ':' || T2.商品名 AS 商品,
	T1.数量	
FROM
	注文 T1
JOIN
	(
	SELECT
		商品コード,
		商品名
	FROM
		商品
	WHERE
		商品区分 = '3'
	) AS T2
ON
	T1.商品コード = T2.商品コード
LEFT JOIN
	(
	SELECT
		商品コード,
		'(廃番済み)' AS 商品名
	FROM
		廃番商品
	WHERE
		商品区分 = '3'
	) AS T3
ON
	T2.商品コード = T3.商品コード;

-- 68
SELECT
	T1.注文日,
	T1.注文番号,
	T1.注文枝番,
	T1.商品コード,
	T2.商品名,
	T2.単価,
	T1.数量,
	CASE
	WHEN クーポン割引料 IS NULL THEN (T2.単価 * 数量)
	ELSE (T2.単価 * 数量) - クーポン割引料 
	END AS 注文金額
FROM
	(
	SELECT
		注文日,
		注文番号,
		注文枝番,
		商品コード,
		数量,
		クーポン割引料
	FROM
		注文
	WHERE
		注文番号 = '201704030010'
	) AS T1
JOIN
	商品 T2
ON 
	T1.商品コード = T2.商品コード
LEFT JOIN
	廃番商品 T3
ON
	
	T1.商品コード = T2.商品コード;

-- 69
SELECT
	T1.商品コード,
	T1.商品名,
	T1.単価,
	SUM(数量) AS 売上個数,
	単価 * SUM(数量) AS 総売上金額
FROM
	(
	SELECT
		商品コード,
		商品名,
		単価
	FROM
		商品
	WHERE
		商品コード LIKE 'B%'
	) AS T1
JOIN
	注文 T2
ON
	T1.商品コード = T2.商品コード
GROUP BY
	T1.商品コード,
	T1.商品名,
	T1.単価
ORDER BY
	T1.商品コード ASC;

-- 70
SELECT
	T1.商品コード,
	T1.商品名,
	T1.関連商品コード,
	T2.商品名 AS 関連商品名
FROM
	商品 T1
JOIN
	商品 T2
ON
	T1.関連商品コード = T2.商品コード

