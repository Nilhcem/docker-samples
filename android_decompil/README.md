# Create

```bash
docker build -t nilhcem/android_decompile .
```

# Start

```bash
docker run --rm --volume /path/to/apks:/apks nilhcem/android_decompile
sudo chown -R name:group /path/to/apks
```
