FROM alpine:3.12.0

RUN apk add --update --no-cache curl ca-certificates bash bash-completion zsh curl git vim ncurses util-linux

ADD subspace-client.sh /usr/bin/subspace-client.sh
ADD _subspace-client.sh /usr/local/share/zsh/site-functions/_subspace-client.sh
ADD subspace-client.sh.bash-completion /etc/bash-completion.d/subspace-client.sh
RUN chmod 755 /usr/bin/subspace-client.sh

#
# Install oh-my-zsh
#
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

#
# Enable bash completion
#
RUN echo '\n\
. /etc/bash_completion\n\
source /etc/bash-completion.d/subspace-client.sh\n\
' >> ~/.bashrc

#
# Setup prompt
#
RUN echo 'export PS1="[Subspace Product API] \$ "' >> ~/.bashrc
RUN echo 'export PROMPT="[Subspace Product API] \$ "' >> ~/.zshrc

#
# Setup a welcome message with basic instruction
#
RUN echo -e 'echo "\
\n\
This Docker provides preconfigured environment for running the command\n\
line REST client for $(tput setaf 6)Subspace Product API$(tput sgr0).\n\
\n\
For convenience, you can export the following environment variables:\n\
\n\

\n\
$(tput setaf 7)Basic usage:$(tput sgr0)\n\
\n\
$(tput setaf 3)Print the list of operations available on the service$(tput sgr0)\n\
$ subspace-client.sh -h\n\
\n\
$(tput setaf 3)Print the service description$(tput sgr0)\n\
$ subspace-client.sh --about\n\
\n\
$(tput setaf 3)Print detailed information about specific operation$(tput sgr0)\n\
$ subspace-client.sh <operationId> -h\n\
\n\
By default you are logged into Zsh with full autocompletion for your REST API,\n\
but you can switch to Bash, where basic autocompletion is also supported.\n\
\n\
"\
' | tee -a ~/.bashrc ~/.zshrc

#
# Poormans chsh & cleanup to make image as compact as possible
#

RUN sed -i 's/root:x:0:0:root:\/root:\/bin\/ash/root:x:0:0:root:\/root:\/bin\/zsh/' /etc/passwd
RUN apk del git vim && rm -f /var/cache/apk/*

ENTRYPOINT ["/bin/zsh"]
