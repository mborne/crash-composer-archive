# crash-composer-archive

## Description

Reproduce composer crash in archive generation with strange filter in `.gitignore`.

## Problem

When `.gitignore` file contains "invalid" lines such as `/${ctx`, `composer archive` crash throwing an exception on the following line :

https://github.com/composer/composer/blob/1.6.5/src/Composer/Package/Archiver/BaseExcludeFilter.php#L62

```php
//...
            if (preg_match($pattern, $path)) {
                $exclude = !$negate;
            }
//...
```

```php
preg_match('{^/(?=[^\.])\$(ctx(?=$|/)}','/CHANGELOG.md')
// => preg_match(): Compilation failed: missing ) at offset 24
```

## Reproduce

```bash
git clone https://github.com/mborne/crash-composer-archive
cd crash-composer-archive
wget -O composer.phar http://getcomposer.org/installer
php composer.phar archive --dir=dist -f tar
```


## Impact

It stops `satis build` process when there is a problem in a single repository or single tag.






