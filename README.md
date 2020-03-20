# Global News Analysis

Fetches top 5 articles from theguardian.com/international and analyzes their sentiment and magnitude in [Google Natural Language API](https://cloud.google.com/natural-language)
- Score of sentiment = Score of the sentiment ranges from -1.0 (very negative) to 1.0 (very positive)
- Score of magnitude = Magnitude is the strenght of sentiment regardless of score, ranges from 0 to infinity

# Requirements:

Account in google cloud services
- [Instructions](https://cloud.google.com/natural-language/docs/setup) follow until installing and initializing the cloud sdk.

JSON-file that contains your key from above instructions

# Instructions of use:

Pull the repo

```
docker build -t robokontti .
```

```
docker run \
--rm \
--shm-size 2g \
-v $(pwd)/data:/opt/robotframework/reports:Z \
-v $(pwd)/tasks:/opt/robotframework/tests:Z \
-v PATH TO JSON-KEY:/tmp/keys/FILE_NAME.json:ro \
-e GOOGLE_APPLICATION_CREDENTIALS=/tmp/keys/FILE_NAME.json robokontti
```

You will find the results in data/log.html


