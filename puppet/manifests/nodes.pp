node /^\w*dev\w*$/, 'dev', default {
  include stdlib, 
  	apt, 
  	vim,  	
  	php, 
  	pear,  	
  	mongodb,
  	mysql,
  	sqlite,
  	git, 
  	multitail, 
  	nodejs,
  	mountpoints,
  	optipng,
  	ocr,
  	ant,
  	apache
  	#nginx,
  	#xdebug,
  	#sasscompass,
  	#databaseconfig,
  	#java,
	#tomcat 
}
