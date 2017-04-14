import i3ipc
import subprocess
import time

i3 = i3ipc.Connection()

def on_close(i3, e):
    if e.container.name == "XWinMosaic":
        time.sleep(0.007)
        i3.command("fullscreen enable")
        exit()

i3.on('window::close', on_close)

subprocess.run(["xwinmosaic", "-S"])

i3.main()
