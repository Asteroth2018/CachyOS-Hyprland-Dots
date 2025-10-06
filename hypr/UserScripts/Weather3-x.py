#!/usr/bin/env python3

import json
import requests
import os
import time

time.sleep(4)

# --- Configuration ---
# You'll need an API key from OpenWeatherMap (it's free for basic use).
# Get one here: https://openweathermap.org/api
OPENWEATHERMAP_API_KEY = "60d7b980f7da638967fed7f0aaf80f84"
CITY_NAME = "Świebodzice"  # Replace with your city (e.g., "London", "New York", "Tokyo")
COUNTRY_CODE = "PL"   # Replace with your country code (e.g., "US", "GB", "JP")
UNITS = "metric"      # Use "metric" for Celsius, "imperial" for Fahrenheit
LANG = "en"           # Language for description (e.g., "en", "pl", "de")

# --- Weather Icons (optional, but nice for Waybar) ---
# You can use Nerd Fonts or other icon sets.
# These are just examples, adjust to your preferred icons.
WEATHER_ICONS = {
    "01d": "",  # Clear sky (day)
    "01n": "󰖔",  # Clear sky (night)
    "02d": "",  # Few clouds (day)
    "02n": "",  # Few clouds (night)
    "03d": "",  # Scattered clouds
    "03n": "",  # Scattered clouds
    "04d": "", # Broken clouds
    "04n": "", # Broken clouds
    "09d": "",  # Shower rain
    "09n": "",  # Shower rain
    "10d": "",  # Rain (day)
    "10n": "",  # Rain (night)
    "11d": "",  # Thunderstorm
    "11n": "",  # Thunderstorm
    "13d": "",  # Snow
    "13n": "",  # Snow
    "50d": "",  # Mist
    "50n": "",  # Mist
}

def get_weather():
    base_url = "http://api.openweathermap.org/data/2.5/weather"
    params = {
        "q": f"{CITY_NAME},{COUNTRY_CODE}",
        "appid": OPENWEATHERMAP_API_KEY,
        "units": UNITS,
        "lang": LANG,
    }

    try:
        response = requests.get(base_url, params=params)
        response.raise_for_status()  # Raise an exception for HTTP errors
        weather_data = response.json()

        if weather_data and weather_data.get("main") and weather_data.get("weather"):
            main = weather_data["main"]
            weather_desc = weather_data["weather"][0]

            temperature = main["temp"]
            description = weather_desc["description"].capitalize()
            icon_code = weather_desc["icon"]
            icon = WEATHER_ICONS.get(icon_code, "❓") # Default icon if not found

            # Format for Waybar
            # This is a simple string output. You can make it JSON if you need more features.
            # Example JSON:
            # {
            #     "text": "☀️ 25°C",
            #     "tooltip": "Clear sky, Feels like 24°C"
            # }

            temp_unit = "°C" if UNITS == "metric" else "°F"
            waybar_text = f"{icon} {temperature:.0f}{temp_unit}"
            waybar_tooltip = (
                f"{description}, Feels like {main['feels_like']:.0f}{temp_unit}\n"
                f"Humidity: {main['humidity']}%\n"
                f"Pressure: {main['pressure']} hPa"
            )

            # Output as JSON for more flexibility in Waybar
            output = {
                "text": waybar_text,
                "tooltip": waybar_tooltip,
                "alt": description.split(" ")[0], # Short alt text for icon
            }
            print(json.dumps(output))
        else:
            print(json.dumps({"text": "Weather N/A", "tooltip": "No weather data"}))

    except requests.exceptions.RequestException as e:
        print(json.dumps({"text": "Weather Err", "tooltip": f"Network error: {e}"}))
    except json.JSONDecodeError:
        print(json.dumps({"text": "Weather Err", "tooltip": "Failed to parse weather data"}))
    except Exception as e:
        print(json.dumps({"text": "Weather Err", "tooltip": f"An unexpected error occurred: {e}"}))

if __name__ == "__main__":
    get_weather()
