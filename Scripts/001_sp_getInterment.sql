IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'getInterment')
                    AND type IN ( N'P', N'PC' ) ) 
DROP PROCEDURE getInterment

GO

CREATE PROCEDURE getInterment
AS
BEGIN
	
	SELECT * FROM Interment	i
	LEFT JOIN (
		SELECT d.location_id, c.clientname
		FROM Deceased d
		LEFT JOIN ClientInfo c ON d.client_id = c.id
	) x ON x.location_id = i.id 

END