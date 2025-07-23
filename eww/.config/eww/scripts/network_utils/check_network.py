def check_network (network_ssid, known_network_list):
    for i in known_network_list:
        if network_ssid == i:
            return True
    return False
