FROM microsoft/mssql-server-windows-developer

ENV exe "https://go.microsoft.com/fwlink/?linkid=840945"
ENV box "https://go.microsoft.com/fwlink/?linkid=840944"

RUN Invoke-WebRequest -Uri $env:box -OutFile SQL.box ;
RUN Invoke-WebRequest -Uri $env:exe -OutFile SQL.exe ;
RUN Start-Process -Wait -FilePath .\SQL.exe -ArgumentList /qs, /x:setup ;
RUN .\setup\setup.exe /q /ACTION=Install /INSTANCENAME=MSSQLSERVER /FEATURES=FullText /UPDATEENABLED=0 /SQLSVCACCOUNT='NT AUTHORITY\System' /SQLSYSADMINACCOUNTS='BUILTIN\ADMINISTRATORS' /TCPENABLED=1 /NPENABLED=0 /IACCEPTSQLSERVERLICENSETERMS ;