# robocom-interface
## Tablet and data computer connection specification
### set connection
tablet send udp broadcast on port 45454 with the json:
```json
{
	"id": 0,
	"app": "c2p",
	"address": "192.168.0.5",
	"port": 1242
}
```
id - command id, always 0

app - constant string, always "c2p" for data computer and tablet connection

address, port - computer should send data on this ip and port

as a response, computer send json to tablet:
```json
{
	"id": 1,
	"address": "192.168.0.8",
	"port": 1242
}
```
id - command id, always 1

address, port - tablet should request data from this ip and port

### Main network interface: request camera image and objects from scene
tablet send http post request to htttp://address:port

post parameters:

id: 3 - always 3

response json:
```json
{
"id": 4,
"count": 3,
"objects": [{

		"id": 1,
		"x": 15,
		"y": 14,
		"width": 10,
		"height": 15,
		"typename": "скотч"
	},
	{
		"id": 2,
		"x": 12,
		"y": 14,
		"width": 10,
		"height": 15,
		"typename": "скотч"
	},
	{
		"id": 3,
		"x": 15,
		"y": 14,
		"width": 10,
		"height": 15,
		"typename": "скотч"
	}
],
"scene": "base64 png img string",
"eyex": 12,
"eyey": 15
}
```
