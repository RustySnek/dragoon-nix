# Not complete list of stuff

## WM
- i3

## Audio
- **PipeWire**
- **Pavucontrol**

## Database
- **PostgreSQL**
- **MariaDB**

## Development Tools
- **Devenv**
- **Docker**
- **Neovim**

## Browsers
- **Floorp** (with persisted storage)
- **Ungoogled Chromium**

## User Environment
- **Kitty Terminal** (to be replaced)
- **Fish Shell**
- **Ouch** (file compression)

### Shell Aliases
```nix
shellAliases = {
    "du" = "${pkgs.du-dust}/bin/dust";
    "ls" = "${pkgs.unstable.eza}/bin/eza --icons";
    "la" = "${pkgs.unstable.eza}/bin/eza --icons -la --extended --git";
    "cat" = "${pkgs.bat}/bin/bat";
    "df" = "${pkgs.duf}/bin/duf";
    "ps" = "${pkgs.procs}/bin/procs";
    "curl" = "${pkgs.curlie}/bin/curlie";
    "dig" = "${pkgs.dogdns}/bin/dog";
    "cp" = "${pkgs.xcp}/bin/xcp";
};
```

## Cracking Tools
- **John the Ripper**
- **Aircrack-ng**
- **Hashcat**
- **THC-Hydra**
- **Medusa**

## Enumeration Tools
- **RustScan**
- **Gobuster**
- **ZAP (Zed Attack Proxy)**
- **Wireshark**
- **lsof**
- **Inetutils**
- **Enum4Linux**
- **Rustcat**
- **Tcpdump**

## Exploitation Tools
- **Metasploit**
- **SQLMap**
- **Commix**
- **ExploitDB**

## Programming Languages
- **Python 3.12**
- **Java Runtime Environment 8**

## Miscellaneous Tools
- **GEF (GDB Enhanced Features)**
- **SecLists** (located at `~/wordlists`)
- **MPV** (media player)
- **FFmpeg Full** (multimedia framework)
- **qBittorrent** (torrent client)

