#!/usr/bin/env python3

import time
import subprocess
from pyquery import PyQuery  # install using `pip install pyquery`
import json
import os

time.sleep(4)


# weather icons
weather_icons = {
    "sunnyDay": "",
    "clearNight": "󰖔",
    "cloudyFoggyDay": "",
    "cloudyFoggyNight": "",
    "rainyDay": "",
    "rainyNight": "",
    "snowyIcyDay": "",
    "snowyIcyNight": "",
    "severe": "",
    "default": "",
}

# get location_id
# to get your own location_id, go to https://weather.com & search your location.
# once you choose your location, you can see the location_id in the URL(64 chars long hex string)
# like this: https://weather.com/en-PH/weather/today/l/bca47d1099e762a012b9a139c36f30a0b1e647f69c0c4ac28b537e7ae9c1c200
location_id = "fcfe51acdb99eb5bc05f1554ac2fc42b4a39c867685e8da5c615e24519f19855"  # TODO

# NOTE to change to deg F, change the URL to your preffered location after weather.com
# Default is English-Philippines with Busan, South Korea as location_id
# get html page
url = "https://weather.com/pl-PL/pogoda/dzisiaj/l/" + location_id
html_data = PyQuery(url=url)

# current temperature
temp = html_data("span[data-testid='TemperatureValue']").eq(0).text()
# print(temp)

# current status phrase
status = html_data("div[data-testid='wxPhrase']").text()
status = f"{status[:16]}.." if len(status) > 17 else status
# print(status)

# status code
status_code = html_data("#regionHeader").attr("class").split(" ")[2].split("-")[2]
# print(status_code)

# status icon
icon = (
    weather_icons[status_code]
    if status_code in weather_icons
    else weather_icons["default"]
)
# print(icon)

# temperature feels like
temp_feel = html_data(
    "div[data-testid='FeelsLikeSection'] > span > span[data-testid='TemperatureValue']"
).text()
temp_feel_text = f"Feels like {temp_feel}c"
# print(temp_feel_text)

# min-max temperature
temp_min = (
    html_data("div[data-testid='wxData'] > span[data-testid='TemperatureValue']")
    .eq(0)
    .text()
)
temp_max = (
    html_data("div[data-testid='wxData'] > span[data-testid='TemperatureValue']")
    .eq(1)
    .text()
)
temp_min_max = f"  {temp_min}\t\t  {temp_max}"
# print(temp_min_max)


# print waybar module data
out_data = {
    "text": f"{icon}  {temp}",
    "alt": status,
    "class": status_code,
}
print(json.dumps(out_data))

simple_weather = (
    f"{icon} {status}\n"
    + f"  {temp} ({temp_feel_text})\n"
)

try:
    with open(os.path.expanduser("~/.cache/.weather_cache"), "w") as file:
        file.write(simple_weather)
except:
    pass
