#!/bin/bash
echo "🔍 Checking Hive..."
echo $HIVE_HOME
schematool -initSchema -dbType mysql
hive --service metastore &
nohup $HIVE_HOME/bin/hiveserver2 > /tmp/hiveserver2.log 2>&1 &

# CLI Check
echo "[✔] Running Hive shell test:"
echo "SHOW DATABASES;" | hive || echo "❌ Hive shell failed"

# Web UI: Hive does not have a default standalone UI.
echo "[ℹ️] Hive does not provide a standalone Web UI. Use Hue for visual queries."
