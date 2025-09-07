CREATE PROCEDURE GetUnpostedSessionsByLocation
    @LocationId INT
AS
BEGIN
    SELECT 
        CAST(s.StartDate AS DATE) AS SessionDate,
        s.SessionId,
        s.SessionName,
        s.EmployeeId,
        u.UserName AS EmployeeName,
        s.ManagerId,
        m.UserName AS ManagerName
    FROM InventorySession s
    INNER JOIN [User] u ON s.EmployeeId = u.UserId
    INNER JOIN [User] m ON s.ManagerId = m.UserId
    WHERE s.Status = 'Unposted'
      AND s.LocationId = @LocationId
      AND s.IsDeleted = 0
    ORDER BY SessionDate, s.SessionId;
END

GO

