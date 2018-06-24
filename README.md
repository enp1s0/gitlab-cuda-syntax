# GitLabでCUDAのSyntaxHighlightを行うための追加ファイル

> GitLab provides syntax highlighting on all files and snippets through the Rouge rubygem.

https://docs.gitlab.com/ee/user/project/highlighting.html

## How to install
```
cp cuda.rb /opt/gitlab/embedded/lib/ruby/gems/*.*.*/gems/rouge-*.*.*/lib/rouge/lexers
```


