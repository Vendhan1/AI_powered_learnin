import asyncio
import websockets
import json
from roadmap import roadmap 
from yt_summary import yt_text, get_youtube_links
from scrapper import scrape_text, get_top_urls

connected_clients = set()

async def handle_connection(websocket):
    print("Client connected")
    connected_clients.add(websocket)

    try:
        async for message in websocket:
            print(f"Received: {message}")
            try:
                data = json.loads(message)

                # Decide data type
                if "Search_Type" in data:
                    search_json = data
                    user_json = None
                else:
                    user_json = data
                    search_json = None

                if user_json is not None and search_json is not None:
                    # Generate lesson data
                    json_lesson = roadmap(user_json=user_json, search_json=search_json)

                    course_data = {
                        "name": json_lesson['Course_name'],
                        "topics": []
                    }

                    for topic in json_lesson["topics"]:
                        topic_data = {
                            "name": topic['name'],
                            "subtopics": []
                        }

                        for subtopic in topic["subtopics"]:
                            content = []

                            # Get web content
                            top_urls = get_top_urls(subtopic)
                            for url in top_urls:
                                text = scrape_text(url)
                                if text:
                                    content.append(text)

                            # Get YouTube content
                            youtube_links = get_youtube_links(subtopic)
                            for link in youtube_links:
                                yt_summary = yt_text(link)
                                if yt_summary:
                                    content.append(yt_summary)

                            subtopic_data = {
                                "name": subtopic,
                                "content": content
                            }

                            topic_data["subtopics"].append(subtopic_data)

                        course_data["topics"].append(topic_data)

                    # Send lesson data back to the requesting client only
                    await websocket.send(json.dumps(course_data))
                    print("Response sent to client.")

                else:
                    # Acknowledge receipt if only partial data is sent
                    await websocket.send(json.dumps({"status": "Data received, waiting for full request"}))

            except Exception as e:
                print(f"Processing Error: {e}")
                await websocket.send(json.dumps({"error": str(e)}))

    except websockets.exceptions.ConnectionClosed:
        print("Client disconnected")
    finally:
        connected_clients.remove(websocket)

async def start_server():
    async with websockets.serve(handle_connection, "0.0.0.0", 8765):
        print("WebSocket server is running on ws://0.0.0.0:8765")
        await asyncio.Future()  # Run forever














_______________________________________________________________________________



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
