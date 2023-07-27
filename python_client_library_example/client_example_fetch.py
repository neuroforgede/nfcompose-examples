import os
import requests
from compose_client.library.connection.client import RequestsRestClient, Credentials
from compose_client.library.service.fetcher import ComposeDataPointFetcher

credentials = Credentials(
    base_url=os.environ['NF_COMPOSE_URL'],
    user=os.environ['NF_COMPOSE_USER'],
    password=os.environ['NF_COMPOSE_PASSWORD']
)

client = RequestsRestClient(
    credentials=credentials
)

fetcher = ComposeDataPointFetcher(
    client=client,
    data_series_external_id="my_demo_dataseries",
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
    changes_since=None
)

count = 0
for datapoint in fetcher.fetch():
    if 'some_file' in datapoint.payload:
        # if you want to handle a file/image, you have to first
        # download it
        print(f"Will download file from {datapoint.payload['some_file'].url}")
        download_file_response = requests.get(datapoint.payload['some_file'].url)
        print(f"Content-Type of File: {download_file_response.headers['Content-Type']}")
        # then you can handle the file depending on the datatype
        print(f"Content of File: {download_file_response.content.decode('utf-8')}")
    print()
    print(datapoint)
    print()
    count += 1

print(f"processed {count} datapoints")

