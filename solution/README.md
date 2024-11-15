# Solution for Running csvserver with Docker

### Step 1: Run the Container and Check if It's Running
```bash
docker run -d infracloudio/csvserver:latest
docker ps
docker logs <container_id>  # if container is not running

### Step 2: Create csv file 
```bash
nano gencsv.sh
chmod +x gencsv.sh
./gencsv.sh 2 8


### Step 3: Run the Container with inputFile Mounted
delete previous container
```bash
docker rm <containerid/name>

then run container with inputFile
```bash 
docker run -d --name csvserver -v "$(pwd)/inputFile:/csvserver/inputdata" infracloudio/csvserver:latest

### Step 4: Access the Container and Find the Listening Port
```bash 
docker exec -it csvserver /bin/sh
netstat -tuln | grep LISTEN

### Step 5: Run the Container with Port Mapping and Environment Variable
delete previous containeer
```bash 
docker rm csvserver
then run 
```bash 
docker run -d --name csvserver -p 9393:9300 -e CSVSERVER_BORDER=Orange -v "$(pwd)/inputFile:/csvserver/inputdata" infracloudio/csvserver:latest

### Step 6: Verify the Application
Access http://localhost:9393 in your browser.
 
