# NF Compose Examples

Examples for NF Compose.

# Baseline Setup

To start off, clone the original repository:

```bash
git clone https://github.com/neuroforgede/nfcompose
```

Switch to the `deploy` folder and setup the playground:

```bash
cd deploy/local
bash setup_playground.sh
```

You can now access the playground in your browser using the credentials `admin`/`admin`:

![grafik](https://github.com/neuroforgede/nfcompose/assets/719760/d4af576b-bf94-446c-8432-bb35f20aac02)

You can now continue to try out the examples. Every example will be set up in a separate tenant so there is no
need to setup a completely new NF Compose instance for every example.

# Relevant Notes

Since NF Compose is a multi tenant system, all identifiers use uuids by default.
This also means that the DataSeries REST APIs default to uuids for their URL.

To make it possible to give users of the API a predictable URL without having
to discover them from the list of dataseries first, Dataseries and everything 
below are also accessible via external_ids.

Examples:

URL to a dataseries:
```
http://localhost:8080/api/dataseries/by-external-id/dataseries/<dataseries-external-id>/
```

URL to a float fact under a dataseries:
```
http://localhost:8080/api/dataseries/by-external-id/dataseries/<dataseries-external-id>/floatfact/<floatfact-external-id>/
```

URL to the datapoint endpoint of a dataseries:
```
http://localhost:8080/api/dataseries/by-external-id/dataseries/<dataseries-external-id>/datapoint/
```

Url to a specific datapoint of a dataseries:
```
http://localhost:8080/api/dataseries/by-external-id/dataseries/<dataseries-external-id>/datapoint/<datapoint-external-id>
```

# License

NF Compose is released under MPL 2.0. NeuroForge is a registered trademark of NeuroForge GmbH & Co. KG.
