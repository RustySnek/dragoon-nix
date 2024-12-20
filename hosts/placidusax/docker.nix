{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker-compose
    docker
  ];
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
