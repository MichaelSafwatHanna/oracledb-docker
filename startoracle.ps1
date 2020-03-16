$directory = Get-Location
$containerExist = docker ps -a | grep oracle
$containerRunning = docker ps | grep oracle

    if($containerExist)
    {
        if(-not $containerRunning)
        {
            docker start oracle
        }
    }
    else
    {
        docker run -d -p 1521:1521 --name oracle -v $directory/OracleDBData:/ORCL store/oracle/database-enterprise:12.2.0.1-slim
    }
    
    Write-Host "Starting Oracle." -NoNewLine -foregroundcolor green
    while($health -ne "`"healthy`"")
    {
        sleep 4;
        Write-Host "."  -foregroundcolor green -NoNewLine
        $health = docker inspect --format='{{json .State.Health.Status}}' oracle
    }
    echo("`a")

    if($containerExist)
    {
        docker exec -it oracle bash -c "source /home/oracle/.bashrc; sqlplus zerobased@ORCLCDB"
    }
    else
    {
        docker exec -it oracle bash -c "source /home/oracle/.bashrc; sqlplus sys as sysdba"
    }
