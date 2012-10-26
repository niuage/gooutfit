class Masonry
  constructor: (options) ->
    options = $.extend
      collection: "[data-masonry]",
      options
    @$collection = $(options.collection)
    @masonryOptions = options.masonryOptions
    console.log @$collection

  setup: ->
    @$collection.imagesLoaded =>
      @$collection.masonry(@masonryOptions)

  @setup: (options = {}) ->
    new @(options).setup()

@App.Masonry = Masonry
