# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('.responsive-tabs').responsiveTabs accordionOn: ['xs']

	top = 260
	window.onscroll = ->
		if $(window).scrollTop() > top 
			$('#sidebar').stop(false, true).animate().addClass 'fixNav'
			$('#sidebar').css top: 10 

	#	if $(window).scrollTop() > $(window).height() - 350
	#		$('#sidebar').removeClass 'fixNav'
	#		$('#sidebar').css top: ''
	#		$('#sidebar').css bottom: 0

		if $(window).scrollTop() < top 
			$('#sidebar').css top: 30
			$('#sidebar').stop(false, true).animate().removeClass 'fixNav'
		return
	return
	

$(document).on 'page:load', ->
	window['rangy'].initialized = false
	return

$(document).on 'turbolinks:load', ->
	$('[data-provider="summernote"]').each ->
		$(this).summernote {}
	return

