from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("SalesETL") \
    .enableHiveSupport() \
    .getOrCreate()

df = spark.read.option("header", "false").csv("hdfs:///user/hueadmin/")

df = df.withColumnRenamed("_c0", "transaction_id") \
       .withColumnRenamed("_c1", "customer_id") \
       .withColumnRenamed("_c2", "amount") \
       .withColumnRenamed("_c3", "txn_date")

df_filtered = df.filter(df.amount > 1000)

df_filtered.write.mode("overwrite").saveAsTable("sales_filtered")

spark.stop()