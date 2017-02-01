# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

	top = 500
	footer_pos = $(document).height() - 380
	window.onscroll = ->
		if $(window).scrollTop() > top 
			$('#sidebar').addClass 'fixNav'
			$('#sidebar').css top: 0 

		if $(window).scrollTop() < top 
			$('#sidebar').css top: 5
			$('#sidebar').removeClass 'fixNav'

		return
	return
	

$(document).on 'page:load', ->
	window['rangy'].initialized = false
	return

$(document).on 'turbolinks:load', ->
	$('[data-provider="summernote"]').each ->

		$(this).summernote {
			fontNames: [ 'Lato', 'Work Sans', 'Laila']
			toolbar: [
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
	    [
	      'insert'
	      [
	        'media'
	        'link'
	        'hr'
	        'video'
	        'picture'
	      ]
	    ]
	    [
	      'view'
	      [
	        'fullscreen'
	        'codeview'
	      ]
	    ]
	  ]
	  onpaste: (e) ->
		  bufferText = ((e.originalEvent or e).clipboardData or window.clipboardData).getData('Text')
		  e.preventDefault()
		  document.execCommand 'insertText', false, bufferText
		}
	return



