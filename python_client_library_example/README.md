# rest-api

This sample shows how to setup a simple REST API

# Setup

1. run `bash setup_venv.sh`
2. run `bash dev_load_main.sh`
3. admire your created rest dataseries with their own dataseries
4. Login to your NF Compose instance (e.g. http://localhost:8000/api) with user `python_client_library_example` and password `password` (if you haven't changed these)
5. Admire rest api at http://localhost:8000/api/dataseries/by-external-id/dataseries/my_demo_rest_api/datapoint/ (note the by-external-id)

# Next steps

1. Use the REST API to modify your dataseries definitions
2. dump the dataseries definitions with `bash dump_dataseries.sh`.
3. Look how `./compose/dataseries.json` reflects the changes you made in the browsable API.
4. Modify `./compose/dataseries.json` with some changes
5. run `bash dev_load_main.sh`
6. See how the dataseries definitions have changed accordingly.

