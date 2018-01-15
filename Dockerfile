# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM alpine:3.6

# dependencies
RUN apk update; \
    apk add --no-cache python2; \
    apk add --no-cache --virtual build-dependencies py-pip; \
    pip install --no-cache flask; \
    apk del build-dependencies; \
    mkdir /app

COPY treestatus.py /app/treestatus.py
COPY version.json /app/version.json
ENTRYPOINT ["/app/treestatus.py"]
