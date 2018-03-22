#!/bin/sh
set -e
rm -f /etc/nginx/auth_basic.conf
if [[ "${NGINX_LOGIN}" && "${NGINX_PASSWORD}" ]]; then
    htpasswd -bc /etc/nginx/auth.htpasswd "${NGINX_LOGIN}" "${NGINX_PASSWORD}"
    ln -s /etc/nginx/enabled_auth_basic.conf /etc/nginx/auth_basic.conf > /dev/null
else
    touch /etc/nginx/auth_basic.conf
fi
nginx -g "daemon off;" &

/usr/local/bin/tarantool /opt/tarantool/app.lua