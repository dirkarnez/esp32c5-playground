docker run -t \
-e IDF_TARGET="esp32c5" \
-v "$PWD:/app/project" \
-w "/app/project" \
espressif/idf:latest /bin/bash -c 'git config --global --add safe.directory "*" && idf.py build'
