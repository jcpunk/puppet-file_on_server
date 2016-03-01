#
# file_on_server.rb
#

module Puppet::Parser::Functions
  newfunction(:file_on_server, :type => :rvalue, :doc => <<-EOS
This function returns the content of a file found on the puppet
master.

*Examples:*

    file_on_server('/secrets/myfile')

Would return whatever was contained within /secrets/myfile on
the puppet master
    EOS
  ) do |arguments|

    if (arguments.size != 1) then
      raise(Puppet::ParseError, "file_on_server(): Wrong number of arguments "+
        "given #{arguments.size} for 1")
    end

    contents = File.open(arguments[0], 'rb') { |f| f.read }

    return contents
  end
end

# vim: set ts=2 sw=2 et :
