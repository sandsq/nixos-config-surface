{ lib, config, ... }:
with lib;
{
  options = {
    dvorak = {
      enable = mkEnableOption "enable dvorak";
    };
  };

  config = mkIf config.dvorak.enable {
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.variant = "dvorak";
    console.useXkbConfig = true;
    # services.xserver.xkb.options = "eurosign:e,caps:escape";
  };
}
