# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

	top = 300
	window.onscroll = ->
		if $(window).scrollTop() > top 
			$('#sidebar').addClass 'fixNav'
			$('#sidebar').css top: 0 

		if $(window).scrollTop() < top 
			$('#sidebar').css top: 10
			$('#sidebar').removeClass 'fixNav'
		return
	return
	

$(document).on 'page:load', ->
	window['rangy'].initialized = false
	return

$(document).on 'turbolinks:load', ->
	$('[data-provider="summernote"]').each ->
		$(this).summernote {
			fontNames: ['Work Sans', 'Lato', 'Laila']
			toolbar: [
	    [
	      'cleaner'
	      [ 'cleaner' ]
	    ]
	    [
	      'style'
	      [ 'style' ]
	    ]
	    [
	      'font'
	      [
	        'bold'
	        'italic'
	        'underline'
	        'clear'
	      ]
	    ]
	    [
	      'fontname'
	      [ 'fontname' ]
	    ]
#	    [
#	      'color'
#	      [ 'color' ]
#	    ]
	    [
	      'para'
	      [
	        'ul'
	        'ol'
	        'paragraph'
	      ]
	    ]
	    [
	      'height'
	      [ 'height' ]
	    ]
	#    [
	#      'table'
	#      [ 'table' ]
	#    ]
	    [
	      'insert'
	      [
	        'media'
	        'link'
	        'hr'
	      ]
	    ]
	    [
	      'view'
	      [
	        'fullscreen'
	        'codeview'
	      ]
	    ]
#	    [
#	      'help'
#	      [ 'help' ]
#	    ]
	  ]
	  cleaner:
	    notTime: 2400
	    action: 'both'
	    newline: '<br>'
	    notStyle: 'position:absolute;bottom:0;left:2px'
	    icon: '<i class="note-icon">Clean Text</i>'
	    keepHtml: false
	    badTags: [
	      'style'
	      'script'
	      'applet'
	      'embed'
	      'noframes'
	      'noscript'
	      'html'
	    ]
	    badAttributes: [
	      'style'
	      'start'
	    ]
		}
	return



