#!/usr/bin/env bash
# etherealbinarybeast command will be available once the tests are run

# aliases don't work in non-interactive bash environments (bash -c *alias*)
# so, we create a script in PATH, which can be invoked from anywhere
printf "#!/usr/bin/env bash\netherealbinarybeast" > /usr/local/bin/ethereal
chmod +x /usr/local/bin/ethereal
