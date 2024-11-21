{
  lib,
  home-manager,
  impermanence,
  nur,
  nixpkgs-unstable,
  ...
}: let
  unstableOverlay = final: prev: {
    unstable = nixpkgs-unstable.legacyPackages.${prev.system};
  };
  unstableModule = {
    config,
    pkgs,
    ...
  }: {nixpkgs.overlays = [unstableOverlay];};
 in {
  placidusax = lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit impermanence;};
    modules = [
      {
        nixpkgs.config.allowUnfreePredicate = _: true;
      }
      impermanence.nixosModules.impermanence
      nur.nixosModules.nur
      unstableModule
      ./placidusax
      home-manager.nixosModules.home-manager
      {
        nixpkgs.overlays = [nur.overlay unstableOverlay];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.dragoon = import ../users/dragoon;
        home-manager.extraSpecialArgs = {
          inherit impermanence;
        };
      }
    ];
  };
}
