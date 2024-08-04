import subprocess
import time

VIP_SERVER_LINK = "https://www.roblox.com/games/8737899170/12h-Pet-Simulator-99?privateServerLinkCode=89181067318994850225480277905449"

subprocess.Popen(f'am start -a android.intent.action.VIEW -d "{VIP_SERVER_LINK}" --user 0 -p com.roblox.clienu', shell=True)
time.sleep(10)
subprocess.Popen(f'am start -a android.intent.action.VIEW -d "{VIP_SERVER_LINK}" --user 0 -p com.roblox.clienv', shell=True)