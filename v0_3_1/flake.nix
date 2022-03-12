{
  description = ''Modules providing information about the OS.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-osinfo-v0_3_1.flake = false;
  inputs.src-osinfo-v0_3_1.owner = "nim-lang";
  inputs.src-osinfo-v0_3_1.ref   = "refs/tags/v0.3.1";
  inputs.src-osinfo-v0_3_1.repo  = "osinfo";
  inputs.src-osinfo-v0_3_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-osinfo-v0_3_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-osinfo-v0_3_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}