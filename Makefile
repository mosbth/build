#!/usr/bin/make -f
#
# Build and development environment using make
#
COMPOSER_PACKAGES = 					\
	"phpunit/phpunit=4.*" 				\
	"sebastian/phpcpd=2.*"				\
	"phploc/phploc=2.*"					\
	"phpdocumentor/phpdocumentor=2.*"	\
	"squizlabs/php_codesniffer=2.*"		\
	"phpmd/phpmd=@stable"				\

NPM_PACKAGES = 							\
	htmlhint							\
	csslint								\

APM_PACKAGES = 							\
	linter 								\
	linter-htmlhint 					\
	linter-csslint 						\
	linter-less 						\
	linter-jscs 						\
	linter-jshint 						\
	linter-pep8 						\
	linter-pylint 						\
	linter-php 							\
	linter-phpcs 						\
	linter-phpmd 						\
	linter-shellcheck 					\
	linter-xmllint						\
	block-travel 						\



#
# All
#
.PHONY: config install update

config: npm-config
	
install: composer-require npm-install apm-install

update: composer-update npm-update apm-update



#
# composer
#
.PHONY: composer-require composer-update

composer-require: 
	composer --sort-packages --update-no-dev global require $(COMPOSER_PACKAGES)

composer-update:
	composer --no-dev global update



#
# npm
#
.PHONY: npm-config npm-installl npm-update

npm-config: 
	npm config set prefix '~/.npm-packages'
	
npm-install: 
	npm -g install $(NPM_PACKAGES)

npm-update: 
	npm -g update



#
# apm
#
.PHONY: apm-installl apm-update

apm-install: 
	apm install $(APM_PACKAGES)

apm-update:
	apm update
