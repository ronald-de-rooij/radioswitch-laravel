[1mdiff --git a/docker-compose.yml b/docker-compose.yml[m
[1mindex f3ae060..855626b 100644[m
[1m--- a/docker-compose.yml[m
[1m+++ b/docker-compose.yml[m
[36m@@ -48,6 +48,8 @@[m [mservices:[m
         container_name: radio-php-fpm[m
         build:[m
             context: "./docker/php-fpm"[m
[32m+[m[32m            args:[m
[32m+[m[32m                WWWGROUP: "${WWWGROUP}"[m
         volumes:[m
             - ${APP_CODE_PATH_HOST}:${APP_CODE_PATH_CONTAINER}${APP_CODE_CONTAINER_FLAG}[m
         networks:[m
[1mdiff --git a/docker/logs/nginx/laravel_access.log b/docker/logs/nginx/laravel_access.log[m
[1mindex 0762dec..49f80ba 100644[m
[1m--- a/docker/logs/nginx/laravel_access.log[m
[1m+++ b/docker/logs/nginx/laravel_access.log[m
[36m@@ -2,3 +2,128 @@[m
 172.22.0.1 - - [14/Feb/2024:09:53:21 +0000] "GET /api HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
 172.22.0.1 - - [14/Feb/2024:09:58:04 +0000] "GET /api/streams HTTP/1.1" 200 3403 "-" "PostmanRuntime/7.36.1"[m
 172.22.0.1 - - [14/Feb/2024:09:58:06 +0000] "GET /api/streams HTTP/1.1" 200 3403 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:08:11 +0000] "GET / HTTP/1.1" 500 1081264 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:09:39 +0000] "GET /api HTTP/1.1" 500 1037032 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m64.62.197.148 - - [14/Feb/2024:12:14:23 +0000] "GET / HTTP/1.1" 500 96118 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Safari/605.1.15"[m
[32m+[m[32m64.62.197.137 - - [14/Feb/2024:12:15:19 +0000] "GET /webui/ HTTP/1.1" 500 96118 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"[m
[32m+[m[32m64.62.197.141 - - [14/Feb/2024:12:17:04 +0000] "GET /geoserver/web/ HTTP/1.1" 500 96118 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Safari/605.1.15"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:19:55 +0000] "GET /api HTTP/1.1" 500 1150435 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m162.243.142.59 - - [14/Feb/2024:12:20:11 +0000] "MGLNDD_85.10.148.165_443" 400 150 "-" "-"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:22:25 +0000] "GET /api HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:28:16 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:28:19 +0000] "GET /api HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:29:22 +0000] "GET /api HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:29:27 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:31:19 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:31:28 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:31:31 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:31:35 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m83.97.73.245 - - [14/Feb/2024:12:35:56 +0000] "GET /?XDEBUG_SESSION_START=phpstorm HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"[m
[32m+[m[32m45.79.128.205 - - [14/Feb/2024:12:37:52 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:38:53 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:38:54 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:38:57 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m78.153.140.175 - - [14/Feb/2024:12:47:16 +0000] "GET /.env HTTP/1.1" 502 552 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36"[m
[32m+[m[32m78.153.140.175 - - [14/Feb/2024:12:47:17 +0000] "\x16\x03\x01\x01H\x01\x00\x01D\x03\x03\x9A\xEE\xAD\xA3\xD1c\x10\xA3?\xF0\xD6\x0C!\xE9\x1Cmt\xB1\x093*\xD6\xC73\x9F\x1E\x962\xF5>\x07\xA5 klE\xB7\xE2\xD5\x874\xCE\x17\x1D\xA7\x1D5\x13\xD7\xA0\x88_\xE9\xBD\x9Ds{\xB3B]\xAA\xF4\x07\xF4^\x00b\x13\x02\x13\x03\x13\x01\xC0,\xC00\xC0+\xC0/\xCC\xA9\xCC\xA8\x00\xA3\x00\x9F\x00\xA2\x00\x9E\xCC\xAA\xC0\xAF\xC0\xAD\xC0$\xC0(\xC0" 400 150 "-" "-"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:57:53 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:12:57:54 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m12.235.110.190 - - [14/Feb/2024:13:07:18 +0000] "GET / HTTP/1.0" 502 150 "-" "-"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:14:49 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:14:54 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:15:00 +0000] "GET /streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:16:04 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:16:20 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m146.19.24.28 - - [14/Feb/2024:13:17:16 +0000] "GET / HTTP/1.1" 502 150 "-" "-"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:18:44 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:18:49 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:19:00 +0000] "GET /api/streams HTTP/1.1" 502 150 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m193.26.115.89 - - [14/Feb/2024:13:20:07 +0000] "GET / HTTP/1.1" 502 150 "-" "Go-http-client/1.1"[m
[32m+[m[32m193.26.115.89 - - [14/Feb/2024:13:20:07 +0000] "GET //wp-includes/css/buttons.css HTTP/1.1" 502 150 "-" "Go-http-client/1.1"[m
[32m+[m[32m193.26.115.89 - - [14/Feb/2024:13:20:07 +0000] "GET // HTTP/1.1" 502 150 "-" "Go-http-client/1.1"[m
[32m+[m[32m193.26.115.89 - - [14/Feb/2024:13:20:07 +0000] "GET // HTTP/1.1" 502 150 "-" "Go-http-client/1.1"[m
[32m+[m[32m83.97.73.245 - - [14/Feb/2024:13:23:46 +0000] "GET /actuator/gateway/routes HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:38:32 +0000] "GET / HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:44:08 +0000] "GET /api HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:45:56 +0000] "GET /api HTTP/1.1" 502 552 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:51:47 +0000] "GET /api HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:13:51:57 +0000] "GET /api/streams HTTP/1.1" 500 15385 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:14:41:36 +0000] "GET /api HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m146.19.24.28 - - [14/Feb/2024:15:02:38 +0000] "GET / HTTP/1.1" 500 1194009 "-" "-"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:15:05:50 +0000] "GET / HTTP/1.1" 500 1194953 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:15:05:59 +0000] "GET /api HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m212.61.41.163 - - [14/Feb/2024:15:06:03 +0000] "GET /api/streams HTTP/1.1" 500 15382 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m185.150.26.251 - - [14/Feb/2024:15:11:55 +0000] "GET / HTTP/1.1" 500 158144 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:13 +0000] "GET / HTTP/1.1" 500 1194771 "-" "Mozilla/5.0 (Linux; Android 12; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Mobile Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:22 +0000] "GET /var/www/laravel/current/public/build/manifest.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Linux; Android 12; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Mobile Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:22 +0000] "GET /.ignition.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9a3pre) Gecko/20070330"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:22 +0000] "GET /app.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (OS/2; U; OS/2; en-US) AppleWebKit/533.3 (KHTML, like Gecko) QupZilla/1.3.1 Safari/533.3"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:22 +0000] "GET //github.com/highlightjs/highlight.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (iPad; CPU OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H321 Safari/600.1.4"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:22 +0000] "GET /manifest.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US) AppleWebKit/528.16 (KHTML, like Gecko, Safari/528.16) OmniWeb/v622.8.0.112941"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:27 +0000] "GET /var/www/laravel/current/public/build/manifest.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:27 +0000] "GET /.ignition.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Linux; U; Android 4.0.3; en-us; KFTT Build/IML74K) AppleWebKit/535.19 (KHTML, like Gecko) Silk/2.1 Mobile Safari/535.19 Silk-Accelerated=true"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:27 +0000] "GET /app.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2; rv:10.0.1) Gecko/20100101 Firefox/10.0.1"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:28 +0000] "GET //github.com/highlightjs/highlight.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Mobile Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:28 +0000] "GET /manifest.js HTTP/1.1" 404 2311 "-" "SEC-SGHX210/1.0 UP.Link/6.3.1.13.0"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:32 +0000] "GET /app.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 OPR/86.0.4363.50"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:32 +0000] "GET /var/www/laravel/current/public/build/manifest.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Linux; U; Android 1.6; es-es; SonyEricssonX10i Build/R1FA016) AppleWebKit/528.5  (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:33 +0000] "GET //github.com/highlightjs/highlight.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.141 YaBrowser/22.3.3.852 Yowser/2.5 Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:33 +0000] "GET /.ignition.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:33 +0000] "GET /manifest.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:36 +0000] "GET /var/www/laravel/current/public/build/manifest.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:36 +0000] "GET /manifest.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (X11; U; OpenBSD i386; en-US; rv:1.9.1) Gecko/20090702 Firefox/3.5"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:36 +0000] "GET //github.com/highlightjs/highlight.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:36 +0000] "GET /.ignition.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88  Safari/537.36"[m
[32m+[m[32m178.128.88.184 - - [14/Feb/2024:15:54:36 +0000] "GET /app.js HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.84 Safari/537.36"[m
[32m+[m[32m35.240.121.17 - - [14/Feb/2024:16:21:48 +0000] "GET / HTTP/1.1" 500 181899 "-" "python-requests/2.31.0"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:23:58 +0000] "GET / HTTP/1.1" 500 1196772 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:24:02 +0000] "GET /api HTTP/1.1" 404 2311 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:24:05 +0000] "GET /api/streams HTTP/1.1" 500 15408 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:24:26 +0000] "GET /api/streams HTTP/1.1" 200 21 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:29:52 +0000] "GET /api/streams HTTP/1.1" 500 15590 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:29:59 +0000] "GET /api/streams HTTP/1.1" 500 15590 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:30:31 +0000] "GET /api/streams HTTP/1.1" 200 21 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:30:33 +0000] "GET /api/streams HTTP/1.1" 200 21 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:30:39 +0000] "GET /api/streams HTTP/1.1" 200 21 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:31:09 +0000] "GET /api/streams HTTP/1.1" 200 21 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:34:07 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:07 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:20 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:29 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:29 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:30 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:31 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:31 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:32 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:32 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:33 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:37:36 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:38:06 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "PostmanRuntime/7.36.1"[m
[32m+[m[32m142.4.218.114 - - [14/Feb/2024:16:42:36 +0000] "GET / HTTP/1.1" 500 586752 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:39 +0000] "GET / HTTP/1.1" 500 1195242 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:42 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:44 +0000] "GET /api HTTP/1.1" 301 162 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:47 +0000] "GET /streams HTTP/1.1" 302 374 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:44:48 +0000] "GET /login HTTP/1.1" 500 1394111 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:47:41 +0000] "GET /login HTTP/1.1" 500 1393978 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:47:45 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"[m
[32m+[m[32m143.177.147.227 - - [14/Feb/2024:16:48:04 +0000] "GET /api/streams HTTP/1.1" 200 3249 "-" "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36"[m
[32m+[m[32m104.152.52.103 - - [14/Feb/2024:16:48:45 +0000] "GET / HTTP/1.0" 500 277581 "-" "masscan/1.3 (https://github.com/robertdavidgraham/masscan)"[m
[1mdiff --git a/docker/logs/nginx/laravel_error.log b/docker/logs/nginx/laravel_error.log[m
[1mindex e69de29..4a7130f 100644[m
[1m--- a/docker/logs/nginx/laravel_error.log[m
[1m+++ b/docker/logs/nginx/laravel_error.log[m
[36m@@ -0,0 +1,34 @@[m
[32m+[m[32m2024/02/14 12:28:16 [error] 13#13: *1 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 12:28:19 [error] 13#13: *1 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 12:29:22 [error] 13#13: *7 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "www.radioswit.ch"[m
[32m+[m[32m2024/02/14 12:29:27 [error] 13#13: *7 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "www.radioswit.ch"[m
[32m+[m[32m2024/02/14 12:31:19 [error] 13#13: *11 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 12:31:28 [error] 13#13: *13 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswitch.dev"[m
[32m+[m[32m2024/02/14 12:31:31 [error] 13#13: *13 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswitch.dev"[m
[32m+[m[32m2024/02/14 12:31:35 [error] 13#13: *13 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswitch.dev"[m
[32m+[m[32m2024/02/14 12:35:56 [error] 13#13: *17 connect() failed (111: Connection refused) while connecting to upstream, client: 83.97.73.245, server: radioswit.ch, request: "GET /?XDEBUG_SESSION_START=phpstorm HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165:80"[m
[32m+[m[32m2024/02/14 12:37:52 [error] 13#13: *19 connect() failed (111: Connection refused) while connecting to upstream, client: 45.79.128.205, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 12:38:53 [error] 13#13: *21 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "laravel.dev.local"[m
[32m+[m[32m2024/02/14 12:38:54 [error] 13#13: *21 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "laravel.dev.local"[m
[32m+[m[32m2024/02/14 12:38:57 [error] 13#13: *21 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "laravel.dev.local"[m
[32m+[m[32m2024/02/14 12:47:16 [error] 13#13: *26 connect() failed (111: Connection refused) while connecting to upstream, client: 78.153.140.175, server: radioswit.ch, request: "GET /.env HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 12:57:53 [error] 13#13: *28 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswitch.dev"[m
[32m+[m[32m2024/02/14 12:57:54 [error] 13#13: *28 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswitch.dev"[m
[32m+[m[32m2024/02/14 13:07:18 [error] 13#13: *31 connect() failed (111: Connection refused) while connecting to upstream, client: 12.235.110.190, server: radioswit.ch, request: "GET / HTTP/1.0", upstream: "fastcgi://172.18.0.5:9000", host: "localhost"[m
[32m+[m[32m2024/02/14 13:14:49 [error] 13#13: *33 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 13:14:54 [error] 13#13: *33 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 13:15:00 [error] 13#13: *33 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 13:16:04 [error] 13#13: *37 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 13:16:20 [error] 13#13: *39 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "laravel.dev.local"[m
[32m+[m[32m2024/02/14 13:17:16 [error] 13#13: *41 connect() failed (111: Connection refused) while connecting to upstream, client: 146.19.24.28, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165:80"[m
[32m+[m[32m2024/02/14 13:18:44 [error] 13#13: *43 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165:80"[m
[32m+[m[32m2024/02/14 13:18:49 [error] 13#13: *43 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 13:19:00 [error] 13#13: *43 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api/streams HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165"[m
[32m+[m[32m2024/02/14 13:20:07 [error] 13#13: *47 connect() failed (111: Connection refused) while connecting to upstream, client: 193.26.115.89, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 13:20:07 [error] 13#13: *47 connect() failed (111: Connection refused) while connecting to upstream, client: 193.26.115.89, server: radioswit.ch, request: "GET //wp-includes/css/buttons.css HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 13:20:07 [error] 13#13: *47 connect() failed (111: Connection refused) while connecting to upstream, client: 193.26.115.89, server: radioswit.ch, request: "GET // HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 13:20:07 [error] 13#13: *47 connect() failed (111: Connection refused) while connecting to upstream, client: 193.26.115.89, server: radioswit.ch, request: "GET // HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 13:23:46 [error] 13#13: *52 connect() failed (111: Connection refused) while connecting to upstream, client: 83.97.73.245, server: radioswit.ch, request: "GET /actuator/gateway/routes HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "85.10.148.165:80"[m
[32m+[m[32m2024/02/14 13:38:32 [error] 13#13: *54 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET / HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 13:44:08 [error] 13#13: *57 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "radioswit.ch"[m
[32m+[m[32m2024/02/14 13:45:56 [error] 13#13: *60 connect() failed (111: Connection refused) while connecting to upstream, client: 212.61.41.163, server: radioswit.ch, request: "GET /api HTTP/1.1", upstream: "fastcgi://172.18.0.5:9000", host: "www.radioswit.ch"[m
[1mdiff --git a/docker/nginx/sites/laravel.conf b/docker/nginx/sites/laravel.conf[m
[1mindex f95dbab..e74807b 100644[m
[1m--- a/docker/nginx/sites/laravel.conf[m
[1m+++ b/docker/nginx/sites/laravel.conf[m
[36m@@ -14,7 +14,7 @@[m [mserver {[m
     ssl_certificate /etc/nginx/ssl/default.crt;[m
     ssl_certificate_key /etc/nginx/ssl/default.key;[m
 [m
[31m-    server_name radioswitch.dev;[m
[32m+[m[32m    server_name api.radioswit.ch;[m
     root /var/www/laravel/current/public;[m
     index index.php index.html index.htm;[m
 [m
[1mdiff --git a/storage/app/.gitignore b/storage/app/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/app/public/.gitignore b/storage/app/public/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/framework/.gitignore b/storage/framework/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/framework/cache/.gitignore b/storage/framework/cache/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/framework/cache/data/.gitignore b/storage/framework/cache/data/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/framework/sessions/.gitignore b/storage/framework/sessions/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/framework/testing/.gitignore b/storage/framework/testing/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/framework/views/.gitignore b/storage/framework/views/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
[1mdiff --git a/storage/logs/.gitignore b/storage/logs/.gitignore[m
[1mold mode 100644[m
[1mnew mode 100755[m
