{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "VictorMono NerdFont";
      size = 18;
    };
    settings = {
      confirm_os_window_close = 0;
    };
    extraConfig = builtins.concatStringsSep "\n" [
      ''
              font_family VictorMono Nerd Font
              disable_ligatures never
              font_size	18
              bold_font	auto
              background	#161616
              foreground	#FFD9FA
              active_border_color	#1c2e5d
      ''
    ];
  };
}
