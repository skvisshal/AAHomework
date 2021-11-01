  class LRUCache
    def initialize(size)
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.length == 4
        @cache.shift
        @cache.push(el)
      else
        @cache.push(el)
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      puts @cache
    end

    private
    # helper methods go here!

  end