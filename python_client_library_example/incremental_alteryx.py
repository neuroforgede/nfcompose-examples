from ayx import Alteryx
import os
import pandas as pd
import requests
from compose_client.library.connection.client import RequestsRestClient, Credentials
from compose_client.library.service.fetcher import ComposeDataPointFetcher
import datetime
import json

# Function to read the last state from a JSON file
def read_last_state(file_path):
    if os.path.exists(file_path):
        with open(file_path, 'r') as file:
            return json.load(file).get('last_run_time')
    return None

# Function to write the current state to a JSON file
def write_current_state(file_path, current_time):
    with open(file_path, 'w') as file:
        json.dump({'last_run_time': current_time}, file)
        
# JSON file to store the state
state_file = 'C:/Users/Martin Braun/Desktop/state.json'

# Read the last run state
last_run_time = read_last_state(state_file)

print("last run time " + str(last_run_time))

# Time delta (10 minutes)
time_delta = datetime.timedelta(minutes=10)

# Convert the last run time from string to datetime object if it exists
if last_run_time:
    changes_since = datetime.datetime.fromisoformat(last_run_time) - time_delta
else:
    changes_since = None


credentials = Credentials(
    base_url="<someurl>",
    user="<someuser>",
    password="<somepassword>"
)

client = RequestsRestClient(
    credentials=credentials
)

fetcher = ComposeDataPointFetcher(
    client=client,
    data_series_external_id="my_dataseries",
    pagesize=10,
    # if you want to filter on facts, you can
    # put a dictionary with a mapping of fact name to value here
    # this only supports exact matches at the moment
    filter=None,
    # if you are interested into datapoints with a specific external_id
    # you can filter for them here
    external_ids=None,
    # if you are only interested into datapoints that were changed after this
    # point in time, put in a datetime object here
    changes_since=changes_since
)

output_list = []

for datapoint in fetcher.fetch():
    output_list.append(datapoint.to_dict())

if len(output_list) > 0:
    output_df = pd.DataFrame.from_records(output_list)
    Alteryx.write(output_df, 1)

# Update the state file with the current time
current_time = datetime.datetime.now().isoformat()
write_current_state(state_file, current_time)
