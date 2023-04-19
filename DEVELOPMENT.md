# Website source
The website is built in a jupyter notebook and then converted to HTML and styled with CSS.

## Getting started
In this directory run the following commands to get up and running.
```bash
make install
```

Now run the following command to start editing the website
```bash
source .venv/bin/activate
make edit
```

Finally, run the `dist` command to generate the HTML source that will be served to readers;
```bash
source .venv/bin/activate
make dist
```
