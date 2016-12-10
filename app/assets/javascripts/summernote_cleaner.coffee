((factory) ->
  if typeof define == 'function' and define.amd
    define [ 'jquery' ], factory
  else if typeof module == 'object' and module.exports
    module.exports = factory(require('jquery'))
  else
    factory window.jQuery
  return
) ($) ->
  $.extend true, $.summernote.lang, 'en-US': cleaner:
    tooltip: 'Cleaner'
    not: 'Text has been Cleaned!!!'
  $.extend $.summernote.options, cleaner:
    notTime: 2400
    action: 'both'
    newline: '<br>'
    notStyle: 'position:absolute;bottom:0;left:2px'
    icon: '<i class="note-icon"><svg xmlns="http://www.w3.org/2000/svg" id="libre-paintbrush" viewBox="0 0 14 14"><path d="m 11.821425,1 q 0.46875,0 0.82031,0.311384 0.35157,0.311384 0.35157,0.780134 0,0.421875 -0.30134,1.01116 -2.22322,4.212054 -3.11384,5.035715 -0.64956,0.609375 -1.45982,0.609375 -0.84375,0 -1.44978,-0.61942 -0.60603,-0.61942 -0.60603,-1.469866 0,-0.857143 0.61608,-1.419643 l 4.27232,-3.877232 Q 11.345985,1 11.821425,1 z m -6.08705,6.924107 q 0.26116,0.508928 0.71317,0.870536 0.45201,0.361607 1.00781,0.508928 l 0.007,0.475447 q 0.0268,1.426339 -0.86719,2.32366 Q 5.700895,13 4.261155,13 q -0.82366,0 -1.45982,-0.311384 -0.63616,-0.311384 -1.0212,-0.853795 -0.38505,-0.54241 -0.57924,-1.225446 -0.1942,-0.683036 -0.1942,-1.473214 0.0469,0.03348 0.27455,0.200893 0.22768,0.16741 0.41518,0.29799 0.1875,0.130581 0.39509,0.24442 0.20759,0.113839 0.30804,0.113839 0.27455,0 0.3683,-0.247767 0.16741,-0.441965 0.38505,-0.753349 0.21763,-0.311383 0.4654,-0.508928 0.24776,-0.197545 0.58928,-0.31808 0.34152,-0.120536 0.68974,-0.170759 0.34821,-0.05022 0.83705,-0.07031 z"/></svg></i>'
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
  $.extend $.summernote.plugins, 'cleaner': (context) ->
    self = this
    ui = $.summernote.ui
    $note = context.layoutInfo.note
    $editor = context.layoutInfo.editor
    options = context.options
    lang = options.langInfo

    cleanText = (txt, nlO) ->
      `var sS`
      `var out`
      `var nL`
      if options.cleaner.keepHtml
        sS = /(\n|\r| class=(")?Mso[a-zA-Z]+(")?)/g
        out = txt.replace(sS, ' ')
        nL = /(\n)+/g
        out = out.replace(nL, nlO)
        cS = new RegExp('<!--(.*?)-->', 'gi')
        out = out.replace(cS, '')
        tS = new RegExp('<(/)*(meta|link|span|\\?xml:|st1:|o:|font)(.*?)>', 'gi')
        out = out.replace(tS, '')
        bT = options.cleaner.badTags
        i = 0
        while i < bT.length
          tS = new RegExp('<' + bT[i] + '.*?' + bT[i] + '(.*?)>', 'gi')
          out = out.replace(tS, '')
          i++
        bA = options.cleaner.badAttributes
        ii = 0
        while ii < bA.length
          #var aS=new RegExp(' ('+bA[ii]+'="(.*?)")|('+bA[ii]+'=\'(.*?)\')','gi');
          aS = new RegExp(' ' + bA[ii] + '=[\'|"](.*?)[\'|"]', 'gi')
          out = out.replace(aS, '')
          ii++
      else
        sS = /(\r| class=(")?Mso[a-zA-Z]+(")?)/g
        out = txt.replace(sS, ' ')
        nL = /(\n)+/g
        out = out.replace(nL, nlO)
      out

    if options.cleaner.action == 'both' or options.cleaner.action == 'button'
      context.memo 'button.cleaner', ->
        button = ui.button(
          contents: options.cleaner.icon
          tooltip: lang.cleaner.tooltip
          click: ->
            `var text`
            if $note.summernote('createRange').toString()
              text = cleanText($note.summernote('createRange').toString(), options.cleaner.newline)
              $note.summernote 'pasteHTML', text
            else
              text = cleanText($note.summernote().text(), options.cleaner.newline)
              old = $note.summernote('code')
            $editor.find('.note-resizebar').append '<div class="summernote-cleanerAlert alert alert-success" style="' + options.cleaner.notStyle + '">' + lang.cleaner.not + '</div>'
            setTimeout (->
              $editor.find('.summernote-cleanerAlert').remove()
              return
            ), options.cleaner.notTime
            return
        )
        button.render()
    @events = 'summernote.paste': (we, e) ->
      `var text`
      `var text`
      if options.cleaner.action == 'both' or options.cleaner.action == 'paste'
        e.preventDefault()
        ua = window.navigator.userAgent
        msie = ua.indexOf('MSIE ')
        if msie > 0 or ! !navigator.userAgent.match(/Trident.*rv\:11\./)
          text = window.clipboardData.getData('Text')
        else
          text = e.originalEvent.clipboardData.getData(if options.cleaner.keepHtml then 'text/html' else 'text/plain')
        text = cleanText(text, options.cleaner.newline)
        if $note.summernote('createRange').toString()
          $note.summernote 'pasteHTML', text
        else
          old = $note.summernote('code')
          $note.summernote 'pasteHTML', old + text
        $editor.find('.note-resizebar').append '<div class="summernote-cleanerAlert alert alert-success" style="' + options.cleaner.notStyle + '">' + lang.cleaner.not + '</div>'
        setTimeout (->
          $editor.find('.summernote-cleanerAlert').remove()
          return
        ), options.cleaner.notTime
      return
    return
  return

# ---
# generated by js2coffee 2.2.0