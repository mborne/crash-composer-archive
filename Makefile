.PHONY: archive clean

all: archive

archive: composer.phar
	php composer.phar archive --dir=dist -f tar

composer.phar:
	wget -O composer.phar http://getcomposer.org/installer

clean:
	rm -rf composer.phar
	rm -rf dist

