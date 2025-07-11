# 🛰️ NASA Moon Tube Rover Project

This project is a prototype rover built for a NASA-sponsored internship through the California Space Grant Consortium. The rover was designed to traverse simulated lunar lava tubes and collect environmental data within a time-limited mission. It was controlled wirelessly via a custom GUI built in Processing and programmed using Arduino C/C++. Teams were invited to the Northrop Grumman Corporation building in Redondo Beach to tour the site and present prototyped rovers, either virtually or in person, to demonstrate the tasks they could complete.

---
## 📌 Project Overview

The rover was built to:
- Navigate a simulated moon's lava cave environment
- Be remotely piloted via GUI
- Execute precise movement commands
- Toggle lighting systems for dark environments
- Prototype additional functions (e.g. camera, scoop, environment analytics)

---

## 🖥️ GUI Control Panel (Processing)

Located in `rover_gui_control.pde` A custom GUI created using the **ControlP5** library in Processing. It provides directional control and command buttons.

### 🔘 GUI Features
- Move Forward / Backward
- Turn Left / Right
- Toggle Light
- Capture & Send Picture Command (back to the GUI - incomplete)

The GUI connects via USB Serial to an Arduino-based microcontroller. Each button sends a unique character to control specific rover actions.

---

## ⚙️ Arduino Firmware

### `rover_main_control.ino`
This is the main firmware used on the rover. It listens for serial commands from the GUI and controls motors and lights accordingly.

#### 🛠️ Features
- Supports directional movement (forward, backward, left, right)
- Light toggle functionality
- Switch input for safety cut-off
- Modular `forward()`, `backward()`, `left()`, and `right()` motor functions
- Optimized for **500ms** movement cycles for precise control

---

## 🚀 Future Enhancements (Planned)
- Integrate live video streaming or image capture (`'p'` command placeholder)
- Add scoop mechanism for simulated material retrieval
- Enable full autonomy
- Implement solar panel powering for total autonomy

---

## 📍 Notes
- This project was developed as part of a NASA summer research internship through the California Space Grant Consortium.
- Built in collaboration with researchers simulating low-light, confined-space traversal challenges in lava tube analogs.

