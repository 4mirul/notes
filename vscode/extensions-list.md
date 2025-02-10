# Extensions list

Generate the extensions list `code --list-extensions > extensions.list`

Install the extensions from the list `cat extensions.list |% { code --install-extension $_}`