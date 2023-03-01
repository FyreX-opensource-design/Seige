import socket
import moonrakerpy as moonpy
#import moonraker_api
#from moonraker_recieve import APIConnector
#import asyncio

hostname=socket.gethostname()   
IPAddr=socket.gethostbyname(hostname)
printer = moonpy.MoonrakerPrinter(str(IPAddr))

def gcode_send(command):
    printer.send_gcode(command)

def gcode_recv(data):
    result = printer.query_status(data)
    return result

#async def gcode_recv(data):
#    APIConnector.start()
#    response = await api_connector.client.request(data)
#    APIConnector.stop()
#    return response

