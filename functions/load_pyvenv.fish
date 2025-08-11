function load_pyvenv --on-variable PWD

  # Python VENV secure initialization.
  # --
  # Will be activated "executing bin/activate.fish" only if authorization file
  # matches the hashed password.

  set sha_pass "620f52288f6f37c3bbc8e2321e66e8c39c35c562d07180ebd278d6a6d1807f5b"

  if test -f "$PWD/pyvenv.cfg"
    if test -d $PWD/bin
      if test "$(cat authorize | sha256sum | cut -d' ' -f1)" = "$sha_pass"
        source bin/activate.fish
      end
    end
  end

end
