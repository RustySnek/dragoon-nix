{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "pure";
        src = pure.src;
      }
    ];
    interactiveShellInit = ''
      function fallow
                if test (count $argv) -ne 2
                            echo "Usage: fallow <ip-address> <time-in-minutes>"
                            return 1
                        end

                set ip_address $argv[1]
                set time_minutes $argv[2]

                # Add the iptables rule
                sudo iptables -I INPUT -s $ip_address -j ACCEPT
                echo "Allowed IP $ip_address for $time_minutes minutes."

                # Run the sleep and removal of the iptables rule in the background
                nohup sudo fish -c "sleep (math \"$time_minutes * 60\"); iptables -D INPUT -s $ip_address -j ACCEPT; echo 'Removed IP $ip_address from allowed list.'" > /tmp/fallow_$ip_address.log 2>&1 &

                echo "Background process started. Check /tmp/fallow_$ip_address.log for details."
        end
    '';
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
  };

  home.persistence."/nix/persist/home/dragoon/" = {
    files = [
      ".local/share/fish/fish_history"
    ];
  };

  programs.kitty.settings.shell = "${pkgs.fish}/bin/fish";
}
