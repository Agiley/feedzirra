$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

module Feedzirra
  def self.use_curb=(curb)
    @use_curb = curb
  end
  def self.use_curb?
    @use_curb
  end
  VERSION = "0.0.24"
end

if (defined?(JRUBY_VERSION))
  require 'net/http'
  Feedzirra.use_curb = false
else
  require 'curb'
  Feedzirra.use_curb = true
end

require 'zlib'
require 'sax-machine'
require 'loofah'
require 'uri'

require 'active_support/version'
require 'active_support/basic_object'
require 'active_support/core_ext/module'
require 'active_support/core_ext/kernel'
require 'active_support/core_ext/object'

if ActiveSupport::VERSION::MAJOR >= 3
  require 'active_support/time'
else
  require 'active_support/core_ext/time'
end

require 'core_ext/date'
require 'core_ext/string'

require 'feedzirra/feed_utilities'
require 'feedzirra/feed_entry_utilities'
require 'feedzirra/feed'

require 'feedzirra/parser/rss_entry'
require 'feedzirra/parser/itunes_rss_owner'
require 'feedzirra/parser/itunes_rss_item'
require 'feedzirra/parser/atom_entry'
require 'feedzirra/parser/atom_feed_burner_entry'

require 'feedzirra/parser/rss'
require 'feedzirra/parser/itunes_rss'
require 'feedzirra/parser/atom'
require 'feedzirra/parser/atom_feed_burner'