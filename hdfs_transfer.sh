#! /bin/bash/

hadoop fs -mkdir /proj_spark/
hadoop fs -mkdir /proj_spark/developper/
hadoop fs -mkdir /proj_spark/publisher/
hadoop fs -mkdir /proj_spark/plateform/
hadoop fs -mkdir /proj_spark/vgsales/

hadoop fs -put -f /proj_spark/developper.csv /proj_spark/developper
hadoop fs -put -f /proj_spark/publisher.csv /proj_spark/publisher
hadoop fs -put -f /proj_spark/plateform.csv /proj_spark/plateform
hadoop fs -put -f /proj_spark/vgsales.csv /proj_spark/vgsales