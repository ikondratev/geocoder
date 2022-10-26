# Geocoder
```sh
Goecoding locations
```
## Dependencies:
```sh
ruby '2.7.2'
```
## Requests:
```sh
#ping request:
curl --request GET \
  --url http://localhost:3003/geocoder/ping
```
```sh
#ping response:
PONG
```
##
```sh
#encode request:
curl --request POST \
  --url http://localhost:3005/geocoder/v1/ \
  --header 'Content-Type: application/json' \
  --data '{
	"city": "New York"
}'
```
```sh
#login response:
{ "meta": { "encode": { "lat": "44.878414", "lon": "39.190289" } } }
```