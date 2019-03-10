# rake-ssh
> Ssh/sftp task.

## install:
```bash
npm i -S afeiship/rake-ssh --registry=https://registry.npm.taobao.org
```

## usage:
~~~
$ rake -T
rake ssh:upload[config]  # Upload directory
~~~

## example:
- config/ssh.yaml
```yaml
sshkit_config:
  output_verbosity: :debug
  format: :pretty
ssh_options:
  :user: fzheng
  :password: PASS_!@#
host: 192.168.1.11
dirs:
  source: ./github/project
  destination: /home/user/data
```
- bash:
```bash
rake ssh:upload[./config/ssh.yaml]
```


## resources:
- https://github.com/capistrano/sshkit/blob/master/EXAMPLES.md