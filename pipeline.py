from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG("sales_pipeline", start_date=datetime(2024, 1, 1), schedule_interval="@daily", catchup=False) as dag:

    ingest = BashOperator(
        task_id="upload_to_hdfs",
        bash_command="hdfs dfs -put -f /user/hueadmin/sales.csv /user/hue/sales/"
    )

    spark_etl = BashOperator(
        task_id="spark_etl",
        bash_command="spark-submit --master yarn --deploy-mode client /home/coder/project/workspace/etl.py"
    )

    ingest >> spark_etl
