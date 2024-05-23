# set default target which is executed when no explicit target is provided on the cli
.DEFAULT_GOAL := default

.PHONY: default
default:
	# do nothing

.PHONY: check
check: checkquality checkstyle

.PHONY: checkstyle
checkstyle:
	vendor-bin/php-cs-fixer/vendor/bin/php-cs-fixer fix --dry-run --diff --stop-on-violation --allow-risky=yes
	vendor-bin/phpcs/vendor/bin/phpcs -s --standard=Magento2 --exclude=Magento2.Annotation.MethodAnnotationStructure,Magento2.CodeAnalysis.EmptyBlock --ignore=./vendor/,./vendor-bin/ .
	vendor-bin/phpcs/vendor/bin/phpcs -s --standard=PHPCompatibility --runtime-set testVersion 8.2- --ignore=./vendor/,./vendor-bin/ .
	vendor/bin/composer normalize --dry-run

.PHONY: checkquality
checkquality:
	vendor-bin/phpstan/vendor/bin/phpstan analyse

	xmllint --noout --schema vendor/magento/framework/Module/etc/module.xsd   etc/module.xml
