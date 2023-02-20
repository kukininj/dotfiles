{
  programs.helix = {
    enable = true;
    languages = [ 
    ];
    settings = {
      theme = "onedark";
      editor = {
        auto-format = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
      };
    };
  };
}