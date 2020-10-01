-- 53
SELECT
	名称 AS なまえ,
	HP AS 現在のHP,
	ROUND((HP/SUM(HP)) * 100, 1) AS パーティーでの割合
FROM
	パーティー
WHERE
	HP = (
			SELECT
				HP
			FROM
				パーティー
			WHERE
				職業コード = '01'
		 )
GROUP BY
	名称,
	HP


-- 54
UPDATE
	パーティー
SET
	MP = MP +  (
			SELECT
				ROUND(SUM(MP) * 0.1, 0)
			FROM
				パーティー
			WHERE
				職業コード <> '20'
		)
WHERE
	職業コード = '20';

-- 55
SELECT
	イベント番号,
	クリア結果
FROM
	経験イベント
WHERE
	イベント番号 IN (
			SELECT
				イベント番号
			FROM
				イベント
			WHERE
				タイプ IN ('1', '3')
			)
AND
	クリア区分 = '1';

-- 56
SELECT
	名称 AS キャラクター名,
	MP
FROM
	パーティー
WHERE
	MP = ALL
		(
			SELECT
				MAX(MP)
			FROM
				パーティー
		);

-- 57
SELECT
	イベント番号,
	イベント名称
FROM
	イベント
WHERE
	イベント番号 NOT IN 
				(
					SELECT
						イベント番号
					FROM
						経験イベント
				)
ORDER BY
	イベント番号 ASC;

-- 58
SELECT
	COUNT(SUB.イベント番号) AS 着手していないイベント数
FROM (
	SELECT
		イベント番号
	FROM
		イベント
	EXCEPT
	SELECT
		イベント番号
	FROM
		経験イベント
	)AS SUB;

-- 59
SELECT
	イベント番号,
	イベント名称
FROM
	イベント
WHERE
	イベント番号 < ANY (
				SELECT
					イベント番号
				FROM
					経験イベント
				WHERE
					ルート番号 = 5
			    );

-- 60
SELECT DISTINCT
	イベント番号,
	イベント名称,
	前提イベント番号
FROM 
	イベント
WHERE
	前提イベント番号 IN (
				SELECT
					イベント番号
				FROM
					経験イベント
				WHERE
					クリア区分 = '1'
				);
					
-- 61
UPDATE
	経験イベント
SET 	
	クリア区分 = 1,
	クリア結果 = 'B'
WHERE
	イベント番号 = 9;

INSERT INTO
	経験イベント
		(
			イベント番号,
			クリア区分,
			クリア結果,
			ルート番号
		)
VALUES
	(
	(
	SELECT
		後続イベント番号
	FROM
		イベント
	WHERE
		イベント番号 = 9
	),
	1,
	NULL,
	(
	SELECT
		MAX(ルート番号) + 1
	FROM
		経験イベント
	)
	);	