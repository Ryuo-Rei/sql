-- 45
SELECT
	MAX(HP) AS HPの最大値,
	MIN(HP) AS HPの最小値,
	MAX(MP) AS MPの最大値,
	MIN(MP) AS MPの最小値,
	AVG(HP) AS HPの平均値,
	AVG(MP) AS MPの平均値
FROM
	パーティー;

-- 46
SELECT
	COUNT(イベント番号),
	CASE
	WHEN タイプ = '1' THEN '強制'
	WHEN タイプ = '2' THEN 'フリー'
	WHEN タイプ = '3' THEN '特殊'
	END AS タイプ
FROM
	イベント
GROUP BY
	タイプ;

-- 47
SELECT
	COUNT(イベント番号) AS クリアイベント数
FROM
	経験イベント
WHERE
	クリア区分 = '1'
GROUP BY
	クリア結果;

-- 48
SELECT
	CASE
	WHEN SUM(MP) < 500 THEN '敵は見とれている！'
	WHEN SUM(MP) BETWEEN 500 AND 999 THEN '敵は呆然としている！'
	WHEN SUM(MP) >= 1000 THEN '敵はひれ伏している！'
	END AS 敵の行動
FROM
	パーティー;

-- 49
SELECT
	CASE
	WHEN クリア区分 = '0' THEN 'クリアした'
	WHEN クリア区分 = '1' THEN '参加したがクリアしていない'
	END AS 区分,
	COUNT(イベント番号) AS イベント数
FROM
	経験イベント
GROUP BY
	クリア区分;

-- 50
SELECT
	CASE
	WHEN LEFT(職業コード, 1) = '0' THEN '勇者'
	WHEN LEFT(職業コード, 1) = '1' THEN '戦士'
	WHEN LEFT(職業コード, 1) = '2' THEN '魔法使い'
	END AS 職業タイプ,
	MAX(HP) AS HP最大値,
	MIN(HP) AS HP最小値,
	MAX(MP) AS MP最大値,
	MIN(MP) AS MP最小値,
	AVG(HP) AS HP平均値,
	AVG(MP) AS MP平均値
FROM
	パーティー
GROUP BY
	1;
 
-- 51
SELECT
	LEFT(ID, 1) AS IDによる分類,
	AVG(HP) AS HPの平均,
	AVG(MP) AS MPの平均
FROM
	パーティー
GROUP BY
	1
HAVING
	AVG(HP) > 100;

-- 52
SELECT
	SUM(T2.キャラ事に開けることができる扉の数) AS パーティーで開けることができる扉の合計数
FROM (
	SELECT
		CASE
		WHEN HP < 100 THEN 1
		WHEN HP BETWEEN 100 AND 149 THEN 2
		WHEN HP BETWEEN 150 AND 199 THEN 3
		WHEN HP >= 200 THEN 5
		END AS キャラ事に開けることができる扉の数
	FROM
		パーティー
	GROUP BY
		HP
	)
AS T2;

