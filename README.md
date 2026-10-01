# Speed Camera System

Enforce speed limits and issue fines automatically in FiveM.

## Features

- Set up speed cameras at specific locations
- Issue fines to players who exceed the speed limit

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script files.
2. Place them in your FiveM server's resources folder.
3. Add `start speed_camera_system` to your server.cfg file.
4. Run the `database.sql` file to create the necessary database table.

## Usage

1. Configure the speed limit, fine amount, and camera locations in the `config.lua` file.
2. Restart your FiveM server.
3. Players will now be fined if they exceed the speed limit at the configured camera locations.

## Configuration

- `Config.SpeedLimit`: The speed limit in mph.
- `Config.FineAmount`: The fine amount in dollars.
- `Config.CameraLocations`: An array of camera locations with x, y, z coordinates and radius.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=speed-camera-system&utm_content=bottom) — describe it in one sentence and get the full source code.