{
  perSystem = {
    pkgs,
    final,
    ...
  }: {
    overlayAttrs = {
      dvc = final.callPackage ./dvc/package.nix {};
      dvc-with-remotes = final.callPackage ./dvc/package.nix {
        withAzure = true;
        withGoogleDrive = true;
        withGoogleCloud = true;
        withHDFS = true;
        withAliyunOSS = true;
        withS3 = true;
        withSSH = true;
        withSSHGSSAPI = true;
        withWebDAV = true;
        withHDFSWeb = true;
        withHDFSWebKerberos = true;
        withTerraform = true;
      };

      pythonPackagesExtensions =
        pkgs.pythonPackagesExtensions
        ++ [
          (pself: _: {
            coverage-enable-subprocess = pself.callPackage ./coverage-enable-subprocess/package.nix {};

            dvc-data = pself.callPackage ./dvc-data/package.nix {};

            dvc-gdrive = pself.callPackage ./dvc-gdrive/package.nix {};

            dvc-http = pself.callPackage ./dvc-http/package.nix {};

            dvc-objects = pself.callPackage ./dvc-objects/package.nix {};

            dvc-render = pself.callPackage ./dvc-render/package.nix {};

            dvc-studio-client = pself.callPackage ./dvc-studio-client/package.nix {};

            dvc-task = pself.callPackage ./dvc-task/package.nix {};

            dvclive = pself.callPackage ./dvclive/package.nix {};

            iterative-telemetry = pself.callPackage ./iterative-telemetry/package.nix {};

            pydrive2 = pself.callPackage ./pydrive2/package.nix {};

            pytest-servers = pself.callPackage ./pytest-servers/package.nix {};

            scmrepo = pself.callPackage ./scmrepo/package.nix {};

            universal-pathlib = pself.callPackage ./universal-pathlib/package.nix {};
          })
        ];
    };

    packages.dvc = final.dvc;
    packages.dvc-with-remotes = final.dvc-with-remotes;
  };
}
