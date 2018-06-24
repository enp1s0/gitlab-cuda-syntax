# GitLabでCUDAのSyntaxHighlightを行うための追加ファイル

> GitLab provides syntax highlighting on all files and snippets through the Rouge rubygem.

https://docs.gitlab.com/ee/user/project/highlighting.html

## How to install

### Find GitLab Rouge lexers path
```
find / -name lexers -type d 2>/dev/null | grep gitlab
```

### Copy cuda.rb
```
cp cuda.rb /path/to/gitlab/rouge/lexers/
```

