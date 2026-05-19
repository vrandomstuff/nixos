{ config, pkgs, inputs, ... }:
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
        lengthMode = "fit";
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
        floating = false;
      }];
      enable = true;
    };
  };
}


