{ config, lib, pkgs,inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./home.nix
    ];
  nixpkgs.config.allowUnfree = true; # i try to do foss software when i can but sometimes i cant
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };
  networking.hostName = "nixos-btw"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Phoenix";
  i18n.defaultLocale = "en_US.UTF-8";
 
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  
  services.printing.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.v = {
    isNormalUser = true;
    extraGroups = [ "wheel" "cfgeditor" ]; 
    packages = with pkgs; [
    ];
  };
  users.groups.cfgeditor = {};
  hardware.graphics.enable = true;

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    vim 
    wget
    inputs.helium.packages.${stdenv.hostPlatform.system}.default
    git
    prismlauncher
    # davinci-resolve
    mesa
    mesa-demos
    vulkan-tools
    clinfo
    fastfetch
    ghostty
    zoxide
    wl-clipboard
  ];
  services.openssh.enable = true;
 
  networking.firewall.enable = false;

  # system.copySystemConfiguration = true; # when flakes start supporting this i will add it
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # just dont change this

}

