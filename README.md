# Connect to Oracle database Docker Container

## Windows Environment

1. Install [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop).
2. Run **Docker Desktop**

## Start Oracle database container

### 1. Clone Repo

Clone or Download this repo to your local machine

```bash
git clone github.com/MichaelSafwatHanna/oracledb-docker
```

### 2. Pull Oracle Database image

1. Login to your Docker account
2. Pull [Oracle Database Enterprise Edition image](https://hub.docker.com/_/oracle-database-enterprise-edition)

```bash
docker login
docker pull store/oracle/database-enterprise:12.2.0.1-slim
```

### 3. Run Start script

> _Must run on windows powershell terminal._

1. Choose the cloned/downloaded repo directory
2. Run powershell script [`startoracle.ps1`](./startoracle.ps1)
3. Enter `zerobased` user password  _**default: `zerobased`**_

```bash
.\startoracle.ps1
```

## Running for first time

1. Enter sys user password _**default: `Oradoc_db1`**_
2. Run the following sql script to create a new user

```sql
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
CREATE USER zerobased identified BY zerobased;
GRANT ALL PRIVILEGES TO zerobased;
CONNECT zerobased/zerobased@ORCLCDB
```
