SELECT IF(G.GRADE>=8, S.NAME, NULL),G.GRADE, S.MARKS
FROM GRADES G, STUDENTS S
WHERE S.MARKS BETWEEN G.MIN_MARK AND G.MAX_MARK
ORDER BY G.GRADE DESC, S.NAME;