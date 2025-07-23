import sys, subprocess
from check_network import check_network

"""VARIABLES"""
input_network_ssid = sys.argv[1]

known_network_list = subprocess.run("nmcli -t -f NAME con", shell=True, capture_output=True).stdout.decode("utf-8").strip().split("\n")

active_network = subprocess.run("nmcli -t -f NAME con show --active | awk 'NR == 1'", shell=True, capture_output=True).stdout.decode("utf-8").strip()

def connect_to_network (network_ssid):
    if network_ssid == active_network:
        subprocess.run(f"nmcli con down \"{network_ssid}\"", shell=True)
    else:
        subprocess.run(f"nmcli dev wifi connect \"{network_ssid}\"", shell=True)

if not check_network(input_network_ssid, known_network_list):
    subprocess.run(f"notify-send \"Unknown Network: \\\"{input_network_ssid}\\\"\" \"Please connect via a different method.\" ", shell=True)
else:
    connect_to_network(input_network_ssid)
