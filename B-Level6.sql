-- 55
SELECT
	商品コード,
	商品名,
	単価,
	(SELECT
		SUM(数量) AS これまでに販売した数量
	FROM
		注文
	WHERE
		商品コード = 'S0604')
FROM
	商品
WHERE
	商品コード = 'S0604';

-- 56
UPDATE
	注文
SET
	商品コード = (
			SELECT
				商品コード
			FROM
				商品
			WHERE
				商品区分 = '2'
			AND
				(
				商品名 LIKE '%ブーツ%'
				AND
				商品名 LIKE '%雨%'
				AND
				商品名 LIKE '%安心%'
				)
			)
WHERE
	注文日 = '2018-03-15'
AND
	注文番号 = '201803150014'
AND
	注文枝番 = '1';

-- 57
SELECT
	注文日,
	商品コード
FROM
	注文
WHERE
	商品コード IN (
			SELECT
				商品コード
			FROM
				商品
			WHERE
				商品名 LIKE '%あったか%'
			)
AND
	注文日 IS NOT NULL
ORDER BY
	注文日;

-- 58
SELECT
	商品コード,
	SUM(数量) AS 販売数量
FROM
	注文
GROUP BY
	商品コード,
	数量
HAVING
	数量 > ALL (
			SELECT
				AVG(数量)
			FROM
				注文
			GROUP BY
				商品コード
			);

-- 59
SELECT
	TRUNC(SUM(SUB.数量)) AS 割引による販売数,
	TRUNC(クーポン割引料 / 数量) AS 平均割引額
FROM (
	SELECT
		数量,
		クーポン割引料
	FROM
		注文
	WHERE
		クーポン割引料 IS NOT NULL
	AND
		商品コード = 'W0746'
	) AS SUB;

-- 60
INSERT INTO
	注文(
		注文日,
		注文番号,
		注文枝番,
		商品コード,
		数量,
		クーポン割引料
	)
SELECT
	'2018-03-21',
	'201803210080',
	(
		SELECT
			MAX(注文枝番) + 1
		FROM
			注文
		WHERE
			注文番号 = '201803210080'
	),
	'S1003',
	1,
	NULL
FROM
	注文;

INSERT INTO
	注文(
		注文日,
		注文番号,
		注文枝番,
		商品コード,
		数量,
		クーポン割引料
	)
SELECT
	'2018-03-22',
	'201803220901',
	(
		SELECT
			MAX(注文枝番) + 1
		FROM
			注文
		WHERE
			注文番号 = '201803220901'
	),
	'A0052',
	2,
	500
FROM
	注文;

	

		