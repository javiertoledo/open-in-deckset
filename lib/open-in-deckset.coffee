{CompositeDisposable} = require 'atom'
exec = require('child_process').exec

module.exports =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-deckset:open', => @openInDeckset()

  deactivate: ->
    @subscriptions.destroy()

  openInDeckset: () ->
    editor = atom.workspace.getActiveTextEditor()
    filename = editor.buffer.file.path
    exec "open -a Deckset '#{filename}'"
