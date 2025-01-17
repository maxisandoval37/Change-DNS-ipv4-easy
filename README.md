# Change-DNS-IPv4-Easy

A simple Batch script to easily change your IPv4 DNS settings to commonly used DNS providers. The script allows you to choose between multiple DNS configurations and apply them with a single selection. It also includes administrator privilege checks to ensure proper execution.

## **Update 2025: Portable .exe added**

<p align="center">
  <img src="https://github.com/user-attachments/assets/ecb231c7-9048-4efa-890f-bd63f1f33c67"/>
</p>

## Features

- Change DNS settings to various popular providers, including:
  - Default DNS
  - AdGuard (Default, Non-Filtering, Family Protection)
  - Cloudflare (Standard, Malware Blocking, Family Protection)
  - Google DNS
  - Cisco OpenDNS (Home, FamilyShield)
- Works for multiple network interfaces (`Wi-Fi`, `Ethernet`, etc.).
- User-friendly menu interface.
- Automatic privilege escalation when required.

## Usage

1. Download and save the script as `Change-DNS-IPv4-Easy.bat`.
2. Run the script by double-clicking it or executing it from a command prompt.
3. If prompted, grant administrator permissions for the script to modify network settings.
4. Use the menu to select your desired DNS configuration:
   - Enter the number corresponding to your choice (e.g., `1` for Default DNS).
5. Follow the prompts to apply the changes.

## Menu Options

| Option | Description                                | DNS Servers                                  |
|--------|--------------------------------------------|---------------------------------------------|
| 1      | Default DNS                                | Restores default settings (via DHCP).       |
| 2      | AdGuard Default-Filtering                 | `94.140.14.14`, `94.140.15.15`              |
| 3      | AdGuard Non-Filtering                     | `94.140.14.140`, `94.140.14.141`            |
| 4      | AdGuard Family Protection                 | `94.140.14.15`, `94.140.15.16`              |
| 5      | Cloudflare                                | `1.1.1.1`, `1.0.0.1`                        |
| 6      | Cloudflare+Malware Blocking               | `1.1.1.2`, `1.0.0.2`                        |
| 7      | Cloudflare+Family Protection              | `1.1.1.3`, `1.0.0.3`                        |
| 8      | Google DNS                                | `8.8.8.8`, `8.8.4.4`                        |
| 9      | Cisco OpenDNS Home                        | `208.67.222.222`, `208.67.220.220`          |
| 10     | Cisco OpenDNS FamilyShield                | `208.67.222.123`, `208.67.220.123`          |
| 11     | Display Current DNS Settings                | Display Current DNS Settings (via nslookup)         |
| 0      | Exit                                      | Exits the script.                           |

## Requirements

- Windows operating system.
- Administrator privileges to modify DNS settings.
- PowerShell for privilege escalation.

## Disclaimer

This script modifies network settings on your computer. Use it at your own risk. Ensure you have administrator privileges and understand the DNS changes being applied.

---

### Created By: [Maximiliano Sandoval](https://github.com/maxisandoval37)
