SELECT
    DISTINCT BST1.N,
    CASE WHEN BST1.P IS NULL THEN 'Root'
         WHEN BST2.N IS NULL THEN 'Leaf'
         ELSE 'Inner' END
FROM BST AS BST1
LEFT JOIN BST AS BST2
ON BST1.N = BST2.P
ORDER BY BST1.N;