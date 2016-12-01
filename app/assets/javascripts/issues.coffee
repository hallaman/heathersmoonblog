# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	top = 340
	$('#sidebar').css marginBottom: $('#sidebar').height()
	window.onscroll = ->
		if $(window).scrollTop() > top
			$('#guide_navigation').addClass 'fix-nav'
			$('#sidebar').css top: 25
		else
			$('#guide_navigation').removeClass 'fix-nav'
			$('#sidebar').css top: 325
		return
	return

$(document).on 'page:load', ->
	window['rangy'].initialized = false
	return

$(document).on 'turbolinks:load', ->
	$('[data-provider="summernote"]').each ->
		$(this).summernote {}
	return