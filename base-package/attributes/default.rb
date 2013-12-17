# Default Values
default["base-package"]["packages"] = %w(
  tree
  sysstat
  telnet
  nc
  git
  subversion
  git-svn
  emacs
  vim
  screen
  gcc
  gcc-c++

  zlib
  zlib-devel
  readline
  readline-devel
  openssl
  openssl-devel
  curl
  curl-devel
  libyaml-devel
  ImageMagick
  ImageMagick-devel
  nodejs

  libxml2-devel
  libxslt
  libxslt-devel

  mysql
  mysql-devel
)

## RubyやRailsのビルドに必要なもの
# zlib - nodejsまで

## nokogiriで必要なパッケージ
# libxml2-devel
# libxslt
# libxslt-devel

# mysql mysql-devel RailsでMysql使うときに必須
