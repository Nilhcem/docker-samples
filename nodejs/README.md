# Create

```bash
docker build -t nilhcem/nodejs .
```

# Start

```bash
docker run --volume=`pwd`/path/to/nodejs/server:/srv -p 8990:8990 -d nilhcem/nodejs
```
