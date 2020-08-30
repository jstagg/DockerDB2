echo off

set DATA="//D/DockerDataMounts/DockerDB2"

docker volume create mydb2-data

REM docker network connect my-bridge-network gitlab

REM docker run -e LICENSE=accept --privileged --publish 9443:9443 -v %DATA%:/opt/ssfs/shared -it --name mqs ibmcom/mq

REM podman run -e LICENSE=accept --privileged -v <shared file system      directory path>:/opt/ssfs/shared -it --name <container name> <image>

docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INSTANCE=db2inst1 -e SAMPLEDB=true -e DB2INST1_PASSWORD=Hoser_0 -e DBNAME=testdb -v mydb2-data:/database ibmcom/db2

REM docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INSTANCE=db2inst1 -e SAMPLEDB=true -e DB2INST1_PASSWORD=Hoser_0 -e DBNAME=testdb -v %DATA%:/database ibmcom/db2