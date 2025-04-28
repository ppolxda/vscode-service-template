# vscode-service-template

## 关联文档

GitHub - linuxserver/docker-code-server
https://hub.docker.com/r/linuxserver

## 部署概况

本文档部署仅针对内网正常使用，外网使用应申请关联域名和证书，替换本文提供的自签名证书即可完成相关部署。
本教程主要针对docker部署，快速在服务器上，构建自己的沙盒开发环境，提高服务器利用效率。
本教程将会跳过docker安装相关教程，如果需要请自行查阅相关资料

## 快速部署

完整配置地址 [https://github.com/ppolxda/vscode-service-template](https://github.com/ppolxda/vscode-service-template)

```bash
git clone https://github.com/ppolxda/vscode-service-template
cd ./vscode-service-template
docker compose up -d
```

检查服务启动情况

```bash
docker compose status
```

确认两个服务状态正常

```bash
>> docker-compose ps
NAME          IMAGE          COMMAND                  SERVICE       CREATED       STATUS       PORTS
code-server   python_dev     "/init"                  code-server   2 hours ago   Up 2 hours   0.0.0.0:8443->8443/tcp, [::]:8443->8443/tcp
nginx         nginx:latest   "/docker-entrypoint.…"   nginx         2 hours ago   Up 2 hours   0.0.0.0:180->80/tcp, [::]:180->80/tcp, 0.0.0.0:1443->443/tcp, [::]:1443->443/tcp
```

### 浏览器访问

假设本机ip是 192.168.1.20，直接浏览器打开访问地址，注意要使用https

```bash
https://192.168.1.20
```
