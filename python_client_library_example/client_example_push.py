import os
from compose_client.library.connection.client import RequestsRestClient, Credentials
from compose_client.library.models.definition.datapoint import DataPoint
from compose_client.library.service.pusher import DataPointPusher

credentials = Credentials(
    base_url=os.environ['NF_COMPOSE_URL'],
    user=os.environ['NF_COMPOSE_USER'],
    password=os.environ['NF_COMPOSE_PASSWORD']
)

client = RequestsRestClient(
    credentials=credentials
)

pusher = DataPointPusher(
    client=client,
    batch_size=10
)

# this upserts
# this means that it overwrites any datapoints that already exist
pusher.push(
    data=[DataPoint(
        external_id="some_external_id",
        payload={
            "some_file": "./files/hello_world.txt",
            "some_optional_float": 1.0,
            "some_float": 2.0
        }
    )],
    data_series_external_id="my_demo_dataseries"
)
