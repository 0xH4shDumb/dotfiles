# Keybinds

`Mod` = Super (touche Windows)

## Niri — Window Manager

### Applications

| Raccourci | Action |
|---|---|
| `Mod + Enter` | Terminal (kitty) |
| `Mod + Ctrl + Enter` | Launcher (fuzzel) |
| `Mod + B` | Navigateur (Vivaldi) |
| `Mod + E` | Fichiers (Nautilus) |
| `Mod + C` | Clipboard (cliphist) |
| `Mod + Backspace` | Menu power (wlogout) |
| `Mod + Alt + L` | Verrouiller (swaylock) |

### Fenêtres

| Raccourci | Action |
|---|---|
| `Mod + Q` | Fermer la fenêtre |
| `Mod + F` | Plein écran |
| `Mod + M` | Maximiser la colonne |
| `Mod + T` | Flottant on/off |
| `Mod + W` | Mode tabs dans la colonne |
| `Mod + O` | Overview |

### Navigation

| Raccourci | Action |
|---|---|
| `Mod + ←/→` ou `H/L` | Focus colonne gauche/droite |
| `Mod + ↑/↓` ou `K/J` | Focus fenêtre haut/bas |
| `Mod + Home/End` | Première/dernière colonne |
| `Mod + Tab` | Workspace précédent |

### Déplacement

| Raccourci | Action |
|---|---|
| `Mod + Ctrl + ←/→` ou `H/L` | Déplacer colonne gauche/droite |
| `Mod + Ctrl + ↑/↓` ou `K/J` | Déplacer fenêtre haut/bas |
| `Mod + Ctrl + Home/End` | Déplacer colonne en premier/dernier |
| `Mod + [` | Absorber/expulser fenêtre gauche |
| `Mod + ]` | Absorber/expulser fenêtre droite |
| `Mod + ,` | Absorber fenêtre dans la colonne |
| `Mod + .` | Expulser fenêtre de la colonne |

### Redimensionnement (niri)

| Raccourci | Action |
|---|---|
| `Mod + Shift + ←/→` | Largeur colonne ±10% |
| `Mod + Shift + ↑/↓` | Hauteur fenêtre ±10% |
| `Mod + R` | Cycle largeurs prédéfinies (33/50/66/100%) |
| `Mod + Shift + R` | Cycle inverse |
| `Mod + Ctrl + Shift + R` | Cycle hauteurs prédéfinies |
| `Mod + Ctrl + R` | Reset hauteur |

### Workspaces

| Raccourci | Action |
|---|---|
| `Mod + 1-9` | Aller au workspace 1-9 |
| `Mod + Ctrl + 1-9` | Déplacer vers workspace 1-9 |
| `Mod + Scroll ↑/↓` | Workspace précédent/suivant |
| `Mod + Ctrl + Scroll ↑/↓` | Déplacer colonne vers workspace |

### Screenshots

| Raccourci | Action |
|---|---|
| `Print` ou `Ctrl + Shift + S` | Screenshot (sélection) |
| `Ctrl + Print` ou `Ctrl + Shift + 3` | Screenshot fenêtre |
| `Shift + Print` ou `Ctrl + Shift + 2` | Screenshot écran |

### Système

| Raccourci | Action |
|---|---|
| `Mod + Shift + Escape` | Afficher overlay raccourcis |
| `Mod + Escape` | Toggle inhibit shortcuts |
| `Mod + Shift + P` | Éteindre les écrans |
| `Ctrl + Alt + Delete` | Quitter niri |

---

## Kitty — Terminal

### Splits

| Raccourci | Action |
|---|---|
| `Ctrl + Shift + O` | Split horizontal (smart: SSH/Exegol aware) |
| `Ctrl + Shift + E` | Split vertical (smart: SSH/Exegol aware) |
| `Ctrl + Shift + W` | Fermer le split |
| `Ctrl + Shift + Z` | Zoom split (toggle stack) |
| `Alt + ←/→/↑/↓` | Naviguer entre splits |
| `Ctrl + Alt + ←/→` | Redimensionner split (largeur) |
| `Ctrl + Alt + ↑/↓` | Redimensionner split (hauteur) |

### Tabs

| Raccourci | Action |
|---|---|
| `Ctrl + Shift + T` | Nouvel onglet |
| `Ctrl + Shift + L` | Onglet suivant |
| `Ctrl + Shift + H` | Onglet précédent |
| `Ctrl + Shift + .` | Déplacer onglet → |
| `Ctrl + Shift + ,` | Déplacer onglet ← |
| `Ctrl + Shift + 1-9` | Aller à l'onglet 1-9 (AZERTY) |

### Divers

| Raccourci | Action |
|---|---|
| `Ctrl + Shift + N` | Nouvelle fenêtre kitty |
| `Ctrl + Shift + F5` | Recharger la config |
| `Ctrl + Shift + =/-` | Taille police +/- |
| `Ctrl + Shift + 0` | Reset taille police |
| `Ctrl + Shift + A > M` | Augmenter opacité |
| `Ctrl + Shift + A > L` | Diminuer opacité |

---

## Fish — Shell

### Fonctions CTF

| Commande | Action |
|---|---|
| `target <ip>` | Définir l'IP cible |
| `scan quick/full/udp/vuln` | Nmap contre $TARGET |
| `serve [port]` | Serveur HTTP (défaut: 8000) |
| `listen [port]` | Listener netcat (défaut: 4444) |
| `revshell [port]` | Afficher reverse shell payloads |
| `ctf <name>` | Créer workspace ~/CTF/name/ |
| `extract <file>` | Extraire une archive |
| `peas lin/win` | Télécharger linpeas/winpeas |
| `myip` | Afficher mes IPs |
| `exs` | Ouvrir un shell Exegol |

### Abréviations

| Abréviation | Commande |
|---|---|
| `gc` | `git clone` |
| `py` | `python3` |
| `pup` | `python3 -m http.server` |
