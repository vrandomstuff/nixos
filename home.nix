{ config, pkgs, inputs, ... }:
let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/bd868f769a69d3b6091a1da68a75cb83a181033c.zip";
    sha256 = "0wabnap7mww4fb4z4zp1xwii133821wlgqj4qd97zphr7vyskzq9";
};
in
{
  imports = [
    # (import "${home-manager}/nixos")
  ];

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
    programs.plasma = {
      enable = true;
    };
  };
}
