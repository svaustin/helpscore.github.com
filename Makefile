ASSETS_CSS = ./assets/css
BOOTSTRAP_LESS = ./assets/less/bootstrap/bootstrap.less
HELPSCORE_LESS = ./assets/less/helpscore/helpscore.less
LESS_COMPRESSOR ?= `which lessc`
WATCHR ?= `which watchr`

#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# lessc & uglifyjs are required
#

bootstrap:
	mkdir -p assets/img
	mkdir -p assets/css
	mkdir -p assets/js
	lessc ${BOOTSTRAP_LESS} > ./assets/css/bootstrap.css
	lessc --compress ${BOOTSTRAP_LESS} > ./assets/css/bootstrap.min.css

	# now javascript
	cat assets/js/bootstrap-transition.js assets/js/bootstrap-alert.js assets/js/bootstrap-button.js assets/js/bootstrap-carousel.js assets/js/bootstrap-collapse.js assets/js/bootstrap-dropdown.js assets/js/bootstrap-modal.js assets/js/bootstrap-tooltip.js assets/js/bootstrap-popover.js assets/js/bootstrap-scrollspy.js assets/js/bootstrap-tab.js assets/js/bootstrap-typeahead.js > assets/js/bootstrap.js
	uglifyjs -nc ./assets/js/bootstrap.js > assets/js/bootstrap.min.js

  # and helpscore
	lessc ${HELPSCORE_LESS} > ${ASSETS_CSS}/helpscore.css
	lessc --compress ${HELPSCORE_LESS} > ${ASSETS_CSS}/helpscore.min.css

watch:
	echo "Watching less files..."; \
	watchr -e "watch('assets/less/.*\.less') { system 'make' }"

