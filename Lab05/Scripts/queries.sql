-- Find the pid of parts with cost lower than 10
SELECT P.pid
FROM parts P, catalog C
WHERE P.pid = C.pid AND C.cost < 10;

-- Find the name of parts with cost lower than 10
SELECT P.pname
FROM parts P, catalog C
WHERE P.pid = C.pid AND C.cost < 10;

-- Find the address of the suppliers who supply "Fire Hydrant Cap"
SELECT S.address
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.pname = 'Fire Hydrant Cap';

-- Find the name of suppliers who supply green parts
SELECT S.sname
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'green';

-- For each supplier, list the supplier's name along with all parts' name that it supply
SELECT S.sname, P.pname
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid;