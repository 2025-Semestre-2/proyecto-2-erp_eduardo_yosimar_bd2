

RESTORE DATABASE [WideWorldImporters]
FROM DISK = '/var/opt/mssql/backups/WideWorldImporters-Full.bak'
WITH MOVE 'WideWorldImporters-Full' TO '/var/opt/mssql/data/WideWorldImporters_Data.mdf',
     MOVE 'WideWorldImporters-Full_log' TO '/var/opt/mssql/data/WideWorldImporters_log.ldf',
     FILE = 1, NOUNLOAD, STATS = 5;



	RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/backups/AdventureWorks2022.bak';



RESTORE DATABASE [WideWorldImporters]
FROM DISK = '/var/opt/mssql/backups/WideWorldImporters-Full.bak'
WITH 
  MOVE 'WWI_Primary' TO '/var/opt/mssql/data/WideWorldImporters.mdf',
  MOVE 'WWI_UserData' TO '/var/opt/mssql/data/WideWorldImporters_UserData.ndf',
  MOVE 'WWI_Log' TO '/var/opt/mssql/data/WideWorldImporters_log.ldf',
  MOVE 'WWI_InMemory_Data_1' TO '/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1',
  FILE = 1, NOUNLOAD, STATS = 5;
