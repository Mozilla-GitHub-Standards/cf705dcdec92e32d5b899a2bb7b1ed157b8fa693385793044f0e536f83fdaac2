# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM alpine:3.6

RUN addgroup -g 10001 app; \
    adduser -D -u 10001 -G app -g app app; \
    mkdir /app; \
    chown app:app /app

RUN apk update; \
    apk add --no-cache python3; \
    pip3 install --no-cache flask

COPY entrypoint.sh /entrypoint.sh
COPY treestatus.py /app/treestatus.py
COPY version.json /app/version.json

USER app
ENTRYPOINT ["/entrypoint.sh"]
CMD []
