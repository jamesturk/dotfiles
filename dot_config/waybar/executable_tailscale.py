#!/usr/bin/env python3
import subprocess
import json
import sys

def enabled():
    return "100." in subprocess.run(["tailscale", "status"], capture_output=True).stdout.decode()

def waybar():
    if enabled():
        try:
            selected = [n for n in subprocess.run(["tailscale", "exit-node", "list"], capture_output=True).stdout.decode().splitlines() if "selected" in n]
            pieces = "<br>".join(selected[0].strip().split())
            return {"text": "mullvad", "tooltip": pieces, "class": "tailscale-mullvad"}
        except IndexError:
            return {"text": "tailscale", "tooltip": "mullvad off", "class": "tailscale-only"}
    else:
        return {"text": "no vpn", "tooltip": "tailscale off", "class": "tailscale-off"}

def up():
    #subprocess.run("sudo tailscale up", shell=True)
    subprocess.run(["pkill", "-RTMIN+9" "waybar"])

def down():
    #subprocess.run("sudo tailscale down", shell=True)
    subprocess.run(["pkill", "-RTMIN+9" "waybar"])


if __name__ == "__main__":
    if len(sys.argv) == 2:
        {"waybar": waybar, "up": up, "down": down}[sys.argv[1]]()
    else:
        print(json.dumps(waybar()))
