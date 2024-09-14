docker run --name=seraphina -d alpine:3.14 sleep infinity

docker exec seraphina /bin/sh -c "echo \"$(cat /proc/sys/kernel/random/uuid)\" >> /home/potions.txt"

# Write your code here
# Step 3: Commit the current state of the seraphina container to an image
docker commit seraphina seraphina_base_image

# Step 4: Create a shared Docker volume for synchronization between containers
docker volume create twilight_data

# Step 5: Stop and remove the seraphina container to recreate it with the shared volume
docker stop seraphina
docker rm seraphina

# Step 6: Recreate the seraphina container using the new image and the shared volume
docker run --name=seraphina -d -v twilight_data:/twilight seraphina_base_image sleep infinity

# Step 7: Create the isabella container from the seraphina_base_image and use the same volume for /twilight
docker run --name=isabella -d -v twilight_data:/twilight seraphina_base_image sleep infinity

# Step 8: Verify that both containers are running
docker ps
