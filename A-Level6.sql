-- 59
UPDATE
	口座
SET 
	残高 = 残高 + (	SELECT
				入金額 - 出金額 AS 損益
			FROM
				取引
			WHERE
				口座番号 = '0351333'
			AND
				更新日 = '2018-01-11'
			)
WHERE
	口座番号 = '0351333';

-- 60
SELECT
	残高,
	(SELECT	
		SUM(入金額)
	FROM
		取引
	WHERE
		口座番号 = '1115600'
	AND
		更新日 = '2017-12-28') AS 入金合計額,
	(SELECT
		SUM(出金額)
	FROM
		取引
	WHERE
		口座番号 = '1115600'
	AND
		更新日 = '2017-12-28') AS 出金合計額)
FROM
	口座
WHERE
	口座番号 = '1115600'

-- 61
SELECT
	口座番号,
	名義,
	残高
FROM
	口座
WHERE
	口座番号 IN (SELECT
					口座番号
			   FROM
					取引
			   WHERE 入金額 >= 1000000);

-- 62
SELECT
	*
FROM
	口座
WHERE
	更新日 > ALL (SELECT
					日付
				FROM
					取引);

-- 63
SELECT
	SUB.日付,
	MAX(SUB.入金額) AS 最大入金額,
	MAX(SUB.出金額) AS 最大出金額
FROM (
	SELECT
		日付,
		入金額,
		出金額
	FROM
		取引
	WHERE
		入金額 IS NOT NULL
	AND
		出金額 IS NOT NULL
	AND
		口座番号 = '3104451'
	) AS SUB
GROUP BY
	SUB.日付;

-- 64
INSERT INTO
	廃止口座(口座番号,
	名義,
	種別,
	解約時残高,
	解約日)
SELECT
	口座番号,
	名義,
	種別,
	残高,
	更新日
FROM
	口座
WHERE
	口座番号 = '2761055';

DELETE
FROM
	口座
WHERE
	口座番号 = '2761055';
