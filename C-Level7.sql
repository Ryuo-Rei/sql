-- 62
SELECT
	T1.ルート番号,
	T1.イベント番号,
	T2.イベント名称,
	T1.クリア結果
FROM
	(
	SELECT
		ルート番号,
		イベント番号,
		クリア結果
	FROM
		経験イベント
	WHERE
		クリア区分 = '1'	
	) AS T1
JOIN
	イベント T2
ON
	T1.イベント番号 = T2.イベント番号;

-- 63
SELECT
	T2.イベント番号,
	T1.イベント名称,
	T2.クリア区分
FROM
	(
	SELECT
		イベント番号,
		イベント名称
	FROM
		イベント
	WHERE
		タイプ = '1'
	) AS T1
JOIN
	経験イベント T2
ON
	T1.イベント番号 = T2.イベント番号;

-- 64
SELECT
	T2.イベント番号,
	T1.イベント名称,
	T2.クリア区分
FROM
	(
	SELECT
		イベント番号,
		イベント名称
	FROM
		イベント
	WHERE
		タイプ = '1'
	) AS T1
JOIN
	(
	SELECT
		イベント番号,
		CASE
		WHEN クリア区分 = '0' THEN '未クリア'
		END AS クリア区分
	FROM
		経験イベント
	) AS T2
ON
	T1.イベント番号 = T2.イベント番号;

-- 65
SELECT
	T1.ID,
	T1.名称 AS なまえ,
	T2.職業,
	T2.状態
FROM
	パーティー T1
JOIN
	(
	SELECT
		コード名称 AS 職業,
		コード名称 AS 状態,
		コード値
	FROM
		コード
	) AS T2
ON
	T1.職業コード = T2.コード値
OR
	T1.状態コード = T2.コード値
ORDER BY
	ID;

-- 66
SELECT
	T1.ID,
	CASE
	WHEN T2.コード値 <> T1.職業コード THEN '仲間になっていない！'
	ELSE 名称
	END AS なまえ,
	T2.職業
FROM
	パーティー T1
JOIN
	(
	SELECT
		コード名称 AS 職業,
		コード値
	FROM
		コード
	) AS T2
ON T1.職業コード = T2.コード値;

-- 67
SELECT
	イベント番号,
	クリア区分,	
	コード値 || ':' || コード名称 AS クリア結果
FROM
	経験イベント T1
JOIN
	コード T2
ON
	T1.クリア結果 = T2.コード値

-- 68
SELECT
	T1.イベント番号,
	T1.イベント名称,
	T1.前提イベント番号,
	T2.イベント名称 AS 前提イベント名称
FROM
	イベント T1
JOIN
	イベント T2
ON
	T1.前提イベント番号 = T2.イベント番号;	

-- 69
SELECT
	T1.イベント番号,
	T1.イベント名称,
	T1.前提イベント番号,
	T2.イベント名称 AS 前提イベント名称,
	T1.後続イベント番号,
	T2.イベント名称 AS 後続イベント名称
FROM
	イベント T1
JOIN
	イベント T2
ON
	T1.前提イベント番号 = T2.イベント番号
AND
	T1.後続イベント番号 = T2.イベント番号;	

-- 70
SELECT
	T1.イベント番号,
	T1.イベント名称,
	COUNT(T1.前提イベント番号) AS 前提イベント数
FROM
	イベント T1
JOIN
	イベント T2
ON
	T1.前提イベント番号 = T2.イベント番号
GROUP BY
	T1.イベント番号;





