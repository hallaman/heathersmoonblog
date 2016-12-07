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
		$(this).summernote {}
	return

