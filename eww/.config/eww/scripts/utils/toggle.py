import sys, subprocess

eww_window_list = subprocess.run("eww active-windows", shell=True, capture_output=True).stdout.decode("utf-8").strip().split("\n")

input_window_name = sys.argv[1]

for eww_window in eww_window_list:
    if input_window_name in eww_window:
        subprocess.run(f"eww close {input_window_name}", shell=True)
    else:
        subprocess.run(f"eww open {input_window_name}", shell=True)
