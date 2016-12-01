# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	top = 260
	$('#sidebar').css marginBottom: $('#sidebar').height()
	window.onscroll = ->
		if $(window).scrollTop() > top
			$('#guide_navigation').addClass 'fix-nav'
			$('#sidebar').css top: 35
		else
			$('#guide_navigation').removeClass 'fix-nav'
			$('#sidebar').css top: 335
		return
	return

$(document).on 'page:load', ->
	window['rangy'].initialized = false
	return

$(document).on 'turbolinks:load', ->
	$('[data-provider="summernote"]').each ->
		$(this).summernote {}
	return