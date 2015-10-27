INSERT INTO portal.[dbo].[Departments]
           ([DepartmentName]
            ,[oldDepartmentID])
     SELECT  [DepartmentName]
			 ,[DepartmentID]
  FROM [SNAP].[dbo].[departments];

  UPDATE 	wu
  SET		wu.DepartmentID = dp.DepartmentID
  FROM		portal.dbo.WebUser as wu
  			join portal.dbo.Departments as dp on dp.OldDepartmentID = wu.DepartmentID;
			