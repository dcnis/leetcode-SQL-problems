/*
608. Tree Node
https://leetcode.com/problems/tree-node/
*/

select id,
CASE
 	WHEN p_id IS NULL THEN "Root"
    WHEN id IN (SELECT p_id FROM Tree) THEN "Inner"
    ELSE "Leaf"
	END
    AS type
from Tree;