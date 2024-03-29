{
    description = "A flake to build the tdm wm manager";

    outputs = { self, nixpkgs }: {
        tdm = 
            with import nixpkgs { system = "x86_64-linux"; };

        stdenv.mkDerivation rec {
            name = "ava-tdm";
            pname = "ava-tdm-0.0.2";
            version = "0.0.2";

            src = fetchFromGitHub {
                owner = "dopsi";
                repo = "console-tdm";
                rev = "develop";
                hash = "sha256-duMLkAPLcXdDWfCOo7ZEhwWLv7rT8OtsbsZS3PFZYTg=";
            };

           installPhase = ''echo "skiping..."'';
 

            preConfigure = ''
                sed -i "s@^PREFIX=/usr/local@PREFIX=$out@g" Makefile
                '';

        };
        packages.x86_64-linux.default = self.tdm;
    };

}
