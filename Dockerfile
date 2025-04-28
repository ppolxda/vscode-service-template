# 使用linuxserver/code-server作为基础镜像
FROM lscr.io/linuxserver/code-server:latest

ENV http_proxy=http://192.168.10.3:7890
ENV https_proxy=http://192.168.10.3:7890

# 安装Node.js / Python / Seafile CLI
RUN apt  update && \
    # nodejs
    # apt-get install -y nodejs npm && \
    # python
    # apt-get install -y python3 python3-pip && \
    apt  install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libsasl2-dev python3-dev libldap2-dev && \
    curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    # PHP
    # apt install -y php-cli php-fpm php-mysql php-curl php-gd php-xml php-mbstring php-json php-zip php-bcmath php-intl php-soap php-xdebug && \
    # seafile客户端
    # apt install -y seafile-cli && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*