# dotfiles

Fedora 44 + niri (Wayland tiling compositor) — setup orienté pentesting/CTF.

## Stack

| Composant | Outil |
|---|---|
| WM | niri |
| Terminal | kitty |
| Shell | fish + starship |
| Bar | waybar |
| Launcher | fuzzel |
| Notifications | dunst |
| Logout | wlogout |
| Wallpaper | swaybg |
| Cursor | Bibata-Modern-Ice |
| Pentesting | Exegol (Docker) |

## Structure

```
niri/              # config modulaire niri
  config.kdl       # point d'entrée (includes)
  cfg/             # keybinds, layout, display, rules, animations...
kitty/             # terminal config + tab bar custom
fish/              # shell config, aliases, fonctions CTF
fuzzel/            # launcher config
waybar/            # barre de statut
dunst/             # notifications
wlogout/           # menu de déconnexion
exegol/            # setup Exegol (starship, zsh, aliases CTF)
scripts/           # kitty-smart-split (split contextuel SSH/Exegol)
starship.toml      # prompt minimal
```

## Features

- **Transparence** kitty avec bordures roses (shadow niri, pas focus-ring)
- **Smart split** : `Ctrl+Shift+O/E` ouvre un split dans le même contexte (SSH, Exegol, ou cwd)
- **Fonctions CTF** : `target`, `scan`, `serve`, `listen`, `revshell`, `ctf`, `peas`, `exs`
- **Exegol** intégré : starship prompt dans les containers, split auto-détecté
- **AZERTY** : keybinds adaptés

## Installation

```bash
# Niri
mkdir -p ~/.config/niri/cfg
cp niri/config.kdl ~/.config/niri/
cp niri/cfg/*.kdl ~/.config/niri/cfg/

# Kitty
mkdir -p ~/.config/kitty
cp kitty/* ~/.config/kitty/

# Fish + Starship
mkdir -p ~/.config/fish
cp fish/config.fish ~/.config/fish/
cp starship.toml ~/.config/

# Waybar, Fuzzel, Dunst, Wlogout
for app in waybar fuzzel dunst wlogout; do
  mkdir -p ~/.config/$app
  cp $app/* ~/.config/$app/
done

# Scripts
cp scripts/* ~/.local/bin/
chmod +x ~/.local/bin/kitty-smart-split

# Exegol
cp exegol/load_user_setup.sh ~/.exegol/my-resources/setup/
cp exegol/starship.toml ~/.exegol/my-resources/setup/
mkdir -p ~/.exegol/my-resources/setup/zsh
cp exegol/zsh/* ~/.exegol/my-resources/setup/zsh/
```

## Curseur — Bibata-Modern-Ice

Le thème de curseur utilisé est [Bibata-Modern-Ice](https://github.com/ful1e5/Bibata_Cursor). Compatible Linux (tous DE/WM) et Windows.

### Linux

```bash
# Télécharger la dernière release
curl -sL https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Ice.tar.xz -o /tmp/Bibata-Modern-Ice.tar.xz

# Extraire et installer
tar xf /tmp/Bibata-Modern-Ice.tar.xz -C /tmp
sudo mv /tmp/Bibata-Modern-Ice /usr/share/icons/

# Appliquer (GNOME / GTK)
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
gsettings set org.gnome.desktop.interface cursor-size 16
```

- **KDE** : Paramètres système → Apparence → Curseurs → choisir Bibata-Modern-Ice
- **XFCE** : Paramètres → Souris et pavé tactile → Thème → Bibata-Modern-Ice
- **Wayland (niri/sway/hyprland)** : ajouter dans la config du compositor :
  ```
  cursor { theme "Bibata-Modern-Ice"; size 16; }
  ```

### Windows

1. Télécharger `Bibata-Modern-Ice-Windows.zip` depuis les [releases](https://github.com/ful1e5/Bibata_Cursor/releases)
2. Extraire l'archive
3. Clic droit sur `install.inf` → **Installer**
4. Paramètres → Bluetooth et appareils → Souris → Paramètres de souris supplémentaires → Pointeurs → choisir Bibata-Modern-Ice

## Hardware

- CPU: Ryzen 7 5800X
- GPU: RTX 3060 Ti
- Monitors: ASUS VG249QM1A (240Hz) + MSI MAG241CR (60Hz)
