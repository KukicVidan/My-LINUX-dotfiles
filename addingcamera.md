# Run Laptop Camera Without Terminal in Hyprland

This guide explains how to run your laptop camera using **GStreamer (**``**)** without opening a terminal. It also includes integration with **Rofi** and Hyprland floating window settings.

## 1. Create a Script to Launch the Webcam

1. Open a terminal and create the script file:

   ```sh
   mkdir -p ~/.local/bin
   nano ~/.local/bin/webcam.sh
   ```

2. Add the following content to `webcam.sh`:

   ```sh
   #!/bin/bash
   nohup gst-launch-1.0 v4l2src device=/dev/video0 ! videoconvert ! autovideosink >/dev/null 2>&1 &
   ```

   - `nohup` prevents the process from stopping when the terminal closes.
   - `>/dev/null 2>&1 &` ensures no output is sent to a terminal.

3. Make the script executable:

   ```sh
   chmod +x ~/.local/bin/webcam.sh
   ```

## 2. Create a `.desktop` File for Rofi/App Launcher

1. Create the `.desktop` file:

   ```sh
   nano ~/.local/share/applications/webcam.desktop
   ```

2. Add the following content:

   ```ini
   [Desktop Entry]
   Name=Webcam
   Exec=/home/$USER/.local/bin/webcam.sh
   Type=Application
   Terminal=false
   Icon=camera-web
   ```

3. Refresh the desktop database:

   ```sh
   update-desktop-database ~/.local/share/applications
   ```

Now, you can search for **"Webcam"** in Rofi or any application launcher to start your camera.

## 3. Configure Hyprland to Open Webcam as a Floating Window

To prevent the webcam window from auto-tiling in Hyprland, first, find the exact window name by running:

```sh
hyprctl clients
```

Look for the window title under `class:` or `title:`. Use that exact name in the Hyprland config.

Then, add the following rule to your **hyprland.conf**:

```ini
windowrule = float, title:^(EXACT_WINDOW_NAME_HERE)$
```

Replace `EXACT_WINDOW_NAME_HERE` with the actual title from `hyprctl clients`.

Restart Hyprland or apply changes:

```sh
hyprctl reload
```

## 4. (Optional) Add a Hyprland Keybinding

For quick access, add this to your **hyprland.conf**:

```ini
bind = SUPER, C, exec, ~/.local/bin/webcam.sh
```

Now, pressing `SUPER + C` will launch your webcam instantly.

---

### 🎉 Done! Now your webcam opens as a floating window without a terminal!

- **Use Rofi/App Launcher** → Search for "Webcam"
- **Use Keybinding** → Press `SUPER + C`
- **Use CLI** → Run `~/.local/bin/webcam.sh` manually

Enjoy! 🚀


