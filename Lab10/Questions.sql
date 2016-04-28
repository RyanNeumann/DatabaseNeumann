--QUESTION 1 -- Function PreReqsFor(courseNum) - Returns the immediate prerequisites for the passed-in course number.
CREATE OR REPLACE FUNCTION PreReqsFor(INT, REFCURSOR) RETURNS REFCURSOR AS 
$$
DECLARE
   cNum INT := $1;
   resultset REFCURSOR := $2;
BEGIN
    OPEN resultset FOR 
    SELECT courseNum, preReqNum
    FROM Prerequisites
    WHERE courseNum = cNum
    RETURN resultset;
END;
$$ 
LANGUAGE plpgsql;

--QUESTION 2 -- Function IsPreReqFor(courseNum) - Returns the courses for which the passed-in course number is an immediate pre-requisite.
CREATE OR REPLACE FUNCTION IsPreReqFor(INT, REFCURSOR) RETURNS REFCURSOR AS 
$$
DECLARE
   cNum INT := $1;
   resultset REFCURSOR := $2;
BEGIN
    OPEN resultset FOR 
    SELECT courseNum, preReqNum
    FROM Prerequisites
    WHERE preReqNum = cNum;
    RETURN resultset;
END;
$$ 
LANGUAGE plpgsql;