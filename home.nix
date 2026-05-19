{ config, pkgs, inputs, ... }:
# let
#   home-manager = builtins.fetchTarball {
#     url = "https://github.com/nix-community/home-manager/archive/bd868f769a69d3b6091a1da68a75cb83a181033c.zip";
#     sha256 = "0wabnap7mww4fb4z4zp1xwii133821wlgqj4qd97zphr7vyskzq9";
# };
# in
{

  home-manager.users.v = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "25.11";
    programs.bash = {
      enable = true;
      bashrcExtra = builtins.readFile ./bashrc;
    };
    home.sessionVariables = {
      EDITOR="vim";
    };
    programs.plasma = { # https://nix-community.github.io/plasma-manager/options.xhtml
      workspace.theme = "breeze-dark"; # plasma-apply-desktoptheme --list-themes
      workspace.lookAndFeel = "org.kde.breezedark.desktop"; # plasma-apply-lookandfeel --list
      session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
      panels = [{
        location = "top";
        height = 46;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }];
      enable = true;
    };
  };
}


