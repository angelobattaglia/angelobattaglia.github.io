# My own personal website

Make sure to install [lowdown(1)](https://github.com/kristapsdz/lowdown).
Then, you can go checkout the [docs](https://www.romanzolotarev.com/ssg.html).

## Dev workflow from scratch

```shell
git clone git@github.com:angelobattaglia/angelobattaglia.github.io.git
cd angelobattaglia.github.io
./ssg6 src ./ 'test' 'http://www'
```

- src is the source code directory
- "./" is the destination directory, where the built website is stored
- 'test' is the name of the website

To deploy it, it's sufficient to use python3:

```shell
cd ./ # or whatever is the directory where the target is being stored
python3 -m http.server
```

### Dev workflow with shell scripts

Build all

```shell
./scripts/build
```

Deploy

```shell
./scripts/deploy
```

### Dev workflow with Make for LaTeX

. Build the Curriculum Vitae pdf

- Linux

```shell
make
make clean # cleans the build files
```

- Windows (with MinGW)

```shell
gmake
gmake clean # cleans the build files
```

#### Experimental Make usage

. build the website

```shell
make build
```

. Deploy

```shell
make deploy
```

. Push on GitHub

```shell
make push
```

### Using Nginx to deploy

Create this file:

```shell
nvim etc/nginx/sites-available/mywebsite
```

Paste this:

```shell
server {
        listen 80 ;
        listen [::]:80 ;
        server_name angelob.xyz;
        root /home/angelo/github/angelob.xyz/dst ;
        index index.html index.htm index.nginx-debian.html ;
        location / {
                try_files $uri $uri/ =404 ;
        }
}
```

As super user, run this:

```shell
ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled
```

Then:

```shell
systemctl reload nginx
```
