.PHONY: archive clean

all: archive

archive: composer.phar
	php composer.phar archive --dir=dist -f tar

composer.phar:
	wget -O composer.phar https://getcomposer.org/download/1.6.5/composer.phar

clean:
	rm -rf composer.phar
	rm -rf dist

