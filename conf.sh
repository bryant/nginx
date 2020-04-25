#!/bin/sh

# Static build with Debian nginx-light config.

OPTS="
--prefix=/usr/local

--conf-path=/etc/nginx/nginx.conf
--error-log-path=/var/log/nginx/error.log
--pid-path=/run
--lock-path=/run

--user=www-data
--group=www-data

--with-select_module
--with-poll_module
--with-threads
--with-file-aio
--with-http_ssl_module
--with-http_auth_request_module
--with-http_gzip_static_module
--with-http_v2_module
--with-http_realip_module
--with-http_slice_module
--with-http_stub_status_module
--with-http_dav_module

--with-cc=clang
--with-ld-opt=-static
"

THISDIR="$(dirname $(readlink -f "$0"))"

"$THISDIR"/auto/configure $OPTS --with-cc-opt="-static -O3"
