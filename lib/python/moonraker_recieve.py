import moonraker_api
import asyncio
from moonraker_communicate import printer
class APIConnector(MoonrakerListener):
    def __init__():
        self.running = False
        self.client = MoonrakerClient(
            self,
            printer,
            7125,
        )

    async def start(self) -> None:
        """Start the websocket connection."""
        self.running = True
        return await self.client.connect()
    
    async def stop(self) -> None:
        """Stop the websocket connection."""
        self.running = False
        await self.client.disconnect()