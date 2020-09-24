-- 46
SELECT
	SUM(数量) AS これまで注文された数量合計
FROM
	注文;


-- 47
SELECT
	SUM(数量) AS 注文日ごとの数量合計
FROM
	注文
GROUP BY
	注文日
ORDER BY
	注文日 ASC;

-- 48
SELECT
	MIN(単価) AS 商品区分ごとの単価最小額,
	MAX(単価) AS 商品区分ごとの単価最高額
FROM
	商品
GROUP BY
	商品区分
ORDER BY
	商品区分 ASC;

-- 49
SELECT
	SUM(数量) AS これまで注文された数量合計
FROM
	注文
GROUP BY
	商品コード
ORDER BY
	商品コード ASC;

-- 50
SELECT
	商品コード,
	SUM(数量) AS 商品ごとの売れた数量合計
FROM
	注文
GROUP BY
	商品コード
ORDER BY
	SUM(数量) DESC,
	商品コード ASC
OFFSET 0 ROWS 
	FETCH NEXT 10 ROWS ONLY;

-- 51
SELECT
	商品コード,
	SUM(数量) AS これまで注文された数量合計
FROM
	注文
GROUP BY
	商品コード
HAVING
	SUM(数量) < 5;

-- 52
SELECT
	COUNT(クーポン割引料) AS クーポン割引した注文件数,
	SUM(クーポン割引料) AS クーポン割引した合計額
FROM
	注文;

-- 53
SELECT
	SUBSTRING(CAST(注文日 AS VARCHAR), 1, 4) || SUBSTRING(CAST(注文日 AS VARCHAR), 6, 2) AS 年月,
	COUNT(注文枝番) AS 注文件数
FROM
	注文
GROUP BY
	注文日
ORDER BY
	注文日 DESC;

-- 54
SELECT
	商品コード LIKE 'Z%' AS 商品コード
FROM
	注文
GROUP BY
	1	
HAVING
	SUM(数量) >= 100;