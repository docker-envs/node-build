FROM noway56/myubuntu
MAINTAINER Lu Wu "wulu@nuanxin-health.com"
LABEL author="Lu Wu"


# 设置环境变量
ENV NVM_DIR /usr/local/nvm  
ENV NODE_VERSION 10.14.1
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules  
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH


RUN mkdir -p /usr/local/nvm \
    # 安装yarn
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo deb https://dl.yarnpkg.com/debian/ stable main | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y yarn \
    # 安装nvm
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    && /bin/bash -c "source ~/.bashrc" \
    && /bin/bash -c "source $NVM_DIR/nvm.sh" \
    && npm install -g cnpm --registry=https://registry.npm.taobao.org \
    && cnpm install -g webpack webpack-cli gulp  bower grunt vue-cli angular-cli create-react-app \
    && echo "finished nvm set up" 


