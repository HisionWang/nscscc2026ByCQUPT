# Project Git configurations

## gitattributes

没有人想在git里看到CRLF(^M)

**.gitattributes**
`**/*.[suffix] text   eol=lf`
以suffix为后缀的文件EOL都自动转换为LF

`chiplab/** -text`
chiplab下CRLF太多了，可能会出问题
默认clone其实为LF, windows下会r转换为CRLF, 可采用以下配置解决

建议Windows下git配置为:
```bash
git config --global core.symlinks true
git config --global core.autocrlf false
git config --global core.eol lf
```

## gitignore

from OpenXiangShan
