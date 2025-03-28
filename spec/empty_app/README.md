# Installing Memo

```console
cd spec
rails new example_app -T --skip-docker --skip-keeps -C --skip-bootsnap --database=sqlite3
rm -rf example_app/.git
```

```diff
# config/application.rb
+ require "sprockets/railtie"
```
