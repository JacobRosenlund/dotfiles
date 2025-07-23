import sys, subprocess
from utils.clamp import clamp
from utils.eww_object_generator import *
from network_utils.check_network import check_network

"""VARIABLES"""
raw_network_list = subprocess.run("nmcli -t -f SSID,MODE,RATE,SIGNAL dev wifi | awk -F ':' '$1 != \"\" && !seen[$1]++ && $2 == \"Infra\"'", shell=True, capture_output=True).stdout.decode("utf-8").strip().split("\n")

network_list = []
for i in raw_network_list:
    network_list.append(i.split(":"))

known_network_list = subprocess.run("nmcli -t -f NAME con", shell=True, capture_output=True).stdout.decode("utf-8").strip().split("\n")

active_network = subprocess.run("nmcli -t -f NAME con show --active | awk 'NR == 1'", shell=True, capture_output=True).stdout.decode("utf-8").strip()

# Box Preamble
orientation = "v"
spacing = 4
class_name = "network-buttons"

"""PROGRAM"""
# 󰤯 󰤟 󰤢 󰤥 󰤨 
def create_network_buttons (network_list, number_of_buttons):
    buttons = ""
    
    network_list = sorted(network_list, key=lambda x: (x not in known_network_list, network_list.index(x)))
    network_list = sorted(network_list, key=lambda x: (active_network not in x, network_list.index(x)))

    for i in range(0,clamp(number_of_buttons,0,len(network_list))):
        class_name = "inactive_network"

        signal_strength = int(network_list[i][3])

        match signal_strength:
            case signal_strength if 0 <= signal_strength < 16:
                bar = "󰤯 "
            case signal_strength if 16 <= signal_strength < 32:
                bar = "󰤟 "
            case signal_strength if 32 <= signal_strength < 64:
                bar = "󰤢 "
            case signal_strength if 64 <= signal_strength < 80:
                bar = "󰤥 "
            case signal_strength if 80 <= signal_strength:
                bar = "󰤨 "
            case _:
                bar = signal_strength

        if network_list[i][0] == active_network:
            class_name = "active_network"
        if not check_network(network_list[i][0],known_network_list):
            class_name = "unknown_network"
        
        buttons = buttons+create_button(class_name,f"python ./scripts/network_utils/connect_known_networks.py \\\"{network_list[i][0]}\\\"",f"{network_list[i][0]} {bar}")
    return buttons

network_buttons = create_network_buttons(network_list, 4)

print(create_box(f":orientation \"{orientation}\" :spacing \"{spacing}\"",class_name, network_buttons, False))
