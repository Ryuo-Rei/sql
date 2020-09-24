-- 34
SELECT
	商品コード,
	単価,
	FLOOR(単価 * 0.95) AS キャンペーン価格
FROM
	商品
WHERE
	商品区分 = '9'
ORDER BY
	商品コード ASC;

-- 35
UPDATE
	注文
SET 
	クーポン割引料 = クーポン割引料 - 300
WHERE
	注文日
BETWEEN
	'2018-03-12' AND '2018-03-14'
AND
	数量 >= 2
AND
	クーポン割引料 IS NOT NULL;

-- 36
UPDATE
	注文
SET
	数量 = 数量 - 1
WHERE
	注文番号 = '201802250126'
AND
	商品コード = 'W0156';

-- 37
SELECT
	*,
	注文番号 || '-' || 枝番 AS 注文番号枝番
FROM
	注文
WHERE
	注文番号
BETWEEN
	'201710010001' AND '201710319999';

-- 38
SELECT
	商品区分 AS 区分
	CASE
	WHEN 商品区分 = '1' THEN '衣類'
	WHEN 商品区分 = '2' THEN '靴'
	WHEN 商品区分 = '3' THEN '雑貨'
	WHEN 商品区分 = '9' THEN '未分類'
	END AS 区分名
FROM
	商品;

-- 39
SELECT
	商品コード,
	商品名,
	単価,
	CASE
	WHEN 単価 < 3000 THEN 'S'
	WHEN 単価 BETWEEN 3000 AND 9999 THNE 'M'
	WHEN 単価 >= THEN 'L'
	END AS 販売価格ランク,
	CASE
	WHEN 商品区分 = '1' THEN 商品コード || ':衣類'
	WHEN 商品区分 = '2' THEN 商品コード || ':靴'
	WHEN 商品区分 = '3' THEN 商品コード || ':雑貨'
	WHEN 商品区分 = '9' THEN 商品コード || ':未分類'
	END AS 商品区分
FROM
	商品
ORDER BY
	単価 ASC,
	商品コード ASC;

-- 40
SELECT
	商品名,
	LENGTH(商品名)
FROM
	商品
WHERE
	LENGTH(商品名) > 10
ORDER BY
	LENGTH(商品名) ASC;

-- 41
SELECT
	注文日,
	SUBSTRING(注文番号, LENGTH(注文番号) - 4, 4)
FROM
	注文;

-- 42
UPDATE
	商品
SET
	商品コード = REPLACE(SUBSTRING(商品コード, 1, 1), 'M', 'E')
WHERE
	商品コード LIKE 'M%';

-- 43
SELECT 
	SUBSTRING(注文番号, LENGTH(注文番号) - 4, 4)
FROM
	注文
WHERE 
	SUBSTRING(注文番号, LENGTH(注文番号) - 4, 4)
BETTWEEN
	'1000' AND'2000'
ORDER BY
	SUBSTRING(注文番号, LENGTH(注文番号) - 4, 4);

-- 44
UPDATE
	廃番商品
SET
	廃番日 = CURRENT_DATE
WHERE
	商品コード ='S1990';

-- 45
SELECT
	商品コード,
	商品名,
	単価,
	TRUNC(単価 * 0.7, 0) AS 値下げした単価
FROM
	商品
WHERE
	単価 >= 10000;