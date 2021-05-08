for extension in "bajdzis.vscode-database" \
"njqdev.vscode-python-typehint" \
"frhtylcn.pythonsnippets" \
"ms-python.python" \
"ms-python.vscode-pylance" \
"ms-toolsai.jupyter" \
"github.vscode-pull-request-github" \
"donjayamanne.githistory" \
"ms-azuretools.vscode-docker" \
"cweijan.vscode-database-client2" \
"philsinatra.macos-dark-mode-theme" \
"formulahendry.code-runner" \
"vscode-icons-team.vscode-icons" \
"coenraads.bracket-pair-colorizer-2" \
"naumovs.color-highlight" \
"vscodevim.vim" \
"xadillax.viml"; do
code --install-extension "${extension}" &> /dev/null
done
