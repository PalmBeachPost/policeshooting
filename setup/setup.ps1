param(
$nuke = 0,
$server = 'nwpbpbp0dpc2334.cmg.int',
$user,
$password
)

$connectionStr = "server=$server;userid=$user;password=$password;database=policeshootings"
echo $connectionStr

[void][System.Reflection.Assembly]::LoadFrom("C:\Program Files\MySQL\MySQL Connector Net 6.9.5\Assemblies\v4.5\MySql.Data.dll")
$myconnection = New-Object MySql.Data.MySqlClient.MySqlConnection

$myconnection.ConnectionString = $connectionStr
$myconnection.Open()

$command = $myconnection.CreateCommand()

if ($nuke -eq 1)
{
    ./excel-to-csv -inputPath ../data/original -outputpath ../data/
    $command.CommandText = Get-Content "..\sql\Createtables.sql"
    $command.ExecuteNonQuery()
    $myconnection.Close()

    mysqlimport.exe --local -h $server -u $user -pENTERPASSWORDHERE --fields-terminated-by=',' --fields-optionally-enclosed-by='\"' --ignore-lines=1 policeshootings C:\git\policeshootings\data\rawincidents.csv
    mysqlimport.exe --local -h $server -u $user -pENTERPASSWORDHERE --fields-terminated-by=',' --fields-optionally-enclosed-by='\"' --ignore-lines=1 policeshootings C:\git\policeshootings\data\rawofficers.csv
    mysqlimport.exe --local -h $server -u $user -pENTERPASSWORDHERE --fields-terminated-by=',' --fields-optionally-enclosed-by='\"' --ignore-lines=1 policeshootings C:\git\policeshootings\data\rawsubjects.csv

    $myconnection = New-Object MySql.Data.MySqlClient.MySqlConnection

    $myconnection.ConnectionString = $connectionStr
    $myconnection.Open()

    $command = $myconnection.CreateCommand()
    $command.CommandText = Get-Content "..\sql\Normalize.sql"
    $command.ExecuteNonQuery()

}


Get-ChildItem ..\sql\SPROCS\*.sql | foreach {
 $command.CommandText = Get-Content $_
 $command.ExecuteNonQuery()
}
$myconnection.Close()