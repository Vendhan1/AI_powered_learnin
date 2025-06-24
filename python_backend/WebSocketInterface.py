import asyncio
import websockets
import json


user_json = None
search_json = None

connected_clients = set()

async def handle_connection(websocket):
    global user_json, search_json
    print("Client connected")
    connected_clients.add(websocket)
    #await websocket.send(f"Server received: ")
    try:
        async for message in websocket:
            #print(f"Received from Flutter: {message}")
            data=json.loads(message)
            if "Search_Type" in data:
                search_json=data
            else:
                user_json=data
            #await websocket.send(f"{'Server message!!'}")
    except websockets.exceptions.ConnectionClosed:
        print("Client disconnected")
    finally:
        connected_clients.remove(websocket)

async def start_server():
    async with websockets.serve(handle_connection, "0.0.0.0", 8765):
        print("WebSocket server is running on ws://0.0.0.0:8765")
        await asyncio.Future()  # run forever

# Use asyncio.run() for Python 3.12 compatibility
#asyncio.run(main())
async def main():
    server_task=asyncio.create_task(start_server())
    
   # while True:
    #    if search_json is not None:
     #       print(search_json)
      #  if user_json is not None:
       #     print(user_json)
        #await asyncio.sleep(1)

if __name__ == "__main__":
    asyncio.run(main())
