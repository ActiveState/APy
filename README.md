# APy

Reddit JSON => mysqlite db => training files => train chatbot => interact with chatbot

## Setup for docker

1. Git clone [APy repository](https://github.com/davetlewis-van/APy.git) into a new directory.
1. `wget http://downloads.activestate.com/ActivePython/releases/3.6.0.3600/ActivePython-3.6.0.3600-linux-x86_64-glibc-2.3.6-401834.tar.gz`
1. `docker build -t "python36:dockerfile" .`
1. `docker run -it python36:dockerfile`
1. There are sample training files, but you can copy the training files you want to use to the `new_data` folder. If so, you need to adjust the files listed at the top of `prepare_data.py` and dev_prefix and test_prefix in `settings.py`
1. Navigate to the `/code/nmt-chatbot/setup` folder and run `prepare_data.py`
1. Navigate to the `/code/nmt-chatbot/` folder and run `train.py`
1. To interact with the chatbot run `inference.py`

## Setup on cloud.google.com

* Public IP: https://35.230.32.103
* Jupyter notebook access: `sudo jupyter notebook -ip 0.0.0.0 --port 8888 --allow-root`
* TensorBoard config:
  1. Create firewall rule for port 6006
  2. `cd nmt-chatbot/model`
  3. `tensorboard --logdir=train_log/ --host 0.0.0.0 --port 6006`
  4. Browse to: http://35.230.32.103:6006/#projector&run=.

## Resources

* [PythonProgramming.net chatbot tutorials](https://pythonprogramming.net/chatbot-deep-learning-python-tensorflow/)
* [Google Dialogflow](https://dialgoflow.com)

## Datasets

### Reddit

[JSON](https://files.pushshift.io/reddit/comments/)
[Google BigQuery](https://bigquery.cloud.google.com/table/fh-bigquery:reddit_comments.2017_12?tab=schema)

### Stack Overflow

* Kaggle
  * [Questions.csv](https://www.kaggle.com/stackoverflow/pythonquestions/downloads/Questions.csv)
  * [Answers.csv](https://www.kaggle.com/stackoverflow/pythonquestions/downloads/Answers.csv)
  * [Tags.csv](https://www.kaggle.com/stackoverflow/pythonquestions/downloads/Tags.csv)

* [Google BigQuery](https://bigquery.cloud.google.com/dataset/fh-bigquery:stackoverflow)

## TODO

* Get access to a GPU
* Figure out how to access my programming-specific BigQuery tables from the Google Cloud VM instance.
* Figure out how to read in Stack Overflow Q&A
* Run docker container on Google Cloud VM
