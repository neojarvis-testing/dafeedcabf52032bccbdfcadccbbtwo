#!/bin/bash
echo "Starting Hadoop daemons..."
# Step 1: Start NameNode (HDFS master)
hdfs --daemon start namenode
 
# Step 2: Start SecondaryNameNode (Checkpoint node)
hdfs --daemon start secondarynamenode
 
# Step 3: Start DataNode (HDFS worker)
hdfs --daemon start datanode
 
# Step 4: Start ResourceManager (YARN master)
yarn --daemon start resourcemanager
 
# Step 5: Start NodeManager (YARN worker)
yarn --daemon start nodemanager
echo "Hadoop started!"
 
# echo "Stoping Hadoop daemons..."
# # Step 1: Stop NodeManager (YARN worker)
# yarn --daemon stop nodemanager
 
# # Step 2: Stop ResourceManager (YARN master)
# yarn --daemon stop resourcemanager
 
# # Step 3: Stop DataNode (HDFS worker)
# hdfs --daemon stop datanode
 
# # Step 4: Stop SecondaryNameNode (Checkpoint node)
# hdfs --daemon stop secondarynamenode
 
# # Step 5: Stop NameNode (HDFS master)
# hdfs --daemon stop namenode
# echo "Hadoop stopped!"
 
# echo "🔍 Checking Hadoop..."
# hdfs dfs -mkdir -p /user/hueadmin
# hdfs dfs -chown hueadmin:hueadmin /user/hueadmin
# hdfs dfs -chmod 755 /user/hueadmin
 
# CLI Check
echo "[✔] Listing HDFS root directory:"
hdfs dfs -rm -r /wordcount-output || echo "❌ HDFS not responding"