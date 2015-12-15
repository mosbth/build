#!/usr/bin/make -f
#
# Build and development environment using make
#
COMPOSER_PACKAGES = 					\
	"phpunit/phpunit" 					\
	"sebastian/phpcpd"					\
	"phploc/phploc"						\
	"phpdocumentor/phpdocumentor"		\
	"squizlabs/php_codesniffer"			\
	"phpmd/phpmd"						\
	"behat/behat"						\

NPM_PACKAGES = 							\
	htmlhint							\
	csslint								\
	jshint								\
	jscs								\
	jsonlint							\
	less								\
	js-yaml								\
	html-minifier						\
	clean-css							\
	uglify-js							\

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
# less
#
SOURCE_LESS = app/less
BUILD_CSS   = build/css
TARGET_CSS  = htdocs/css

.PHONY: less

less:
	install -d $(BUILD_CSS)
	#lessc --clean-css app/css/style.less htdocs/css/style.css
	lessc --include-path=$(SOURCE_LESS) $(SOURCE_LESS)/style.less $(BUILD_CSS)/style.css
	install $(BUILD_CSS)/style.css $(TARGET_CSS)/style.css



#
# phpcs
#
.PHONY: phpcs

phpcs:
	phpcs --standard=.phpcs.xml app/ theme/ src/ test/



#
# phpcbf
#
.PHONY: phpcbf

phpcbf:
	phpcbf --standard=.phpcs.xml app/ theme/ src/ test/



#
# phpunit
#
.PHONY: phpunit

phpunit:
	phpunit --configuration .phpunit.xml



#
# phpdoc
#
.PHONY: phpdoc

phpdoc:
	phpdoc --config=.phpdoc.xml



#
# All developer tools
#
.PHONY: tools-config tools-install tools-update

tools-config: npm-config
	
tools-install: composer-require npm-install apm-install

tools-update: composer-update npm-update apm-update



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
.PHONY: npm-config npm-install npm-update

npm-config: 
	npm config set prefix '~/.npm-packages'
	
npm-install: 
	npm -g install $(NPM_PACKAGES)

npm-update: 
	npm -g update



#
# apm
#
.PHONY: apm-install apm-update

apm-install: 
	apm install $(APM_PACKAGES)

apm-update:
	apm update --confirm=false
