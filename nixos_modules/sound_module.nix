{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
{
  options = {
    sound_module = {
      enable = mkEnableOption "enable sound (pipewire)";
    };
  };
  config = mkIf config.sound_module.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
