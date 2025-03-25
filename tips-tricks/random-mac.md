# Random MAC Address using NetworkManager

If you're using **NetworkManager**, you can configure it to **automatically** randomize MAC addresses for WiFi and Ethernet.

1. **Edit NetworkManager configuration**:
   ```sh
   sudo nano /etc/NetworkManager/conf.d/macrandom.conf
   ```
2. **Add the following**:

   ```ini
   [device]
   wifi.scan-rand-mac-address=yes

   [connection]
   wifi.cloned-mac-address=random
   ethernet.cloned-mac-address=random
   ```

3. **Restart NetworkManager**:
   ```sh
   sudo systemctl restart NetworkManager
   ```

With this method, every time your device connects to a network, it will use a **new random MAC address**.
